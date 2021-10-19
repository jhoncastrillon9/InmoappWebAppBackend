using Microsoft.EntityFrameworkCore;

namespace DataAccess.Data
{
    public partial class InmmoAppContext : DbContext
    {
        public InmmoAppContext()
        {
        }

        public InmmoAppContext(DbContextOptions<InmmoAppContext> options)
            : base(options)
        {
        }


        public virtual DbSet<AccountsStatus> AccountsStatus { get; set; }
        public virtual DbSet<AccountsToPayContract> AccountsToPayContract { get; set; }
        public virtual DbSet<AccountsToReceivableContract> AccountsToReceivableContract { get; set; }
        public virtual DbSet<BankAccount> BankAccount { get; set; }
        public virtual DbSet<City> City { get; set; }
        public virtual DbSet<Company> Company { get; set; }
        public virtual DbSet<Contract> Contract { get; set; }
        public virtual DbSet<ContractsStatus> ContractsStatus { get; set; }
        public virtual DbSet<HistoryBankAccount> HistoryBankAccount { get; set; }
        public virtual DbSet<Images> Images { get; set; }
        public virtual DbSet<Iva> Iva { get; set; }
        public virtual DbSet<Neighborhood> Neighborhood { get; set; }
        public virtual DbSet<Owner> Owner { get; set; }
        public virtual DbSet<PaymentType> PaymentType { get; set; }
        public virtual DbSet<Property> Property { get; set; }
        public virtual DbSet<PropertyCategory> PropertyCategory { get; set; }
        public virtual DbSet<PropertyStatus> PropertyStatus { get; set; }
        public virtual DbSet<Role> Role { get; set; }
        public virtual DbSet<State> State { get; set; }
        public virtual DbSet<Tenant> Tenant { get; set; }
        public virtual DbSet<TenantsByContract> TenantsByContract { get; set; }
        public virtual DbSet<TypeOffer> TypeOffer { get; set; }
        public virtual DbSet<User> User { get; set; }
        public virtual DbSet<UserByRole> UserByRole { get; set; }
        public virtual DbSet<UserType> UserType { get; set; }
        public virtual DbSet<Zone> Zone { get; set; }



        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<AccountsStatus>(entity =>
            {
                entity.ToTable("AccountsStatus", "Banks");

                entity.Property(e => e.AccountsStatusName).HasMaxLength(50);
            });

            modelBuilder.Entity<AccountsToPayContract>(entity =>
            {
                entity.ToTable("AccountsToPayContract", "Banks");

                entity.Property(e => e.ExpirationDate).HasColumnType("date");

                entity.HasOne(d => d.AccountsStatus)
                    .WithMany(p => p.AccountsToPayContract)
                    .HasForeignKey(d => d.AccountsStatusId)
                    .HasConstraintName("FK__AccountsT__Accou__0F624AF8");

                entity.HasOne(d => d.Compay)
                    .WithMany(p => p.AccountsToPayContract)
                    .HasForeignKey(d => d.CompayId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__AccountsT__Compa__114A936A");

                entity.HasOne(d => d.Contract)
                    .WithMany(p => p.AccountsToPayContract)
                    .HasForeignKey(d => d.ContractId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__AccountsT__Contr__10566F31");
            });

            modelBuilder.Entity<AccountsToReceivableContract>(entity =>
            {
                entity.ToTable("AccountsToReceivableContract", "Banks");

                entity.Property(e => e.ExpirationDate).HasColumnType("date");

                entity.HasOne(d => d.AccountsStatus)
                    .WithMany(p => p.AccountsToReceivableContract)
                    .HasForeignKey(d => d.AccountsStatusId)
                    .HasConstraintName("FK__AccountsT__Accou__14270015");

                entity.HasOne(d => d.Compay)
                    .WithMany(p => p.AccountsToReceivableContract)
                    .HasForeignKey(d => d.CompayId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__AccountsT__Compa__160F4887");

                entity.HasOne(d => d.Contract)
                    .WithMany(p => p.AccountsToReceivableContract)
                    .HasForeignKey(d => d.ContractId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__AccountsT__Contr__151B244E");
            });

            modelBuilder.Entity<BankAccount>(entity =>
            {
                entity.ToTable("BankAccount", "Banks");

                entity.Property(e => e.BankAccountName)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.HasOne(d => d.Compay)
                    .WithMany(p => p.BankAccount)
                    .HasForeignKey(d => d.CompayId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__BankAccou__Compa__18EBB532");
            });

            modelBuilder.Entity<City>(entity =>
            {
                entity.ToTable("City", "Commons");

                entity.Property(e => e.CityName)
                    .IsRequired()
                    .HasMaxLength(100);

                entity.HasOne(d => d.State)
                    .WithMany(p => p.City)
                    .HasForeignKey(d => d.StateId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__City__StateId__656C112C");
            });

            modelBuilder.Entity<Company>(entity =>
            {
                entity.HasKey(e => e.CompayId);

                entity.ToTable("Company", "Companies");

                entity.Property(e => e.Address).HasMaxLength(200);

                entity.Property(e => e.CompanyName)
                    .IsRequired()
                    .HasMaxLength(200);

                entity.Property(e => e.Document).HasMaxLength(50);

                entity.Property(e => e.Email).HasMaxLength(80);

                entity.Property(e => e.Mobile).HasMaxLength(30);

                entity.Property(e => e.Observation).HasMaxLength(500);

                entity.Property(e => e.Telephone).HasMaxLength(30);
            });

            modelBuilder.Entity<Contract>(entity =>
            {
                entity.ToTable("Contract", "Contracts");

                entity.Property(e => e.ContractDate).HasColumnType("date");

                entity.Property(e => e.InnitialDate).HasColumnType("date");

                entity.Property(e => e.Observation).HasMaxLength(300);

                entity.HasOne(d => d.Compay)
                    .WithMany(p => p.Contract)
                    .HasForeignKey(d => d.CompayId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__Contract__Compay__07C12930");

                entity.HasOne(d => d.Property)
                    .WithMany(p => p.Contract)
                    .HasForeignKey(d => d.PropertyId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__Contract__Proper__05D8E0BE");

                entity.HasOne(d => d.Status)
                    .WithMany(p => p.Contract)
                    .HasForeignKey(d => d.StatusId)
                    .HasConstraintName("FK__Contract__Status__04E4BC85");

                entity.HasOne(d => d.Tenant)
                    .WithMany(p => p.Contract)
                    .HasForeignKey(d => d.TenantId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__Contract__Tenant__06CD04F7");
            });

            modelBuilder.Entity<ContractsStatus>(entity =>
            {
                entity.ToTable("ContractsStatus", "Contracts");

                entity.Property(e => e.ContractsStatusName)
                    .IsRequired()
                    .HasMaxLength(200);
            });

            modelBuilder.Entity<HistoryBankAccount>(entity =>
            {
                entity.ToTable("HistoryBankAccount", "Banks");

                entity.Property(e => e.Obervation)
                    .IsRequired()
                    .HasMaxLength(500);

                entity.HasOne(d => d.AccountsToPayContracts)
                    .WithMany(p => p.HistoryBankAccount)
                    .HasForeignKey(d => d.AccountsToPayContractsId)
                    .HasConstraintName("FK__HistoryBa__Accou__208CD6FA");

                entity.HasOne(d => d.AccountsToReceivableContracts)
                    .WithMany(p => p.HistoryBankAccount)
                    .HasForeignKey(d => d.AccountsToReceivableContractsId)
                    .HasConstraintName("FK__HistoryBa__Accou__2180FB33");

                entity.HasOne(d => d.BankAccount)
                    .WithMany(p => p.HistoryBankAccount)
                    .HasForeignKey(d => d.BankAccountId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__HistoryBa__BankA__1F98B2C1");

                entity.HasOne(d => d.Compay)
                    .WithMany(p => p.HistoryBankAccount)
                    .HasForeignKey(d => d.CompayId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__HistoryBa__Compa__22751F6C");

                entity.HasOne(d => d.PaymentType)
                    .WithMany(p => p.HistoryBankAccount)
                    .HasForeignKey(d => d.PaymentTypeId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__HistoryBa__Payme__1EA48E88");
            });

            modelBuilder.Entity<Images>(entity =>
            {
                entity.HasKey(e => e.ImageId);

                entity.ToTable("Images", "Properties");

                entity.Property(e => e.ImageName).HasMaxLength(50);

                entity.Property(e => e.Path)
                    .IsRequired()
                    .HasMaxLength(150);

                entity.HasOne(d => d.Property)
                    .WithMany(p => p.Images)
                    .HasForeignKey(d => d.PropertyId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__Images__Property__7D439ABD");
            });

            modelBuilder.Entity<Iva>(entity =>
            {
                entity.ToTable("Iva", "Properties");
            });

            modelBuilder.Entity<Neighborhood>(entity =>
            {
                entity.ToTable("Neighborhood", "Commons");

                entity.Property(e => e.NeighborhoodName)
                    .IsRequired()
                    .HasMaxLength(200);

                entity.HasOne(d => d.Zone)
                    .WithMany(p => p.Neighborhood)
                    .HasForeignKey(d => d.ZoneId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__Neighborh__ZoneI__6B24EA82");
            });

            modelBuilder.Entity<Owner>(entity =>
            {
                entity.ToTable("Owner", "Owners");

                entity.Property(e => e.Address).HasMaxLength(200);

                entity.Property(e => e.Document).HasMaxLength(50);

                entity.Property(e => e.Email).HasMaxLength(80);

                entity.Property(e => e.Mobile).HasMaxLength(30);

                entity.Property(e => e.Observation).HasMaxLength(500);

                entity.Property(e => e.OwnerName)
                    .IsRequired()
                    .HasMaxLength(200);

                entity.Property(e => e.Telephone).HasMaxLength(30);

                entity.HasOne(d => d.Compay)
                    .WithMany(p => p.Owner)
                    .HasForeignKey(d => d.CompayId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__Owner__CompayId__5EBF139D");
            });

            modelBuilder.Entity<PaymentType>(entity =>
            {
                entity.ToTable("PaymentType", "Banks");

                entity.Property(e => e.PaymentTypeName)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.HasOne(d => d.Compay)
                    .WithMany(p => p.PaymentType)
                    .HasForeignKey(d => d.CompayId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__PaymentTy__Compa__1BC821DD");
            });

            modelBuilder.Entity<Property>(entity =>
            {
                entity.ToTable("Property", "Properties");

                entity.Property(e => e.Address)
                    .IsRequired()
                    .HasMaxLength(200);

                entity.Property(e => e.Code)
                    .IsRequired()
                    .HasMaxLength(100);

                entity.Property(e => e.Description).HasMaxLength(500);

                entity.Property(e => e.Observation).HasMaxLength(500);

                entity.Property(e => e.RecruitmentDate).HasColumnType("date");

                entity.Property(e => e.Title).HasMaxLength(100);

                entity.HasOne(d => d.City)
                    .WithMany(p => p.Property)
                    .HasForeignKey(d => d.CityId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__Property__CityId__75A278F5");

                entity.HasOne(d => d.Compay)
                    .WithMany(p => p.Property)
                    .HasForeignKey(d => d.CompayId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__Property__Compay__7A672E12");

                entity.HasOne(d => d.IdIvaNavigation)
                    .WithMany(p => p.Property)
                    .HasForeignKey(d => d.IdIva)
                    .HasConstraintName("FK__Property__IdIva__73BA3083");

                entity.HasOne(d => d.Owner)
                    .WithMany(p => p.Property)
                    .HasForeignKey(d => d.OwnerId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__Property__OwnerI__778AC167");

                entity.HasOne(d => d.PropertyCategory)
                    .WithMany(p => p.Property)
                    .HasForeignKey(d => d.PropertyCategoryId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__Property__Proper__787EE5A0");

                entity.HasOne(d => d.PropertyStatus)
                    .WithMany(p => p.Property)
                    .HasForeignKey(d => d.PropertyStatusId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__Property__Proper__74AE54BC");

                entity.HasOne(d => d.TypeOffer)
                    .WithMany(p => p.Property)
                    .HasForeignKey(d => d.TypeOfferId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__Property__TypeOf__797309D9");

                entity.HasOne(d => d.Zone)
                    .WithMany(p => p.Property)
                    .HasForeignKey(d => d.ZoneId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__Property__ZoneId__76969D2E");
            });

            modelBuilder.Entity<PropertyCategory>(entity =>
            {
                entity.ToTable("PropertyCategory", "Properties");

                entity.Property(e => e.CategoryName)
                    .IsRequired()
                    .HasMaxLength(200);
            });

            modelBuilder.Entity<PropertyStatus>(entity =>
            {
                entity.ToTable("PropertyStatus", "Properties");

                entity.Property(e => e.PropertyStatusName)
                    .IsRequired()
                    .HasMaxLength(200);
            });

            modelBuilder.Entity<Role>(entity =>
            {
                entity.ToTable("Role", "Users");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(200);
            });

            modelBuilder.Entity<State>(entity =>
            {
                entity.ToTable("State", "Commons");

                entity.Property(e => e.StateName)
                    .IsRequired()
                    .HasMaxLength(100);
            });

            modelBuilder.Entity<Tenant>(entity =>
            {
                entity.ToTable("Tenant", "Tenants");

                entity.Property(e => e.Address).HasMaxLength(200);

                entity.Property(e => e.Document).HasMaxLength(50);

                entity.Property(e => e.Email).HasMaxLength(80);

                entity.Property(e => e.Mobile)
                    .IsRequired()
                    .HasMaxLength(30);

                entity.Property(e => e.Observation).HasMaxLength(500);

                entity.Property(e => e.Telephone).HasMaxLength(30);

                entity.Property(e => e.TenantName)
                    .IsRequired()
                    .HasMaxLength(200);

                entity.HasOne(d => d.Compay)
                    .WithMany(p => p.Tenant)
                    .HasForeignKey(d => d.CompayId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__Tenant__CompayId__00200768");
            });

            modelBuilder.Entity<TenantsByContract>(entity =>
            {
                entity.ToTable("TenantsByContract", "Contracts");

                entity.Property(e => e.Profile).HasMaxLength(300);

                entity.HasOne(d => d.Tenant)
                    .WithMany(p => p.TenantsByContract)
                    .HasForeignKey(d => d.TenantId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__TenantsBy__Tenan__0A9D95DB");
            });

            modelBuilder.Entity<TypeOffer>(entity =>
            {
                entity.ToTable("TypeOffer", "Properties");

                entity.Property(e => e.TypeOfferName)
                    .IsRequired()
                    .HasMaxLength(200);
            });

            modelBuilder.Entity<User>(entity =>
            {
                entity.ToTable("User", "CodeMono");

                entity.Property(e => e.Active)
                    .IsRequired()
                    .HasDefaultValueSql("((1))");

                entity.Property(e => e.Avatar)
                    .HasMaxLength(45)
                    .IsUnicode(false);

                entity.Property(e => e.CreatedAt)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.DisabledAt).HasColumnType("datetime");

                entity.Property(e => e.FirstName)
                    .IsRequired()
                    .HasMaxLength(45)
                    .IsUnicode(false);

                entity.Property(e => e.LastName)
                    .IsRequired()
                    .HasMaxLength(45)
                    .IsUnicode(false);

                entity.Property(e => e.Password)
                    .IsRequired()
                    .HasMaxLength(45)
                    .IsUnicode(false);

                entity.Property(e => e.UpdatedAt).HasColumnType("datetime");

                entity.Property(e => e.Username)
                    .IsRequired()
                    .HasMaxLength(45)
                    .IsUnicode(false);

                entity.HasOne(d => d.Company)
                    .WithMany(p => p.User)
                    .HasForeignKey(d => d.CompanyId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__User__CompanyId__57A801BA");

                entity.HasOne(d => d.UserType)
                    .WithMany(p => p.User)
                    .HasForeignKey(d => d.UserTypeId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_CodeMono_UserTypeId");
            });

            modelBuilder.Entity<UserByRole>(entity =>
            {
                entity.ToTable("UserByRole", "Users");

                entity.HasOne(d => d.Role)
                    .WithMany(p => p.UserByRole)
                    .HasForeignKey(d => d.RoleId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__UserByRol__RoleI__53D770D6");

                entity.HasOne(d => d.User)
                    .WithMany(p => p.UserByRole)
                    .HasForeignKey(d => d.UserId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__UserByRol__UserI__52E34C9D");
            });

            modelBuilder.Entity<UserType>(entity =>
            {
                entity.ToTable("UserType", "CodeMono");

                entity.Property(e => e.UserTypeId).ValueGeneratedNever();

                entity.Property(e => e.Active)
                    .IsRequired()
                    .HasDefaultValueSql("((1))");

                entity.Property(e => e.CreatedAt)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.DisabledAt).HasColumnType("datetime");

                entity.Property(e => e.UpdatedAt).HasColumnType("datetime");

                entity.Property(e => e.UserTypeName)
                    .IsRequired()
                    .HasMaxLength(50)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<Zone>(entity =>
            {
                entity.ToTable("Zone", "Commons");

                entity.Property(e => e.ZoneName)
                    .IsRequired()
                    .HasMaxLength(200);

                entity.HasOne(d => d.City)
                    .WithMany(p => p.Zone)
                    .HasForeignKey(d => d.CityId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__Zone__CityId__68487DD7");
            });
        }
    }
}
