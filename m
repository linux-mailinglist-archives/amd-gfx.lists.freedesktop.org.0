Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 856367B8084
	for <lists+amd-gfx@lfdr.de>; Wed,  4 Oct 2023 15:16:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBCB110E374;
	Wed,  4 Oct 2023 13:16:13 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 552BE10E10C;
 Wed,  4 Oct 2023 12:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696420841; x=1727956841;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=7KbxBlprXrDW/E6ji/+s9I0SIdE2VYxtruI+5fMSfsc=;
 b=gZiKgdzSMbgfeG07YD8FLigHRrp0aZIsm/jrjv1vh8M+Dt3nRKZfNdSF
 usodRm6G5YN9ol6n82yB/oFDtBCFF1H/j71hrih7RqpQwh1zF9ccMwGME
 xCm6vigI2XQeeCcZ+KaE95yJAJa0EuPjY9rXYtJZ2gby+YMJnoyKj6LwL
 SGF0HQ6dHA6QgzvNFpW1dotWEzGu+O+7ofd0JmWfZUj76F6ve6nRo0fgA
 v2u/YCPCtclzi4qH19qyFzcejpgB5B6nIMm3cdcIr/gg1iwTE5n72WFtS
 JzaHSwGGVuz+Dx5wt9F/cMh+LhHfdIHhSwixPY8fasKXqQQfJD5EM3Mo+ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="414062437"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; d="scan'208";a="414062437"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 05:00:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="817062104"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; d="scan'208";a="817062104"
Received: from cyrillet-mobl.ger.corp.intel.com ([10.252.55.203])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 05:00:36 -0700
Date: Wed, 4 Oct 2023 15:00:33 +0300 (EEST)
From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: Re: [PATCH v2 04/16] platform/x86/amd/pmf: Add support for PMF Policy
 Binary
In-Reply-To: <20230930083715.2050863-5-Shyam-sundar.S-k@amd.com>
Message-ID: <d05080a8-1d9f-f36c-6569-f81a94258f7a@linux.intel.com>
References: <20230930083715.2050863-1-Shyam-sundar.S-k@amd.com>
 <20230930083715.2050863-5-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Mailman-Approved-At: Wed, 04 Oct 2023 13:16:11 +0000
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: Xinhui.Pan@amd.com, Patil.Reddy@amd.com, basavaraj.natikar@amd.com,
 dri-devel@lists.freedesktop.org, jikos@kernel.org,
 amd-gfx@lists.freedesktop.org, platform-driver-x86@vger.kernel.org,
 markgross@kernel.org, Hans de Goede <hdegoede@redhat.com>,
 benjamin.tissoires@redhat.com, mario.limonciello@amd.com, daniel@ffwll.ch,
 linux-input@vger.kernel.org, alexander.deucher@amd.com, airlied@gmail.com,
 christian.koenig@amd.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Sat, 30 Sep 2023, Shyam Sundar S K wrote:

> PMF Policy binary is a encrypted and signed binary that will be part
> of the BIOS. PMF driver via the ACPI interface checks the existence
> of Smart PC bit. If the advertised bit is found, PMF driver walks
> the acpi namespace to find out the policy binary size and the address
> which has to be passed to the TA during the TA init sequence.
> 
> The policy binary is comprised of inputs (or the events) and outputs
> (or the actions). With the PMF ecosystem, OEMs generate the policy
> binary (or could be multiple binaries) that contains a supported set
> of inputs and outputs which could be specifically carved out for each
> usage segment (or for each user also) that could influence the system
> behavior either by enriching the user experience or/and boost/throttle
> power limits.
> 
> Once the TA init command succeeds, the PMF driver sends the changing
> events in the current environment to the TA for a constant sampling
> frequency time (the event here could be a lid close or open) and
> if the policy binary has corresponding action built within it, the
> TA sends the action for it in the subsequent enact command.
> 
> If the inputs sent to the TA has no output defined in the policy
> binary generated by OEMs, there will be no action to be performed
> by the PMF driver.
> 
> Example policies:
> 
> 1) if slider is performance ; set the SPL to 40W
> Here PMF driver registers with the platform profile interface and
> when the slider position is changed, PMF driver lets the TA know
> about this. TA sends back an action to update the Sustained
> Power Limit (SPL). PMF driver updates this limit via the PMFW mailbox.
> 
> 2) if user_away ; then lock the system
> Here PMF driver hooks to the AMD SFH driver to know the user presence
> and send the inputs to TA and if the condition is met, the TA sends
> the action of locking the system. PMF driver generates a uevent and
> based on the udev rule in the userland the system gets locked with
> systemctl.
> 
> The intent here is to provide the OEM's to make a policy to lock the
> system when the user is away ; but the userland can make a choice to
> ignore it.
> 
> and so on.
> 
> The OEMs will have an utility to create numerous such policies and
> the policies shall be reviewed by AMD before signing and encrypting
> them. Policies are shared between operating systems to have seemless user
> experience.
> 
> Since all this action has to happen via the "amdtee" driver, currently
> there is no caller for it in the kernel which can load the amdtee driver.
> Without amdtee driver loading onto the system the "tee" calls shall fail
> from the PMF driver. Hence an explicit "request_module" has been added
> to address this.
> 
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  drivers/platform/x86/amd/pmf/Kconfig  |   1 +
>  drivers/platform/x86/amd/pmf/acpi.c   |  37 +++++++
>  drivers/platform/x86/amd/pmf/core.c   |  12 +++
>  drivers/platform/x86/amd/pmf/pmf.h    | 135 ++++++++++++++++++++++++
>  drivers/platform/x86/amd/pmf/tee-if.c | 141 +++++++++++++++++++++++++-
>  5 files changed, 324 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmf/Kconfig b/drivers/platform/x86/amd/pmf/Kconfig
> index 3064bc8ea167..437b78c6d1c5 100644
> --- a/drivers/platform/x86/amd/pmf/Kconfig
> +++ b/drivers/platform/x86/amd/pmf/Kconfig
> @@ -9,6 +9,7 @@ config AMD_PMF
>  	depends on POWER_SUPPLY
>  	depends on AMD_NB
>  	select ACPI_PLATFORM_PROFILE
> +	depends on AMDTEE
>  	help
>  	  This driver provides support for the AMD Platform Management Framework.
>  	  The goal is to enhance end user experience by making AMD PCs smarter,
> diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
> index 3fc5e4547d9f..d0512af2cd42 100644
> --- a/drivers/platform/x86/amd/pmf/acpi.c
> +++ b/drivers/platform/x86/amd/pmf/acpi.c
> @@ -286,6 +286,43 @@ int apmf_install_handler(struct amd_pmf_dev *pmf_dev)
>  	return 0;
>  }
>  
> +static acpi_status apmf_walk_resources(struct acpi_resource *res, void *data)
> +{
> +	struct amd_pmf_dev *dev = data;
> +
> +	switch (res->type) {
> +	case ACPI_RESOURCE_TYPE_ADDRESS64:
> +		dev->policy_addr = res->data.address64.address.minimum;
> +		dev->policy_sz = res->data.address64.address.address_length;
> +		break;
> +	case ACPI_RESOURCE_TYPE_FIXED_MEMORY32:
> +		dev->policy_addr = res->data.fixed_memory32.address;
> +		dev->policy_sz = res->data.fixed_memory32.address_length;
> +		break;
> +	}
> +
> +	if (!dev->policy_addr || dev->policy_sz > POLICY_BUF_MAX_SZ || dev->policy_sz == 0) {
> +		pr_err("Incorrect Policy params, possibly a SBIOS bug\n");
> +		return AE_ERROR;
> +	}
> +
> +	return AE_OK;
> +}
> +
> +int apmf_check_smart_pc(struct amd_pmf_dev *pmf_dev)
> +{
> +	acpi_handle ahandle = ACPI_HANDLE(pmf_dev->dev);
> +	acpi_status status;
> +
> +	status = acpi_walk_resources(ahandle, METHOD_NAME__CRS, apmf_walk_resources, pmf_dev);
> +	if (ACPI_FAILURE(status)) {
> +		dev_err(pmf_dev->dev, "acpi_walk_resources failed\n");
> +		return status;
> +	}
> +
> +	return 0;
> +}
> +
>  void apmf_acpi_deinit(struct amd_pmf_dev *pmf_dev)
>  {
>  	acpi_handle ahandle = ACPI_HANDLE(pmf_dev->dev);
> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
> index 678dce4fea08..787f25511191 100644
> --- a/drivers/platform/x86/amd/pmf/core.c
> +++ b/drivers/platform/x86/amd/pmf/core.c
> @@ -384,6 +384,18 @@ static int amd_pmf_probe(struct platform_device *pdev)
>  		return -ENOMEM;
>  
>  	dev->dev = &pdev->dev;
> +	err = apmf_check_smart_pc(dev);
> +	if (!err) {
> +		/* in order for Smart PC solution to work it has a hard dependency
> +		 * on the amdtee driver to be loaded first even before the PMF driver
> +		 * loads. PMF ASL has a _CRS method that advertises the existence
> +		 * of Smart PC bit. If this information is present, use this to
> +		 * explicitly probe the amdtee driver, so that "tee" plumbing is done
> +		 * before the PMF Smart PC init happens.
> +		 */

But please follow no-text on /* line formatting for multiline comments. 
Also start with a capital letter.


> +		if (request_module("amdtee"))

Are you aware that this won't give you very strong guarantees about 
anything if request_module()'s function comments is to be believed?

If that's all what you're after, MODULE_SOFTDEP("pre: amdtee"); is 
probably enough (and I unfortunately don't know the answer how to do it if 
you want something stronger than that when you don't directly depend on 
the symbols of the other module).

> +			pr_err("Failed to load amdtee. PMF Smart PC not enabled!\n");
> +	}
>  
>  	rdev = pci_get_domain_bus_and_slot(0, 0, PCI_DEVFN(0, 0));
>  	if (!rdev || !pci_match_id(pmf_pci_ids, rdev)) {
> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
> index 3930b8ed8333..6f4b6f4ecee4 100644
> --- a/drivers/platform/x86/amd/pmf/pmf.h
> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> @@ -14,6 +14,11 @@
>  #include <linux/acpi.h>
>  #include <linux/platform_profile.h>
>  
> +#define POLICY_BUF_MAX_SZ		0x4b000
> +#define POLICY_SIGN_COOKIE		0x31535024
> +#define POLICY_COOKIE_OFFSET		0x10
> +#define POLICY_COOKIE_LEN		0x14
> +
>  /* APMF Functions */
>  #define APMF_FUNC_VERIFY_INTERFACE			0
>  #define APMF_FUNC_GET_SYS_PARAMS			1
> @@ -59,8 +64,20 @@
>  #define ARG_NONE 0
>  #define AVG_SAMPLE_SIZE 3
>  
> +/* Policy Actions */
> +#define PMF_POLICY_SPL						2
> +#define PMF_POLICY_SPPT						3
> +#define PMF_POLICY_FPPT						4
> +#define PMF_POLICY_SPPT_APU_ONLY				5
> +#define PMF_POLICY_STT_MIN					6
> +#define PMF_POLICY_STT_SKINTEMP_APU				7
> +#define PMF_POLICY_STT_SKINTEMP_HS2				8
> +
>  /* TA macros */
>  #define PMF_TA_IF_VERSION_MAJOR				1
> +#define TA_PMF_ACTION_MAX					32
> +#define TA_PMF_UNDO_MAX						8
> +#define MAX_OPERATION_PARAMS					4
>  
>  /* AMD PMF BIOS interfaces */
>  struct apmf_verify_interface {
> @@ -183,11 +200,16 @@ struct amd_pmf_dev {
>  	bool cnqf_supported;
>  	struct notifier_block pwr_src_notifier;
>  	/* Smart PC solution builder */
> +	unsigned char *policy_buf;
> +	u32 policy_sz;
>  	struct tee_context *tee_ctx;
>  	struct tee_shm *fw_shm_pool;
>  	u32 session_id;
>  	void *shbuf;
>  	struct delayed_work pb_work;
> +	struct pmf_action_table *prev_data;
> +	u64 policy_addr;
> +	void *policy_base;
>  	bool smart_pc_enabled;
>  };
>  
> @@ -399,17 +421,129 @@ struct apmf_dyn_slider_output {
>  	struct apmf_cnqf_power_set ps[APMF_CNQF_MAX];
>  } __packed;
>  
> +/* Smart PC - TA internals */
> +enum ta_slider {
> +	TA_BEST_BATTERY, /* Best Battery */
> +	TA_BETTER_BATTERY, /* Better Battery */
> +	TA_BETTER_PERFORMANCE, /* Better Performance */
> +	TA_BEST_PERFORMANCE, /* Best Performance */

Align comments.

> +	TA_MAX,
> +};
> +
>  /* cmd ids for TA communication */
>  enum ta_pmf_command {
>  	TA_PMF_COMMAND_POLICY_BUILDER_INITIALIZE,
>  	TA_PMF_COMMAND_POLICY_BUILDER_ENACT_POLICIES,
>  };
>  
> +enum ta_pmf_error_type {
> +	TA_PMF_TYPE_SUCCESS,
> +	TA_PMF_ERROR_TYPE_GENERIC,
> +	TA_PMF_ERROR_TYPE_CRYPTO,
> +	TA_PMF_ERROR_TYPE_CRYPTO_VALIDATE,
> +	TA_PMF_ERROR_TYPE_CRYPTO_VERIFY_OEM,
> +	TA_PMF_ERROR_TYPE_POLICY_BUILDER,
> +	TA_PMF_ERROR_TYPE_PB_CONVERT,
> +	TA_PMF_ERROR_TYPE_PB_SETUP,
> +	TA_PMF_ERROR_TYPE_PB_ENACT,
> +	TA_PMF_ERROR_TYPE_ASD_GET_DEVICE_INFO,
> +	TA_PMF_ERROR_TYPE_ASD_GET_DEVICE_PCIE_INFO,
> +	TA_PMF_ERROR_TYPE_SYS_DRV_FW_VALIDATION,
> +	TA_PMF_ERROR_TYPE_MAX,
> +};
> +
> +struct pmf_action_table {
> +	unsigned long spl; /* in mW */
> +	unsigned long sppt; /* in mW */
> +	unsigned long sppt_apuonly; /* in mW */
> +	unsigned long fppt; /* in mW */
> +	unsigned long stt_minlimit; /* in mW */
> +	unsigned long stt_skintemp_apu; /* in C */
> +	unsigned long stt_skintemp_hs2; /* in C */

Ditto.

> +};
> +
> +/* Input conditions */
> +struct ta_pmf_condition_info {
> +	u32 power_source;
> +	u32 bat_percentage;
> +	u32 power_slider;
> +	u32 lid_state;
> +	bool user_present;
> +	u32 rsvd1[2];
> +	u32 monitor_count;
> +	u32 rsvd2[2];
> +	u32 bat_design;
> +	u32 full_charge_capacity;
> +	int drain_rate;
> +	bool user_engaged;
> +	u32 device_state;
> +	u32 socket_power;
> +	u32 skin_temperature;
> +	u32 rsvd3[5];
> +	u32 ambient_light;
> +	u32 length;
> +	u32 avg_c0residency;
> +	u32 max_c0residency;
> +	u32 s0i3_entry;
> +	u32 gfx_busy;
> +	u32 rsvd4[7];
> +	bool camera_state;
> +	u32 workload_type;
> +	u32 display_type;
> +	u32 display_state;
> +	u32 rsvd5[150];
> +};
> +
> +struct ta_pmf_load_policy_table {
> +	u32 table_size;
> +	u8 table[POLICY_BUF_MAX_SZ];
> +};
> +
> +/* TA initialization params */
> +struct ta_pmf_init_table {
> +	u32 frequency; /* SMU sampling frequency */
> +	bool validate;
> +	bool sku_check;
> +	bool metadata_macrocheck;
> +	struct ta_pmf_load_policy_table policies_table;
> +};
> +
> +/* Everything the TA needs to Enact Policies */
> +struct ta_pmf_enact_table {
> +	struct ta_pmf_condition_info ev_info;
> +	u32 name;
> +};
> +
> +struct ta_pmf_action {
> +	u32 action_index;
> +	u32 value;
> +};
> +
> +/* output actions from TA */
> +struct ta_pmf_enact_result {
> +	u32 actions_count;
> +	struct ta_pmf_action actions_list[TA_PMF_ACTION_MAX];
> +	u32 undo_count;
> +	struct ta_pmf_action undo_list[TA_PMF_UNDO_MAX];
> +};
> +
> +union ta_pmf_input {
> +	struct ta_pmf_enact_table enact_table;
> +	struct ta_pmf_init_table init_table;
> +};
> +
> +union ta_pmf_output {
> +	struct ta_pmf_enact_result policy_apply_table;
> +	u32 rsvd[906];

This is some size (SZ_1K?) - sizeof(ta_pmf_enact_result)? I don't know if 
compiler would like such a construct though in the array declaration. If 
the compiler isn't complaining it would be the most informative way to 
state the size but if it's not happy, a comment might be useful.

> +};
> +
>  struct ta_pmf_shared_memory {
>  	int command_id;
>  	int resp_id;
>  	u32 pmf_result;
>  	u32 if_version;
> +	union ta_pmf_output pmf_output;
> +	union ta_pmf_input pmf_input;
>  };
>  
>  /* Core Layer */
> @@ -460,4 +594,5 @@ extern const struct attribute_group cnqf_feature_attribute_group;
>  /* Smart PC builder Layer*/
>  int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev);
>  void amd_pmf_deinit_smart_pc(struct amd_pmf_dev *dev);
> +int apmf_check_smart_pc(struct amd_pmf_dev *pmf_dev);
>  #endif /* PMF_H */
> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
> index 1b3985cd7c08..15aa6e6e1050 100644
> --- a/drivers/platform/x86/amd/pmf/tee-if.c
> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
> @@ -42,9 +42,77 @@ static void amd_pmf_prepare_args(struct amd_pmf_dev *dev, int cmd,
>  	param[0].u.memref.shm_offs = 0;
>  }
>  
> +static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_result *out)
> +{
> +	unsigned long val;
> +	int idx;
> +
> +	for (idx = 0; idx < out->actions_count; idx++) {
> +		val = out->actions_list[idx].value;
> +		switch (out->actions_list[idx].action_index) {
> +		case PMF_POLICY_SPL:
> +			if (dev->prev_data->spl != val) {
> +				amd_pmf_send_cmd(dev, SET_SPL, false, val, NULL);
> +				dev_dbg(dev->dev, "update SPL : %lu\n", val);
> +				dev->prev_data->spl = val;

Well, I'd have expected you to go u32 (and %u) here as isn't 
out->actions_list[idx].value u32? And amd_pmf_send_cmd also takes u32.
So unsigned long looks quite inconsistent and wasteful.

> +			}
> +			break;
> +
> +		case PMF_POLICY_SPPT:
> +			if (dev->prev_data->sppt != val) {
> +				amd_pmf_send_cmd(dev, SET_SPPT, false, val, NULL);
> +				dev_dbg(dev->dev, "update SPPT : %lu\n", val);
> +				dev->prev_data->sppt = val;
> +			}
> +			break;
> +
> +		case PMF_POLICY_FPPT:
> +			if (dev->prev_data->fppt != val) {
> +				amd_pmf_send_cmd(dev, SET_FPPT, false, val, NULL);
> +				dev_dbg(dev->dev, "update FPPT : %lu\n", val);
> +				dev->prev_data->fppt = val;
> +			}
> +			break;
> +
> +		case PMF_POLICY_SPPT_APU_ONLY:
> +			if (dev->prev_data->sppt_apuonly != val) {
> +				amd_pmf_send_cmd(dev, SET_SPPT_APU_ONLY, false, val, NULL);
> +				dev_dbg(dev->dev, "update SPPT_APU_ONLY : %lu\n", val);
> +				dev->prev_data->sppt_apuonly = val;
> +			}
> +			break;
> +
> +		case PMF_POLICY_STT_MIN:
> +			if (dev->prev_data->stt_minlimit != val) {
> +				amd_pmf_send_cmd(dev, SET_STT_MIN_LIMIT, false, val, NULL);
> +				dev_dbg(dev->dev, "update STT_MIN : %lu\n", val);
> +				dev->prev_data->stt_minlimit = val;
> +			}
> +			break;
> +
> +		case PMF_POLICY_STT_SKINTEMP_APU:
> +			if (dev->prev_data->stt_skintemp_apu != val) {
> +				amd_pmf_send_cmd(dev, SET_STT_LIMIT_APU, false, val, NULL);
> +				dev_dbg(dev->dev, "update STT_SKINTEMP_APU : %lu\n", val);
> +				dev->prev_data->stt_skintemp_apu = val;
> +			}
> +			break;
> +
> +		case PMF_POLICY_STT_SKINTEMP_HS2:
> +			if (dev->prev_data->stt_skintemp_hs2 != val) {
> +				amd_pmf_send_cmd(dev, SET_STT_LIMIT_HS2, false, val, NULL);
> +				dev_dbg(dev->dev, "update STT_SKINTEMP_HS2 : %lu\n", val);
> +				dev->prev_data->stt_skintemp_hs2 = val;
> +			}
> +			break;
> +		}
> +	}
> +}
> +
>  static int amd_pmf_invoke_cmd_enact(struct amd_pmf_dev *dev)
>  {
>  	struct ta_pmf_shared_memory *ta_sm = NULL;
> +	struct ta_pmf_enact_result *out = NULL;
>  	struct tee_param param[MAX_TEE_PARAM];
>  	struct tee_ioctl_invoke_arg arg;
>  	int ret = 0;
> @@ -52,7 +120,10 @@ static int amd_pmf_invoke_cmd_enact(struct amd_pmf_dev *dev)
>  	if (!dev->tee_ctx)
>  		return -ENODEV;
>  
> +	memset(dev->shbuf, 0, dev->policy_sz);
>  	ta_sm = (struct ta_pmf_shared_memory *)dev->shbuf;
> +	out = &ta_sm->pmf_output.policy_apply_table;
> +
>  	memset(ta_sm, 0, sizeof(struct ta_pmf_shared_memory));
>  	ta_sm->command_id = TA_PMF_COMMAND_POLICY_BUILDER_ENACT_POLICIES;
>  	ta_sm->if_version = PMF_TA_IF_VERSION_MAJOR;
> @@ -65,6 +136,12 @@ static int amd_pmf_invoke_cmd_enact(struct amd_pmf_dev *dev)
>  		return -EINVAL;
>  	}
>  
> +	if (ta_sm->pmf_result == TA_PMF_TYPE_SUCCESS && out->actions_count) {
> +		dev_dbg(dev->dev, "action count:%u result:%x\n", out->actions_count,
> +			ta_sm->pmf_result);
> +		amd_pmf_apply_policies(dev, out);
> +	}
> +
>  	return 0;
>  }
>  
> @@ -72,6 +149,7 @@ static int amd_pmf_invoke_cmd_init(struct amd_pmf_dev *dev)
>  {
>  	struct ta_pmf_shared_memory *ta_sm = NULL;
>  	struct tee_param param[MAX_TEE_PARAM];
> +	struct ta_pmf_init_table *in = NULL;
>  	struct tee_ioctl_invoke_arg arg;
>  	int ret = 0;
>  
> @@ -80,10 +158,20 @@ static int amd_pmf_invoke_cmd_init(struct amd_pmf_dev *dev)
>  		return -ENODEV;
>  	}
>  
> +	dev_dbg(dev->dev, "Policy Binary size: %u bytes\n", dev->policy_sz);
> +	memset(dev->shbuf, 0, dev->policy_sz);
>  	ta_sm = (struct ta_pmf_shared_memory *)dev->shbuf;
> +	in = &ta_sm->pmf_input.init_table;
> +
>  	ta_sm->command_id = TA_PMF_COMMAND_POLICY_BUILDER_INITIALIZE;
>  	ta_sm->if_version = PMF_TA_IF_VERSION_MAJOR;
> +	in->metadata_macrocheck = false;
> +	in->sku_check = false;
> +	in->validate = true;
> +	in->frequency = pb_actions_ms;
> +	in->policies_table.table_size = dev->policy_sz;
>  
> +	memcpy(in->policies_table.table, dev->policy_buf, dev->policy_sz);
>  	amd_pmf_prepare_args(dev, TA_PMF_COMMAND_POLICY_BUILDER_INITIALIZE, &arg, param);
>  
>  	ret = tee_client_invoke_func(dev->tee_ctx, &arg, param);
> @@ -103,6 +191,47 @@ static void amd_pmf_invoke_cmd(struct work_struct *work)
>  	schedule_delayed_work(&dev->pb_work, msecs_to_jiffies(pb_actions_ms));
>  }
>  
> +static int amd_pmf_start_policy_engine(struct amd_pmf_dev *dev)
> +{
> +	u32 cookie, length;
> +	int res;
> +
> +	cookie = readl(dev->policy_buf + POLICY_COOKIE_OFFSET);
> +	length = readl(dev->policy_buf + POLICY_COOKIE_LEN);
> +
> +	if (cookie != POLICY_SIGN_COOKIE || !length)
> +		return -EINVAL;
> +
> +	/* update the actual length */
> +	dev->policy_sz = length + 512;
> +	res = amd_pmf_invoke_cmd_init(dev);
> +	if (res == TA_PMF_TYPE_SUCCESS) {
> +		/* now its safe to announce that smart pc is enabled */
> +		dev->smart_pc_enabled = 1;
> +		schedule_delayed_work(&dev->pb_work, msecs_to_jiffies(pb_actions_ms * 3));

Why * 3? Explain in comment if you feel it's necessary as it's not 
obvious.


-- 
 i.

