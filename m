Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 97EF110A4B
	for <lists+amd-gfx@lfdr.de>; Wed,  1 May 2019 17:55:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D27289216;
	Wed,  1 May 2019 15:55:04 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780071.outbound.protection.outlook.com [40.107.78.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09FB489216
 for <amd-gfx@lists.freedesktop.org>; Wed,  1 May 2019 15:55:02 +0000 (UTC)
Received: from BN6PR12MB1809.namprd12.prod.outlook.com (10.175.101.17) by
 BN6PR12MB1682.namprd12.prod.outlook.com (10.172.18.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.15; Wed, 1 May 2019 15:54:57 +0000
Received: from BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::bc5b:de68:25b7:d853]) by BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::bc5b:de68:25b7:d853%12]) with mapi id 15.20.1835.018; Wed, 1 May 2019
 15:54:57 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "Russell, Kent" <Kent.Russell@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/amdgpu: Add PCIe replay count sysfs file
Thread-Topic: [PATCH 2/2] drm/amdgpu: Add PCIe replay count sysfs file
Thread-Index: AQHVABWQOY2nJVvcVkyjR147KuLKW6ZWbChI
Date: Wed, 1 May 2019 15:54:57 +0000
Message-ID: <BN6PR12MB180932D95410D8731100CA9BF73B0@BN6PR12MB1809.namprd12.prod.outlook.com>
References: <20190501120057.3012-1-kent.russell@amd.com>,
 <20190501120057.3012-2-kent.russell@amd.com>
In-Reply-To: <20190501120057.3012-2-kent.russell@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [71.219.84.143]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 52a1c148-5c9a-4f29-81a9-08d6ce4d5c7e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:BN6PR12MB1682; 
x-ms-traffictypediagnostic: BN6PR12MB1682:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BN6PR12MB16829B9C492D71D9BD3C5E26F73B0@BN6PR12MB1682.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2150;
x-forefront-prvs: 00246AB517
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(39860400002)(396003)(136003)(366004)(376002)(199004)(189003)(229853002)(966005)(55016002)(6436002)(52536014)(19627405001)(5660300002)(73956011)(81156014)(66946007)(86362001)(81166006)(66476007)(66556008)(64756008)(8676002)(14454004)(66446008)(8936002)(68736007)(76116006)(71190400001)(256004)(14444005)(71200400001)(316002)(110136005)(99286004)(72206003)(105004)(7696005)(478600001)(606006)(6506007)(102836004)(53546011)(26005)(186003)(476003)(33656002)(11346002)(446003)(486006)(2501003)(6306002)(3846002)(6116002)(66066001)(6246003)(2906002)(54896002)(76176011)(9686003)(53936002)(236005)(74316002)(7736002)(25786009);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1682;
 H:BN6PR12MB1809.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: EfY09F2xIzy7wjjCXQz21ONL+pXH0sx9qe/QWvswSZx7Nqg1Jq9HVWIsIkIKef+5jJhkUbILuy0OAIYJyxUsR57a80aREuryvgxtCqX9KCqsuMUinYfmmmAZcmh3kK31jOGNE283md1DK91sb8bmKapQcCo3uOyHok7gQQvCNw20+Bd7vAjP0Va2lie6Lx1UCzhMH7BmYPqy70jIt7y7ZLUVKv/R+kyo3brYxGbqm/K/x2mNpwooZkuUUSp+ZqDDIzdqDofWfTXEp742t1Kvmv12xcLdcDlEEHyEH+1aG0SAblxN3KMOFZx4akXC96Mzhy72PqoR/m2hv0TD2LNKABerR9C+/qU2D4tIDZDbfn9PITIo2f0saWN8jXEDpIaIVxLhjKwdR3MlABq4sH0uulVYQoWw8Gc4nocUuN6axQo=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52a1c148-5c9a-4f29-81a9-08d6ce4d5c7e
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 May 2019 15:54:57.8091 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1682
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h2C+B4BuVHLvkAgX6T7WTUZaib2otV00x7icIl/pvow=;
 b=yCDmpqNjJHVZ0dMuon/db+m8ijgyuDIEon7RirNWW22lMuHRj6gELmmty8XRe+DzXnwUPACDR1qPI17POH9wDq3QwA3adi7SOkWpR1AP1uEjvamyqiQG76zv+u+RURjphfAy6fDs9+QVbXtGECATVY6lPZ+A8TvdeJqYGZQUfg8=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Alexander.Deucher@amd.com; 
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1273182540=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1273182540==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN6PR12MB180932D95410D8731100CA9BF73B0BN6PR12MB1809namp_"

--_000_BN6PR12MB180932D95410D8731100CA9BF73B0BN6PR12MB1809namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Series is:
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Russell,=
 Kent <Kent.Russell@amd.com>
Sent: Wednesday, May 1, 2019 8:01 AM
To: amd-gfx@lists.freedesktop.org
Cc: Russell, Kent
Subject: [PATCH 2/2] drm/amdgpu: Add PCIe replay count sysfs file

[CAUTION: External Email]

Add a sysfs file for reporting the number of PCIe replays (NAKs). This
returns the sum of NAKs received and NAKs generated

Change-Id: I135d5964ea13309754f80519c84a4eb3d360aab6
Signed-off-by: Kent Russell <kent.russell@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h        |  3 +++
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 29 ++++++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/cik.c           | 13 ++++++++++
 drivers/gpu/drm/amd/amdgpu/si.c            | 13 ++++++++++
 drivers/gpu/drm/amd/amdgpu/soc15.c         | 14 +++++++++++
 drivers/gpu/drm/amd/amdgpu/vi.c            | 13 ++++++++++
 6 files changed, 85 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdg=
pu/amdgpu.h
index 50b2a4f5a4de..686e7ee29912 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -558,6 +558,8 @@ struct amdgpu_asic_funcs {
                               uint64_t *count1);
        /* do we need to reset the asic at init time (e.g., kexec) */
        bool (*need_reset_on_init)(struct amdgpu_device *adev);
+       /* PCIe replay counter */
+       uint64_t (*get_pcie_replay_count)(struct amdgpu_device *adev);
 };

 /*
@@ -1080,6 +1082,7 @@ int emu_soc_asic_init(struct amdgpu_device *adev);
 #define amdgpu_asic_init_doorbell_index(adev) (adev)->asic_funcs->init_doo=
rbell_index((adev))
 #define amdgpu_asic_get_pcie_usage(adev, cnt0, cnt1) ((adev)->asic_funcs->=
get_pcie_usage((adev), (cnt0), (cnt1)))
 #define amdgpu_asic_need_reset_on_init(adev) (adev)->asic_funcs->need_rese=
t_on_init((adev))
+#define amdgpu_asic_get_pcie_replay_count(adev) ((adev)->asic_funcs->get_p=
cie_replay_count((adev)))

 /* Common functions */
 bool amdgpu_device_should_recover_gpu(struct amdgpu_device *adev);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/a=
md/amdgpu/amdgpu_device.c
index 4edbe2029fb1..3f1c6b2d3d87 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -97,6 +97,28 @@ static const char *amdgpu_asic_name[] =3D {
        "LAST",
 };

+/**
+ * DOC: pcie_replay_count
+ *
+ * The amdgpu driver provides a sysfs API for reporting the total number
+ * of PCIe replays (NAKs)
+ * The file pcie_replay_count is used for this and returns the total
+ * number of replays as a sum of the NAKs generated and NAKs received
+ */
+
+static ssize_t amdgpu_device_get_pcie_replay_count(struct device *dev,
+               struct device_attribute *attr, char *buf)
+{
+       struct drm_device *ddev =3D dev_get_drvdata(dev);
+       struct amdgpu_device *adev =3D ddev->dev_private;
+       uint64_t cnt =3D amdgpu_asic_get_pcie_replay_count(adev);
+
+       return snprintf(buf, PAGE_SIZE, "%llu\n", cnt);
+}
+
+static DEVICE_ATTR(pcie_replay_count, S_IRUGO,
+               amdgpu_device_get_pcie_replay_count, NULL);
+
 static void amdgpu_device_get_pcie_info(struct amdgpu_device *adev);

 /**
@@ -2721,6 +2743,12 @@ int amdgpu_device_init(struct amdgpu_device *adev,
        /* must succeed. */
        amdgpu_ras_post_init(adev);

+       r =3D device_create_file(adev->dev, &dev_attr_pcie_replay_count);
+       if (r) {
+               dev_err(adev->dev, "Could not create pcie_replay_count");
+               return r;
+       }
+
        return 0;

 failed:
@@ -2784,6 +2812,7 @@ void amdgpu_device_fini(struct amdgpu_device *adev)
        adev->rmmio =3D NULL;
        amdgpu_device_doorbell_fini(adev);
        amdgpu_debugfs_regs_cleanup(adev);
+       device_remove_file(adev->dev, &dev_attr_pcie_replay_count);
 }


diff --git a/drivers/gpu/drm/amd/amdgpu/cik.c b/drivers/gpu/drm/amd/amdgpu/=
cik.c
index 07c1f239e9c3..3a4f20766a39 100644
--- a/drivers/gpu/drm/amd/amdgpu/cik.c
+++ b/drivers/gpu/drm/amd/amdgpu/cik.c
@@ -1804,6 +1804,18 @@ static bool cik_need_reset_on_init(struct amdgpu_dev=
ice *adev)
        return false;
 }

+static uint64_t cik_get_pcie_replay_count(struct amdgpu_device *adev)
+{
+       uint64_t nak_r, nak_g;
+
+       /* Get the number of NAKs received and generated */
+       nak_r =3D RREG32_PCIE(ixPCIE_RX_NUM_NAK);
+       nak_g =3D RREG32_PCIE(ixPCIE_RX_NUM_NAK_GENERATED);
+
+       /* Add the total number of NAKs, i.e the number of replays */
+       return (nak_r + nak_g);
+}
+
 static const struct amdgpu_asic_funcs cik_asic_funcs =3D
 {
        .read_disabled_bios =3D &cik_read_disabled_bios,
@@ -1821,6 +1833,7 @@ static const struct amdgpu_asic_funcs cik_asic_funcs =
=3D
        .init_doorbell_index =3D &legacy_doorbell_index_init,
        .get_pcie_usage =3D &cik_get_pcie_usage,
        .need_reset_on_init =3D &cik_need_reset_on_init,
+       .get_pcie_replay_count =3D &cik_get_pcie_replay_count,
 };

 static int cik_common_early_init(void *handle)
diff --git a/drivers/gpu/drm/amd/amdgpu/si.c b/drivers/gpu/drm/amd/amdgpu/s=
i.c
index 9d8df68893b9..4ff930a47e10 100644
--- a/drivers/gpu/drm/amd/amdgpu/si.c
+++ b/drivers/gpu/drm/amd/amdgpu/si.c
@@ -1375,6 +1375,18 @@ static void si_get_pcie_usage(struct amdgpu_device *=
adev, uint64_t *count0,
        *count1 =3D RREG32_PCIE(ixPCIE_PERF_COUNT1_TXCLK) | (cnt1_of << 32)=
;
 }

+static uint64_t si_get_pcie_replay_count(struct amdgpu_device *adev)
+{
+       uint64_t nak_r, nak_g;
+
+       /* Get the number of NAKs received and generated */
+       nak_r =3D RREG32_PCIE(ixPCIE_RX_NUM_NAK);
+       nak_g =3D RREG32_PCIE(ixPCIE_RX_NUM_NAK_GENERATED);
+
+       /* Add the total number of NAKs, i.e the number of replays */
+       return (nak_r + nak_g);
+}
+
 static const struct amdgpu_asic_funcs si_asic_funcs =3D
 {
        .read_disabled_bios =3D &si_read_disabled_bios,
@@ -1393,6 +1405,7 @@ static const struct amdgpu_asic_funcs si_asic_funcs =
=3D
        .need_full_reset =3D &si_need_full_reset,
        .get_pcie_usage =3D &si_get_pcie_usage,
        .need_reset_on_init =3D &si_need_reset_on_init,
+       .get_pcie_replay_count =3D &si_get_pcie_replay_count,
 };

 static uint32_t si_get_rev_id(struct amdgpu_device *adev)
diff --git a/drivers/gpu/drm/amd/amdgpu/soc15.c b/drivers/gpu/drm/amd/amdgp=
u/soc15.c
index 78bd00a0142f..78b27c03b8c2 100644
--- a/drivers/gpu/drm/amd/amdgpu/soc15.c
+++ b/drivers/gpu/drm/amd/amdgpu/soc15.c
@@ -745,6 +745,18 @@ static bool soc15_need_reset_on_init(struct amdgpu_dev=
ice *adev)
        return false;
 }

+static uint64_t soc15_get_pcie_replay_count(struct amdgpu_device *adev)
+{
+       uint64_t nak_r, nak_g;
+
+       /* Get the number of NAKs received and generated */
+       nak_r =3D RREG32_PCIE(smnPCIE_RX_NUM_NAK);
+       nak_g =3D RREG32_PCIE(smnPCIE_RX_NUM_NAK_GENERATED);
+
+       /* Add the total number of NAKs, i.e the number of replays */
+       return (nak_r + nak_g);
+}
+
 static const struct amdgpu_asic_funcs soc15_asic_funcs =3D
 {
        .read_disabled_bios =3D &soc15_read_disabled_bios,
@@ -762,6 +774,7 @@ static const struct amdgpu_asic_funcs soc15_asic_funcs =
=3D
        .init_doorbell_index =3D &vega10_doorbell_index_init,
        .get_pcie_usage =3D &soc15_get_pcie_usage,
        .need_reset_on_init =3D &soc15_need_reset_on_init,
+       .get_pcie_replay_count =3D &soc15_get_pcie_replay_count,
 };

 static const struct amdgpu_asic_funcs vega20_asic_funcs =3D
@@ -781,6 +794,7 @@ static const struct amdgpu_asic_funcs vega20_asic_funcs=
 =3D
        .init_doorbell_index =3D &vega20_doorbell_index_init,
        .get_pcie_usage =3D &soc15_get_pcie_usage,
        .need_reset_on_init =3D &soc15_need_reset_on_init,
+       .get_pcie_replay_count =3D &soc15_get_pcie_replay_count,
 };

 static int soc15_common_early_init(void *handle)
diff --git a/drivers/gpu/drm/amd/amdgpu/vi.c b/drivers/gpu/drm/amd/amdgpu/v=
i.c
index 5e5b42a0744a..b8adf3808de2 100644
--- a/drivers/gpu/drm/amd/amdgpu/vi.c
+++ b/drivers/gpu/drm/amd/amdgpu/vi.c
@@ -987,6 +987,18 @@ static void vi_get_pcie_usage(struct amdgpu_device *ad=
ev, uint64_t *count0,
        *count1 =3D RREG32_PCIE(ixPCIE_PERF_COUNT1_TXCLK) | (cnt1_of << 32)=
;
 }

+static uint64_t vi_get_pcie_replay_count(struct amdgpu_device *adev)
+{
+       uint64_t nak_r, nak_g;
+
+       /* Get the number of NAKs received and generated */
+       nak_r =3D RREG32_PCIE(ixPCIE_RX_NUM_NAK);
+       nak_g =3D RREG32_PCIE(ixPCIE_RX_NUM_NAK_GENERATED);
+
+       /* Add the total number of NAKs, i.e the number of replays */
+       return (nak_r + nak_g);
+}
+
 static bool vi_need_reset_on_init(struct amdgpu_device *adev)
 {
        u32 clock_cntl, pc;
@@ -1021,6 +1033,7 @@ static const struct amdgpu_asic_funcs vi_asic_funcs =
=3D
        .init_doorbell_index =3D &legacy_doorbell_index_init,
        .get_pcie_usage =3D &vi_get_pcie_usage,
        .need_reset_on_init =3D &vi_need_reset_on_init,
+       .get_pcie_replay_count =3D &vi_get_pcie_replay_count,
 };

 #define CZ_REV_BRISTOL(rev)     \
--
2.17.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_BN6PR12MB180932D95410D8731100CA9BF73B0BN6PR12MB1809namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Series is:</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Reviewed-by: Alex Deucher &lt;alexander.deucher@amd.com&gt;<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> amd-gfx &lt;amd-gfx-b=
ounces@lists.freedesktop.org&gt; on behalf of Russell, Kent &lt;Kent.Russel=
l@amd.com&gt;<br>
<b>Sent:</b> Wednesday, May 1, 2019 8:01 AM<br>
<b>To:</b> amd-gfx@lists.freedesktop.org<br>
<b>Cc:</b> Russell, Kent<br>
<b>Subject:</b> [PATCH 2/2] drm/amdgpu: Add PCIe replay count sysfs file</f=
ont>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">[CAUTION: External Email]<br>
<br>
Add a sysfs file for reporting the number of PCIe replays (NAKs). This<br>
returns the sum of NAKs received and NAKs generated<br>
<br>
Change-Id: I135d5964ea13309754f80519c84a4eb3d360aab6<br>
Signed-off-by: Kent Russell &lt;kent.russell@amd.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/amdgpu.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; |&nbsp; 3 &#43;&#43;&#43;<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 29 &#43;&#43;&#43;&#43;&=
#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&=
#43;&#43;&#43;<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/cik.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; | 13 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&=
#43;<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/si.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; | 13 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&=
#43;&#43;<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/soc15.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; | 14 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;<=
br>
&nbsp;drivers/gpu/drm/amd/amdgpu/vi.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; | 13 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&=
#43;&#43;<br>
&nbsp;6 files changed, 85 insertions(&#43;)<br>
<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdg=
pu/amdgpu.h<br>
index 50b2a4f5a4de..686e7ee29912 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/amdgpu.h<br>
@@ -558,6 &#43;558,8 @@ struct amdgpu_asic_funcs {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint64_t *count1);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* do we need to reset the asic =
at init time (e.g., kexec) */<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool (*need_reset_on_init)(struc=
t amdgpu_device *adev);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* PCIe replay counter */<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint64_t (*get_pcie_replay_count)=
(struct amdgpu_device *adev);<br>
&nbsp;};<br>
<br>
&nbsp;/*<br>
@@ -1080,6 &#43;1082,7 @@ int emu_soc_asic_init(struct amdgpu_device *adev)=
;<br>
&nbsp;#define amdgpu_asic_init_doorbell_index(adev) (adev)-&gt;asic_funcs-&=
gt;init_doorbell_index((adev))<br>
&nbsp;#define amdgpu_asic_get_pcie_usage(adev, cnt0, cnt1) ((adev)-&gt;asic=
_funcs-&gt;get_pcie_usage((adev), (cnt0), (cnt1)))<br>
&nbsp;#define amdgpu_asic_need_reset_on_init(adev) (adev)-&gt;asic_funcs-&g=
t;need_reset_on_init((adev))<br>
&#43;#define amdgpu_asic_get_pcie_replay_count(adev) ((adev)-&gt;asic_funcs=
-&gt;get_pcie_replay_count((adev)))<br>
<br>
&nbsp;/* Common functions */<br>
&nbsp;bool amdgpu_device_should_recover_gpu(struct amdgpu_device *adev);<br=
>
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/a=
md/amdgpu/amdgpu_device.c<br>
index 4edbe2029fb1..3f1c6b2d3d87 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c<br>
@@ -97,6 &#43;97,28 @@ static const char *amdgpu_asic_name[] =3D {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;LAST&quot;,<br>
&nbsp;};<br>
<br>
&#43;/**<br>
&#43; * DOC: pcie_replay_count<br>
&#43; *<br>
&#43; * The amdgpu driver provides a sysfs API for reporting the total numb=
er<br>
&#43; * of PCIe replays (NAKs)<br>
&#43; * The file pcie_replay_count is used for this and returns the total<b=
r>
&#43; * number of replays as a sum of the NAKs generated and NAKs received<=
br>
&#43; */<br>
&#43;<br>
&#43;static ssize_t amdgpu_device_get_pcie_replay_count(struct device *dev,=
<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; struct device_attribute *attr, char *buf)<br>
&#43;{<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_device *ddev =3D dev_g=
et_drvdata(dev);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_device *adev =3D dd=
ev-&gt;dev_private;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint64_t cnt =3D amdgpu_asic_get_=
pcie_replay_count(adev);<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return snprintf(buf, PAGE_SIZE, &=
quot;%llu\n&quot;, cnt);<br>
&#43;}<br>
&#43;<br>
&#43;static DEVICE_ATTR(pcie_replay_count, S_IRUGO,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; amdgpu_device_get_pcie_replay_count, NULL);<br>
&#43;<br>
&nbsp;static void amdgpu_device_get_pcie_info(struct amdgpu_device *adev);<=
br>
<br>
&nbsp;/**<br>
@@ -2721,6 &#43;2743,12 @@ int amdgpu_device_init(struct amdgpu_device *ade=
v,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* must succeed. */<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_ras_post_init(adev);<br>
<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r =3D device_create_file(adev-&gt=
;dev, &amp;dev_attr_pcie_replay_count);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (r) {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; dev_err(adev-&gt;dev, &quot;Could not create pcie_replay_cou=
nt&quot;);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; return r;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&#43;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
<br>
&nbsp;failed:<br>
@@ -2784,6 &#43;2812,7 @@ void amdgpu_device_fini(struct amdgpu_device *ade=
v)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;rmmio =3D NULL;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_device_doorbell_fini(adev=
);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_debugfs_regs_cleanup(adev=
);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; device_remove_file(adev-&gt;dev, =
&amp;dev_attr_pcie_replay_count);<br>
&nbsp;}<br>
<br>
<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/cik.c b/drivers/gpu/drm/amd/amdgpu/=
cik.c<br>
index 07c1f239e9c3..3a4f20766a39 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/cik.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/cik.c<br>
@@ -1804,6 &#43;1804,18 @@ static bool cik_need_reset_on_init(struct amdgpu=
_device *adev)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return false;<br>
&nbsp;}<br>
<br>
&#43;static uint64_t cik_get_pcie_replay_count(struct amdgpu_device *adev)<=
br>
&#43;{<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint64_t nak_r, nak_g;<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Get the number of NAKs receive=
d and generated */<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; nak_r =3D RREG32_PCIE(ixPCIE_RX_N=
UM_NAK);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; nak_g =3D RREG32_PCIE(ixPCIE_RX_N=
UM_NAK_GENERATED);<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Add the total number of NAKs, =
i.e the number of replays */<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return (nak_r &#43; nak_g);<br>
&#43;}<br>
&#43;<br>
&nbsp;static const struct amdgpu_asic_funcs cik_asic_funcs =3D<br>
&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .read_disabled_bios =3D &amp;cik=
_read_disabled_bios,<br>
@@ -1821,6 &#43;1833,7 @@ static const struct amdgpu_asic_funcs cik_asic_fu=
ncs =3D<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .init_doorbell_index =3D &amp;le=
gacy_doorbell_index_init,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .get_pcie_usage =3D &amp;cik_get=
_pcie_usage,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .need_reset_on_init =3D &amp;cik=
_need_reset_on_init,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .get_pcie_replay_count =3D &amp;c=
ik_get_pcie_replay_count,<br>
&nbsp;};<br>
<br>
&nbsp;static int cik_common_early_init(void *handle)<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/si.c b/drivers/gpu/drm/amd/amdgpu/s=
i.c<br>
index 9d8df68893b9..4ff930a47e10 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/si.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/si.c<br>
@@ -1375,6 &#43;1375,18 @@ static void si_get_pcie_usage(struct amdgpu_devi=
ce *adev, uint64_t *count0,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *count1 =3D RREG32_PCIE(ixPCIE_P=
ERF_COUNT1_TXCLK) | (cnt1_of &lt;&lt; 32);<br>
&nbsp;}<br>
<br>
&#43;static uint64_t si_get_pcie_replay_count(struct amdgpu_device *adev)<b=
r>
&#43;{<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint64_t nak_r, nak_g;<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Get the number of NAKs receive=
d and generated */<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; nak_r =3D RREG32_PCIE(ixPCIE_RX_N=
UM_NAK);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; nak_g =3D RREG32_PCIE(ixPCIE_RX_N=
UM_NAK_GENERATED);<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Add the total number of NAKs, =
i.e the number of replays */<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return (nak_r &#43; nak_g);<br>
&#43;}<br>
&#43;<br>
&nbsp;static const struct amdgpu_asic_funcs si_asic_funcs =3D<br>
&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .read_disabled_bios =3D &amp;si_=
read_disabled_bios,<br>
@@ -1393,6 &#43;1405,7 @@ static const struct amdgpu_asic_funcs si_asic_fun=
cs =3D<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .need_full_reset =3D &amp;si_nee=
d_full_reset,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .get_pcie_usage =3D &amp;si_get_=
pcie_usage,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .need_reset_on_init =3D &amp;si_=
need_reset_on_init,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .get_pcie_replay_count =3D &amp;s=
i_get_pcie_replay_count,<br>
&nbsp;};<br>
<br>
&nbsp;static uint32_t si_get_rev_id(struct amdgpu_device *adev)<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/soc15.c b/drivers/gpu/drm/amd/amdgp=
u/soc15.c<br>
index 78bd00a0142f..78b27c03b8c2 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/soc15.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/soc15.c<br>
@@ -745,6 &#43;745,18 @@ static bool soc15_need_reset_on_init(struct amdgpu=
_device *adev)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return false;<br>
&nbsp;}<br>
<br>
&#43;static uint64_t soc15_get_pcie_replay_count(struct amdgpu_device *adev=
)<br>
&#43;{<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint64_t nak_r, nak_g;<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Get the number of NAKs receive=
d and generated */<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; nak_r =3D RREG32_PCIE(smnPCIE_RX_=
NUM_NAK);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; nak_g =3D RREG32_PCIE(smnPCIE_RX_=
NUM_NAK_GENERATED);<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Add the total number of NAKs, =
i.e the number of replays */<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return (nak_r &#43; nak_g);<br>
&#43;}<br>
&#43;<br>
&nbsp;static const struct amdgpu_asic_funcs soc15_asic_funcs =3D<br>
&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .read_disabled_bios =3D &amp;soc=
15_read_disabled_bios,<br>
@@ -762,6 &#43;774,7 @@ static const struct amdgpu_asic_funcs soc15_asic_fu=
ncs =3D<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .init_doorbell_index =3D &amp;ve=
ga10_doorbell_index_init,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .get_pcie_usage =3D &amp;soc15_g=
et_pcie_usage,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .need_reset_on_init =3D &amp;soc=
15_need_reset_on_init,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .get_pcie_replay_count =3D &amp;s=
oc15_get_pcie_replay_count,<br>
&nbsp;};<br>
<br>
&nbsp;static const struct amdgpu_asic_funcs vega20_asic_funcs =3D<br>
@@ -781,6 &#43;794,7 @@ static const struct amdgpu_asic_funcs vega20_asic_f=
uncs =3D<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .init_doorbell_index =3D &amp;ve=
ga20_doorbell_index_init,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .get_pcie_usage =3D &amp;soc15_g=
et_pcie_usage,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .need_reset_on_init =3D &amp;soc=
15_need_reset_on_init,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .get_pcie_replay_count =3D &amp;s=
oc15_get_pcie_replay_count,<br>
&nbsp;};<br>
<br>
&nbsp;static int soc15_common_early_init(void *handle)<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/vi.c b/drivers/gpu/drm/amd/amdgpu/v=
i.c<br>
index 5e5b42a0744a..b8adf3808de2 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/vi.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/vi.c<br>
@@ -987,6 &#43;987,18 @@ static void vi_get_pcie_usage(struct amdgpu_device=
 *adev, uint64_t *count0,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *count1 =3D RREG32_PCIE(ixPCIE_P=
ERF_COUNT1_TXCLK) | (cnt1_of &lt;&lt; 32);<br>
&nbsp;}<br>
<br>
&#43;static uint64_t vi_get_pcie_replay_count(struct amdgpu_device *adev)<b=
r>
&#43;{<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint64_t nak_r, nak_g;<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Get the number of NAKs receive=
d and generated */<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; nak_r =3D RREG32_PCIE(ixPCIE_RX_N=
UM_NAK);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; nak_g =3D RREG32_PCIE(ixPCIE_RX_N=
UM_NAK_GENERATED);<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Add the total number of NAKs, =
i.e the number of replays */<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return (nak_r &#43; nak_g);<br>
&#43;}<br>
&#43;<br>
&nbsp;static bool vi_need_reset_on_init(struct amdgpu_device *adev)<br>
&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u32 clock_cntl, pc;<br>
@@ -1021,6 &#43;1033,7 @@ static const struct amdgpu_asic_funcs vi_asic_fun=
cs =3D<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .init_doorbell_index =3D &amp;le=
gacy_doorbell_index_init,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .get_pcie_usage =3D &amp;vi_get_=
pcie_usage,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .need_reset_on_init =3D &amp;vi_=
need_reset_on_init,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .get_pcie_replay_count =3D &amp;v=
i_get_pcie_replay_count,<br>
&nbsp;};<br>
<br>
&nbsp;#define CZ_REV_BRISTOL(rev)&nbsp;&nbsp;&nbsp;&nbsp; \<br>
--<br>
2.17.1<br>
<br>
_______________________________________________<br>
amd-gfx mailing list<br>
amd-gfx@lists.freedesktop.org<br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/amd-gfx">https://=
lists.freedesktop.org/mailman/listinfo/amd-gfx</a><br>
</div>
</span></font></div>
</body>
</html>

--_000_BN6PR12MB180932D95410D8731100CA9BF73B0BN6PR12MB1809namp_--

--===============1273182540==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1273182540==--
