module System._Interface.IAppDomainSetup;


public interface IAppDomainSetup {
	@property string ApplicationBase();
	@property void ApplicationBase(string);

	@property string ApplicationName();
	@property void ApplicationName(string);

	@property string CachePath();
	@property void CachePath(string);

	@property string ConfigurationFile();
	@property void ConfigurationFile(string);

	@property string DynamicBase();
	@property void DynamicBase(string);

	@property string LicenseFile();
	@property void LicenseFile(string);

	@property string PrivateBinPath();
	@property void PrivateBinPath(string);

	@property string PrivateBinPathProbe();
	@property void PrivateBinPathProbe(string);

	@property string ShadowCopyDirectories();
	@property void ShadowCopyDirectories(string);

	@property string ShadowCopyFiles();
	@property void ShadowCopyFiles(string);
}