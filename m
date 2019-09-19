Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9EAFB75AE
	for <lists+amd-gfx@lfdr.de>; Thu, 19 Sep 2019 11:06:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 499156F7D9;
	Thu, 19 Sep 2019 09:06:24 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820083.outbound.protection.outlook.com [40.107.82.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A13976F7E0
 for <amd-gfx@lists.freedesktop.org>; Thu, 19 Sep 2019 09:06:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LR7VhFELvwc2gU2yPK4TbQ2gAU/VEzpTMEnqw72Su9V1IcEG+VmujawqRWuIfm+KhXBQI3slPtWVDi+APGD0O0TbzUNkk7q9rreX9rzSMusrGpFR2xGG+3NXk62QCkj4mujrZmiUF4zex1EseKrWJFpQKVNgw8PehCWzplLD4zwaCoPzvyl6l5FAU0VCjyajsr5fOQVPs1dYyrQ//kOt9SN6wkCMy7RpB9YVffKEhCxgpPrTQJ7m2pUc6ZNF5WtJBhzdbQpKZvL5BrsK1Yet+O4WCUuTuiEHuY0HueYjoO+1CmSzuRvpMB+FpK30gPBfyR4MF3kE2nXMUooB3FtxMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AZ5snVWTBddXD7yJ7mvTQ0L8OkKgq9QpXMpetTrXER8=;
 b=YfLgZE0Kydg9+zhPE+PSR3Qm1c51W++3/BJKWqDKKBfqXx8MGCH4tuUKSctjMEIH6RWzIKt9aLpd9nLUTwqOamS6gauRi2UQsqWDBJQos25hZTw8gpjjdr7rtLbTqyjDRL+xJrjvpSKRotcL/F7L1fJOQ5sByvq7LDMUUUmg7gbRaEdaR7k3eBm2buGhN/9AJF2MgzJZ7kvYtDWcCkXUC6cto9tTl9go3Mjca7rJIpNzrTOd1iSCuh9+Y6Cp7Bi3O5tzb+b9NsJmNPVQy6vFVoE1iSvOoTrPL62yeBuBys8ii+Osgk8m+cFmJbzufmPPYN8Jq7lHYLdRMYmbrbPHyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB2469.namprd12.prod.outlook.com (52.132.138.166) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.18; Thu, 19 Sep 2019 09:06:21 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::9d43:b3d4:9ef:29fc]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::9d43:b3d4:9ef:29fc%8]) with mapi id 15.20.2263.023; Thu, 19 Sep 2019
 09:06:21 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: "Deng, Emily" <Emily.Deng@amd.com>
Subject: RE: [PATCH] drm/amdgpu/sriov: omit fbcon error under sriov or
 passthrough
Thread-Topic: [PATCH] drm/amdgpu/sriov: omit fbcon error under sriov or
 passthrough
Thread-Index: AQHVbgWu2rFDa0rF+0CzJp1BGtWXeKcxMqhggAAJS4CAAAThAIABDymwgAAIE5CAAF5mcIAAAIAg
Date: Thu, 19 Sep 2019 09:06:20 +0000
Message-ID: <5810a3fe-7929-48da-b09c-8ec4f4e2ca23@email.android.com>
References: <8cad9ead-c2da-43b1-91d1-0291e02c5fd8@email.android.com>
 <MN2PR12MB2975280FA830F69A96966A3E8F8E0@MN2PR12MB2975.namprd12.prod.outlook.com>
 <3b31520d-c5eb-06f9-5468-0161f9adafc8@amd.com>
 <ba054c85-f0ab-93f1-13b6-b9e550c99522@amd.com>
 <MN2PR12MB2975EB0D2D2F7041C6E62EB38F890@MN2PR12MB2975.namprd12.prod.outlook.com>
 <CH2PR12MB367243AEED44642A9AA3CB46BB890@CH2PR12MB3672.namprd12.prod.outlook.com>,
 <MN2PR12MB2975A9B332A8D1D34C3130E08F890@MN2PR12MB2975.namprd12.prod.outlook.com>
In-Reply-To: <MN2PR12MB2975A9B332A8D1D34C3130E08F890@MN2PR12MB2975.namprd12.prod.outlook.com>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2a02:908:1252:fb60:9524:9184:c89c:f381]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 792dc134-2e6a-4847-fa86-08d73ce0a390
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DM5PR12MB2469; 
x-ms-traffictypediagnostic: DM5PR12MB2469:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB2469EA8BF8670A6300E66F9883890@DM5PR12MB2469.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 016572D96D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(396003)(376002)(366004)(136003)(346002)(51444003)(189003)(13464003)(199004)(229853002)(256004)(14444005)(31696002)(66476007)(66556008)(76116006)(7736002)(46003)(446003)(478600001)(25786009)(5660300002)(6486002)(66946007)(31686004)(86362001)(64756008)(66446008)(91956017)(71200400001)(71190400001)(6636002)(99286004)(76176011)(236005)(53546011)(54896002)(102836004)(6506007)(6436002)(9686003)(6512007)(81166006)(81156014)(6116002)(186003)(8936002)(6246003)(4326008)(2906002)(6862004)(66574012)(486006)(8676002)(11346002)(476003)(316002)(14454004)(54906003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB2469;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 9YgAu8gnRGFX8cLAswQ1Q0CmhqAbufNMxGJkfk0JSCqZsI0NFss4d1DmpFcczZd4Rp3OBvOHKd+QvrodEvgbgOoz/p6DBpFLnpRHfS2WI5DV8JCTQzYkbK0YYMsRoWfkai0Q+E8wJp+AeaGv1XQK61r9RDJacSWY0KtQzyGWOLAblfTn2806FCZmm2E/XRtNAOh5sbgKWxvz8F0vCLVE/RvhPl6idoEQ75JlXGqHn1qZyZQjmEgrkwnATsrWksYhuEAmfTyavnS/HmD5rLeQw4C1gJdTRFME0f2WomiL/xq5SuGB/PhzZ12Fp2Bl9T/lPA4JWCh3J/0BndR/rEQ9FT3Skv9qu7+BLDZRfoLC9sX0xqZ4nkdVV17bv+OAPMSLuCeunoa+ihtxex20I2Ymk05rXCzMbfHnP1hFxy006O8=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 792dc134-2e6a-4847-fa86-08d73ce0a390
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2019 09:06:20.8643 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2v/YRoga0bzdhIm4tpekuQuSUvrI7o35l63KP8FlRZgAlG0+K70Xfv/TAnNlHJGP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2469
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AZ5snVWTBddXD7yJ7mvTQ0L8OkKgq9QpXMpetTrXER8=;
 b=ZnuEKaMhz9h9cBwRkVs4gSWwOvk0Gionl75G8fCBbXr35DbRGf01x+5HchbrX33vMgAji7HiA4yMsuR19g3fpwKU9zq0+uFs+ZIqkAW/X4En+dekVcp8G+VZCUWQShjxIVkm+xE4giBVue4FlBiGhuZlYyN4I/Ksq/laq+80BHw=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
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
Cc: "Zhang, Jack \(Jian\)" <Jack.Zhang1@amd.com>, "Cui,
 Flora" <Flora.Cui@amd.com>, "Teng, Rui" <Rui.Teng@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1327305803=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1327305803==
Content-Language: de-DE
Content-Type: multipart/alternative;
	boundary="_000_5810a3fe792948dab09c8ec4f4e2ca23emailandroidcom_"

--_000_5810a3fe792948dab09c8ec4f4e2ca23emailandroidcom_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

I can create a patch based on this today and push it on Monday.

Christian.

Am 19.09.2019 11:05 schrieb "Deng, Emily" <Emily.Deng@amd.com>:
Hi Christian,
Could you please help to push the code?

Best wishes
Emily Deng
From: Zhang, Jack (Jian) <Jack.Zhang1@amd.com>
Sent: Thursday, September 19, 2019 11:33 AM
To: Deng, Emily <Emily.Deng@amd.com>; Koenig, Christian <Christian.Koenig@a=
md.com>
Cc: amd-gfx@lists.freedesktop.org; Teng, Rui <Rui.Teng@amd.com>; Cui, Flora=
 <Flora.Cui@amd.com>
Subject: RE: [PATCH] drm/amdgpu/sriov: omit fbcon error under sriov or pass=
through




Reviewed & Tested-by: Jack Zhang <Jack.Zhang1@amd.com<mailto:Jack.Zhang1@am=
d.com>>

BR,
Jack
From: Deng, Emily <Emily.Deng@amd.com<mailto:Emily.Deng@amd.com>>
Sent: Thursday, September 19, 2019 10:58 AM
To: Koenig, Christian <Christian.Koenig@amd.com<mailto:Christian.Koenig@amd=
.com>>
Cc: Zhang, Jack (Jian) <Jack.Zhang1@amd.com<mailto:Jack.Zhang1@amd.com>>; a=
md-gfx@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org>; Teng, R=
ui <Rui.Teng@amd.com<mailto:Rui.Teng@amd.com>>; Cui, Flora <Flora.Cui@amd.c=
om<mailto:Flora.Cui@amd.com>>
Subject: RE: [PATCH] drm/amdgpu/sriov: omit fbcon error under sriov or pass=
through

Hi Jack,
Could you please give a try about this? Both for passthrough and sriov.

Best wishes
Emily Deng
From: Koenig, Christian <Christian.Koenig@amd.com<mailto:Christian.Koenig@a=
md.com>>
Sent: Wednesday, September 18, 2019 6:47 PM
To: Deng, Emily <Emily.Deng@amd.com<mailto:Emily.Deng@amd.com>>
Cc: Zhang, Jack (Jian) <Jack.Zhang1@amd.com<mailto:Jack.Zhang1@amd.com>>; a=
md-gfx@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org>; Teng, R=
ui <Rui.Teng@amd.com<mailto:Rui.Teng@amd.com>>; Cui, Flora <Flora.Cui@amd.c=
om<mailto:Flora.Cui@amd.com>>
Subject: Re: [PATCH] drm/amdgpu/sriov: omit fbcon error under sriov or pass=
through

Hi Jack & Emily,

asking around a bit helped, we should be able to take a look at the module =
state to distinct the two use cases like this:

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/=
amdgpu/amdgpu_drv.c
index 6b96a5738e57..0af134eb03e2 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -1074,7 +1074,10 @@ amdgpu_pci_remove(struct pci_dev *pdev)
 {
        struct drm_device *dev =3D pci_get_drvdata(pdev);

-       DRM_ERROR("Device removal is currently not supported outside of fbc=
on\n");
+#ifdef MODULE
+       if (THIS_MODULE->state !=3D MODULE_STATE_GOING)
+#endif
+               DRM_ERROR("Device removal is currently not supported outsid=
e of fbcon\n");
        drm_dev_unplug(dev);
        drm_dev_put(dev);
        pci_disable_device(pdev);

It's a bit of a hack, but I think that this should work.

Regards,
Christian.

Am 18.09.19 um 12:29 schrieb Christian K=F6nig:
Hi Emily,
Do you think this is because the wrong use case?
Well Jack's use case is correct, but the PCIe hot plug removal use case is =
incorrect.

Changing it to a warning is most likely not a good idea either because it i=
s indeed an error to try to use PCIe hot plug removal.

What we need to distinct is why the function is called, if it's because of =
pci_unregister_driver(&amdgpu_kms_pci_driver) in amdgpu_exit() then the use=
 case is valid and we should not print the error.

But if it's because somebody does something like "echo 1 > /sys/bus/pci/dev=
ices/0000\:0b\:00.1/remove" then that is invalid and we should print it.

We could do some hack and look at the stack trace, but that is probably not=
 reliable either.

Maybe we can look at the module reference count or something like that.

Regards,
Christian.

Am 18.09.19 um 12:04 schrieb Deng, Emily:
Hi Christian,
Do you think this is because the wrong use case? Even we add the error log,=
 the issue still happens. Could we change this error to warning? As for the=
 right method to remove the driver, it shouldn=92t occur issues.

Best wishes
Emily Deng
From: Koenig, Christian <Christian.Koenig@amd.com><mailto:Christian.Koenig@=
amd.com>
Sent: Wednesday, September 18, 2019 5:45 PM
To: Deng, Emily <Emily.Deng@amd.com><mailto:Emily.Deng@amd.com>
Cc: Zhang, Jack (Jian) <Jack.Zhang1@amd.com><mailto:Jack.Zhang1@amd.com>; a=
md-gfx@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org>; Teng, R=
ui <Rui.Teng@amd.com><mailto:Rui.Teng@amd.com>; Cui, Flora <Flora.Cui@amd.c=
om><mailto:Flora.Cui@amd.com>
Subject: RE: [PATCH] drm/amdgpu/sriov: omit fbcon error under sriov or pass=
through

Yes, exactly.

The problem is that even when output is qxl or the Intel driver our driver =
is still loaded and forcefully removing it renders the desktop unusable.

Christian.


Am 18.09.2019 11:24 schrieb "Deng, Emily" <Emily.Deng@amd.com<mailto:Emily.=
Deng@amd.com>>:

Hi Christian,

Do you mean, for passthrough mode, the desktop is rendered by our asic, but=
 enduser is trying to remove the driver by hot plug?



Best wishes

Emily Deng

From: Koenig, Christian <Christian.Koenig@amd.com<mailto:Christian.Koenig@a=
md.com>>
Sent: Wednesday, September 18, 2019 4:44 PM
To: Deng, Emily <Emily.Deng@amd.com<mailto:Emily.Deng@amd.com>>
Cc: Zhang, Jack (Jian) <Jack.Zhang1@amd.com<mailto:Jack.Zhang1@amd.com>>; a=
md-gfx@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org>; Teng, R=
ui <Rui.Teng@amd.com<mailto:Rui.Teng@amd.com>>; Cui, Flora <Flora.Cui@amd.c=
om<mailto:Flora.Cui@amd.com>>
Subject: RE: [PATCH] drm/amdgpu/sriov: omit fbcon error under sriov or pass=
through



Hi Emily,



Yeah, exactly that's the problem: In some cases the driver can be unloaded =
while it is still in use!



See we added this error message because endusers tried to use PCIe hot plug=
 to unload the driver to use the hardware for paththrough.



But this will completely nuke your desktop, even when amdgpu is only a seco=
ndary device like in the qxl case.



Jack is using the correct way of doing it, e.g. using "modprobe -r" or rmmo=
d. Both commands check the use count before unloading the driver instances.



I don't see a way to distingt the two cases and what Jack is doing is unfor=
tunate not the common one.



Regards,

Christian.





Am 18.09.2019 10:08 schrieb "Deng, Emily" <Emily.Deng@amd.com<mailto:Emily.=
Deng@amd.com>>:

Hi Christian,

     Before unloading driver, user must sure there is not any userspace to =
use of amdgpu, if not, it will report driver is in use. And the unloading d=
river is a feature about amdgpu driver which will be easier to replace driv=
er without rebooting VM. Do you think it has any issue about driver unloadi=
ng path?



Best wishes

Emily Deng

From: Koenig, Christian <Christian.Koenig@amd.com<mailto:Christian.Koenig@a=
md.com>>
Sent: Wednesday, September 18, 2019 3:54 PM
To: Zhang, Jack (Jian) <Jack.Zhang1@amd.com<mailto:Jack.Zhang1@amd.com>>
Cc: amd-gfx@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org>; Te=
ng, Rui <Rui.Teng@amd.com<mailto:Rui.Teng@amd.com>>; Deng, Emily <Emily.Den=
g@amd.com<mailto:Emily.Deng@amd.com>>; Cui, Flora <Flora.Cui@amd.com<mailto=
:Flora.Cui@amd.com>>
Subject: RE: [PATCH] drm/amdgpu/sriov: omit fbcon error under sriov or pass=
through



Hi Jack,



Well that believe is unfortunately completely wrong.



The point is that ANY use of amdgpu by userspace will prevent correct drive=
r unload, that qxl is used for the fbcon doesn't change anything here.



So the patch is a clear NAK. Driver unload is not supposed to work even und=
er SRIOV.



Regards,

Christian.







Am 18.09.2019 09:32 schrieb "Zhang, Jack (Jian)" <Jack.Zhang1@amd.com<mailt=
o:Jack.Zhang1@amd.com>>:

Hi, Christian and folks,

In virtual machines(such virt-manager), there's always a virtual graphics d=
evice existed like "qxl" as the default gfx device.
So under such condition, we believe it's reasonable to unload amdgpu driver=
 as it is not treated as the default fbcon device.

Would you please help to review this patch?

Best wishes,
Jack

-----Original Message-----
From: Jack Zhang <Jack.Zhang1@amd.com<mailto:Jack.Zhang1@amd.com>>
Sent: Wednesday, September 18, 2019 3:25 PM
To: amd-gfx@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org>
Cc: Zhang, Jack (Jian) <Jack.Zhang1@amd.com<mailto:Jack.Zhang1@amd.com>>
Subject: [PATCH] drm/amdgpu/sriov: omit fbcon error under sriov or passthro=
ugh

In virtual machine, there would be a qxl or cirrus graphics device as the d=
efault master fbcon device.

So for PF(passthrough mode) or SRIOV VF, it is reasonable to unload amdgpu =
driver. Amdgpu doesn't have to be the only fbcon device under this conditio=
n.

Signed-off-by: Jack Zhang <Jack.Zhang1@amd.com<mailto:Jack.Zhang1@amd.com>>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/=
amdgpu/amdgpu_drv.c
index 420888e..ada2b25 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -1103,8 +1103,9 @@ static void
 amdgpu_pci_remove(struct pci_dev *pdev)  {
         struct drm_device *dev =3D pci_get_drvdata(pdev);
-
-       DRM_ERROR("Device removal is currently not supported outside of fbc=
on\n");
+       struct amdgpu_device *adev =3D dev->dev_private;
+       if (!amdgpu_sriov_vf(adev) && !amdgpu_passthrough(adev))
+               DRM_ERROR("     currently not supported outside of
+fbcon\n");
         drm_dev_unplug(dev);
         drm_dev_put(dev);
         pci_disable_device(pdev);
--
2.7.4






--_000_5810a3fe792948dab09c8ec4f4e2ca23emailandroidcom_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<meta content=3D"text/html; charset=3Dutf-8">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style>
<!--
@font-face
	{font-family:"Cambria Math"}
@font-face
	{font-family:DengXian}
@font-face
	{font-family:Calibri}
@font-face
	{}
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	color:black}
a:link, span.MsoHyperlink
	{color:blue;
	text-decoration:underline}
a:visited, span.MsoHyperlinkFollowed
	{color:purple;
	text-decoration:underline}
p.MsoPlainText, li.MsoPlainText, div.MsoPlainText
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif}
p.msonormal0, li.msonormal0, div.msonormal0
	{margin-right:0in;
	margin-left:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	color:black}
span.PlainTextChar
	{font-family:"Calibri",sans-serif}
span.EmailStyle20
	{font-family:"Calibri",sans-serif;
	color:windowtext}
span.EmailStyle21
	{font-family:"Calibri",sans-serif;
	color:windowtext}
span.EmailStyle22
	{font-family:"Calibri",sans-serif;
	color:windowtext}
span.EmailStyle25
	{font-family:"Calibri",sans-serif;
	color:windowtext}
.MsoChpDefault
	{font-size:10.0pt}
@page WordSection1
	{margin:1.0in 1.0in 1.0in 1.0in}
div.WordSection1
	{}
-->
</style>
</head>
<body bgcolor=3D"white" lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div dir=3D"auto">I can create a patch based on this today and push it on M=
onday.
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">Christian.</div>
</div>
<div class=3D"gmail_extra"><br>
<div class=3D"gmail_quote">Am 19.09.2019 11:05 schrieb &quot;Deng, Emily&qu=
ot; &lt;Emily.Deng@amd.com&gt;:<br type=3D"attribution">
</div>
</div>
<div>
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"color:windowtext">Hi Christian,</span=
></p>
<p class=3D"MsoNormal" style=3D"text-indent:10.0pt"><span style=3D"color:wi=
ndowtext">Could you please help to push the code?</span></p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext">&nbsp;</span></p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext">Best wishes</span><=
/p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext">Emily Deng</span></=
p>
<div style=3D"border:none; border-left:solid blue 1.5pt; padding:0in 0in 0i=
n 4.0pt">
<div>
<div style=3D"border:none; border-top:solid #E1E1E1 1.0pt; padding:3.0pt 0i=
n 0in 0in">
<p class=3D"MsoNormal"><b><span style=3D"color:windowtext">From:</span></b>=
<span style=3D"color:windowtext"> Zhang, Jack (Jian) &lt;Jack.Zhang1@amd.co=
m&gt;
<br>
<b>Sent:</b> Thursday, September 19, 2019 11:33 AM<br>
<b>To:</b> Deng, Emily &lt;Emily.Deng@amd.com&gt;; Koenig, Christian &lt;Ch=
ristian.Koenig@amd.com&gt;<br>
<b>Cc:</b> amd-gfx@lists.freedesktop.org; Teng, Rui &lt;Rui.Teng@amd.com&gt=
;; Cui, Flora &lt;Flora.Cui@amd.com&gt;<br>
<b>Subject:</b> RE: [PATCH] drm/amdgpu/sriov: omit fbcon error under sriov =
or passthrough</span></p>
</div>
</div>
<p class=3D"MsoNormal">&nbsp;</p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext">&nbsp;</span></p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext">&nbsp;</span></p>
<p class=3D"MsoPlainText">Reviewed &amp; Tested-by: Jack Zhang &lt;<a href=
=3D"mailto:Jack.Zhang1@amd.com">Jack.Zhang1@amd.com</a>&gt;</p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext">&nbsp;</span></p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext">BR,</span></p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext">Jack</span></p>
<div>
<div style=3D"border:none; border-top:solid #E1E1E1 1.0pt; padding:3.0pt 0i=
n 0in 0in">
<p class=3D"MsoNormal"><b><span style=3D"color:windowtext">From:</span></b>=
<span style=3D"color:windowtext"> Deng, Emily &lt;<a href=3D"mailto:Emily.D=
eng@amd.com">Emily.Deng@amd.com</a>&gt;
<br>
<b>Sent:</b> Thursday, September 19, 2019 10:58 AM<br>
<b>To:</b> Koenig, Christian &lt;<a href=3D"mailto:Christian.Koenig@amd.com=
">Christian.Koenig@amd.com</a>&gt;<br>
<b>Cc:</b> Zhang, Jack (Jian) &lt;<a href=3D"mailto:Jack.Zhang1@amd.com">Ja=
ck.Zhang1@amd.com</a>&gt;;
<a href=3D"mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesktop.=
org</a>; Teng, Rui &lt;<a href=3D"mailto:Rui.Teng@amd.com">Rui.Teng@amd.com=
</a>&gt;; Cui, Flora &lt;<a href=3D"mailto:Flora.Cui@amd.com">Flora.Cui@amd=
.com</a>&gt;<br>
<b>Subject:</b> RE: [PATCH] drm/amdgpu/sriov: omit fbcon error under sriov =
or passthrough</span></p>
</div>
</div>
<p class=3D"MsoNormal">&nbsp;</p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext">Hi Jack,</span></p>
<p class=3D"MsoNormal" style=3D"text-indent:10.0pt"><span style=3D"color:wi=
ndowtext">Could you please give a try about this? Both for passthrough and =
sriov.</span></p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext">&nbsp;</span></p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext">Best wishes</span><=
/p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext">Emily Deng</span></=
p>
<div style=3D"border:none; border-left:solid blue 1.5pt; padding:0in 0in 0i=
n 4.0pt">
<div>
<div style=3D"border:none; border-top:solid #E1E1E1 1.0pt; padding:3.0pt 0i=
n 0in 0in">
<p class=3D"MsoNormal"><b><span style=3D"color:windowtext">From:</span></b>=
<span style=3D"color:windowtext"> Koenig, Christian &lt;<a href=3D"mailto:C=
hristian.Koenig@amd.com">Christian.Koenig@amd.com</a>&gt;
<br>
<b>Sent:</b> Wednesday, September 18, 2019 6:47 PM<br>
<b>To:</b> Deng, Emily &lt;<a href=3D"mailto:Emily.Deng@amd.com">Emily.Deng=
@amd.com</a>&gt;<br>
<b>Cc:</b> Zhang, Jack (Jian) &lt;<a href=3D"mailto:Jack.Zhang1@amd.com">Ja=
ck.Zhang1@amd.com</a>&gt;;
<a href=3D"mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesktop.=
org</a>; Teng, Rui &lt;<a href=3D"mailto:Rui.Teng@amd.com">Rui.Teng@amd.com=
</a>&gt;; Cui, Flora &lt;<a href=3D"mailto:Flora.Cui@amd.com">Flora.Cui@amd=
.com</a>&gt;<br>
<b>Subject:</b> Re: [PATCH] drm/amdgpu/sriov: omit fbcon error under sriov =
or passthrough</span></p>
</div>
</div>
<p class=3D"MsoNormal">&nbsp;</p>
<div>
<p class=3D"MsoNormal">Hi Jack &amp; Emily,<br>
<br>
asking around a bit helped, we should be able to take a look at the module =
state to distinct the two use cases like this:<br>
<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/=
amdgpu/amdgpu_drv.c<br>
index 6b96a5738e57..0af134eb03e2 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c<br>
@@ -1074,7 &#43;1074,10 @@ amdgpu_pci_remove(struct pci_dev *pdev)<br>
&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_device *dev =3D pci_g=
et_drvdata(pdev);<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DRM_ERROR(&quot;Device removal is cur=
rently not supported outside of fbcon\n&quot;);<br>
&#43;#ifdef MODULE<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (THIS_MODULE-&gt;state !=3D MO=
DULE_STATE_GOING)<br>
&#43;#endif<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; DRM_ERROR(&quot;Device removal is currently not supported ou=
tside of fbcon\n&quot;);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_dev_unplug(dev);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_dev_put(dev);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pci_disable_device(pdev);<br>
<br>
It's a bit of a hack, but I think that this should work.<br>
<br>
Regards,<br>
Christian.<br>
<br>
Am 18.09.19 um 12:29 schrieb Christian K=F6nig:</p>
</div>
<blockquote style=3D"margin-top:5.0pt; margin-bottom:5.0pt">
<div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt">Hi Emily,</p>
<blockquote style=3D"margin-top:5.0pt; margin-bottom:5.0pt">
<p class=3D"MsoNormal">Do you think this is because the wrong use case?</p>
</blockquote>
<p class=3D"MsoNormal">Well Jack's use case is correct, but the PCIe hot pl=
ug removal use case is incorrect.<br>
<br>
Changing it to a warning is most likely not a good idea either because it i=
s indeed an error to try to use PCIe hot plug removal.<br>
<br>
What we need to distinct is why the function is called, if it's because of =
pci_unregister_driver(&amp;amdgpu_kms_pci_driver) in amdgpu_exit() then the=
 use case is valid and we should not print the error.<br>
<br>
But if it's because somebody does something like &quot;echo 1 &gt; /sys/bus=
/pci/devices/0000\:0b\:00.1/remove&quot; then that is invalid and we should=
 print it.<br>
<br>
We could do some hack and look at the stack trace, but that is probably not=
 reliable either.<br>
<br>
Maybe we can look at the module reference count or something like that.<br>
<br>
Regards,<br>
Christian.<br>
<br>
Am 18.09.19 um 12:04 schrieb Deng, Emily:</p>
</div>
<blockquote style=3D"margin-top:5.0pt; margin-bottom:5.0pt">
<p class=3D"MsoNormal">Hi Christian,</p>
<p class=3D"MsoNormal" style=3D"text-indent:10.0pt">Do you think this is be=
cause the wrong use case? Even we add the error log, the issue still happen=
s. Could we change this error to warning? As for the right method to remove=
 the driver, it shouldn=92t occur issues.</p>
<p class=3D"MsoNormal">&nbsp;</p>
<p class=3D"MsoNormal">Best wishes</p>
<p class=3D"MsoNormal">Emily Deng</p>
<div style=3D"border:none; border-left:solid blue 1.5pt; padding:0in 0in 0i=
n 4.0pt">
<div>
<div style=3D"border:none; border-top:solid #E1E1E1 1.0pt; padding:3.0pt 0i=
n 0in 0in">
<p class=3D"MsoNormal"><b>From:</b> Koenig, Christian <a href=3D"mailto:Chr=
istian.Koenig@amd.com">
&lt;Christian.Koenig@amd.com&gt;</a> <br>
<b>Sent:</b> Wednesday, September 18, 2019 5:45 PM<br>
<b>To:</b> Deng, Emily <a href=3D"mailto:Emily.Deng@amd.com">&lt;Emily.Deng=
@amd.com&gt;</a><br>
<b>Cc:</b> Zhang, Jack (Jian) <a href=3D"mailto:Jack.Zhang1@amd.com">&lt;Ja=
ck.Zhang1@amd.com&gt;</a>;
<a href=3D"mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesktop.=
org</a>; Teng, Rui
<a href=3D"mailto:Rui.Teng@amd.com">&lt;Rui.Teng@amd.com&gt;</a>; Cui, Flor=
a <a href=3D"mailto:Flora.Cui@amd.com">
&lt;Flora.Cui@amd.com&gt;</a><br>
<b>Subject:</b> RE: [PATCH] drm/amdgpu/sriov: omit fbcon error under sriov =
or passthrough</p>
</div>
</div>
<p class=3D"MsoNormal">&nbsp;</p>
<div>
<div>
<p class=3D"MsoNormal">Yes, exactly.</p>
<div>
<p class=3D"MsoNormal">&nbsp;</p>
</div>
<div>
<p class=3D"MsoNormal">The problem is that even when output is qxl or the I=
ntel driver our driver is still loaded and forcefully removing it renders t=
he desktop unusable.</p>
</div>
<div>
<p class=3D"MsoNormal">&nbsp;</p>
</div>
<div>
<p class=3D"MsoNormal">Christian.</p>
</div>
<p class=3D"MsoNormal">&nbsp;</p>
<div>
<p class=3D"MsoNormal">&nbsp;</p>
<div>
<p class=3D"MsoNormal">Am 18.09.2019 11:24 schrieb &quot;Deng, Emily&quot; =
&lt;<a href=3D"mailto:Emily.Deng@amd.com">Emily.Deng@amd.com</a>&gt;:</p>
<blockquote style=3D"border:none; border-left:solid #CCCCCC 1.0pt; padding:=
0in 0in 0in 6.0pt; margin-left:4.8pt; margin-top:5.0pt; margin-right:0in; m=
argin-bottom:5.0pt">
<div>
<div>
<p>Hi Christian,</p>
<p style=3D"text-indent:10.0pt">Do you mean, for passthrough mode, the desk=
top is rendered by our asic, but enduser is trying to remove the driver by =
hot plug?</p>
<p>&nbsp;</p>
<p>Best wishes</p>
<p>Emily Deng</p>
<div style=3D"border:none; border-left:solid blue 1.5pt; padding:0in 0in 0i=
n 4.0pt">
<div>
<div style=3D"border:none; border-top:solid #E1E1E1 1.0pt; padding:3.0pt 0i=
n 0in 0in">
<p><b>From:</b> Koenig, Christian &lt;<a href=3D"mailto:Christian.Koenig@am=
d.com">Christian.Koenig@amd.com</a>&gt;
<br>
<b>Sent:</b> Wednesday, September 18, 2019 4:44 PM<br>
<b>To:</b> Deng, Emily &lt;<a href=3D"mailto:Emily.Deng@amd.com">Emily.Deng=
@amd.com</a>&gt;<br>
<b>Cc:</b> Zhang, Jack (Jian) &lt;<a href=3D"mailto:Jack.Zhang1@amd.com">Ja=
ck.Zhang1@amd.com</a>&gt;;
<a href=3D"mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesktop.=
org</a>; Teng, Rui &lt;<a href=3D"mailto:Rui.Teng@amd.com">Rui.Teng@amd.com=
</a>&gt;; Cui, Flora &lt;<a href=3D"mailto:Flora.Cui@amd.com">Flora.Cui@amd=
.com</a>&gt;<br>
<b>Subject:</b> RE: [PATCH] drm/amdgpu/sriov: omit fbcon error under sriov =
or passthrough</p>
</div>
</div>
<p>&nbsp;</p>
<div>
<div>
<p>Hi Emily,</p>
<div>
<p>&nbsp;</p>
</div>
<div>
<p>Yeah, exactly that's the problem: In some cases the driver can be unload=
ed while it is still in use!</p>
</div>
<div>
<p>&nbsp;</p>
</div>
<div>
<p>See we added this error message because endusers tried to use PCIe hot p=
lug to unload the driver to use the hardware for paththrough.</p>
</div>
<div>
<p>&nbsp;</p>
</div>
<div>
<p>But this will completely nuke your desktop, even when amdgpu is only a s=
econdary device like in the qxl case.</p>
</div>
<div>
<p>&nbsp;</p>
</div>
<div>
<p>Jack is using the correct way of doing it, e.g. using &quot;modprobe -r&=
quot; or rmmod. Both commands check the use count before unloading the driv=
er instances.</p>
</div>
<div>
<p>&nbsp;</p>
</div>
<div>
<p>I don't see a way to distingt the two cases and what Jack is doing is un=
fortunate not the common one.</p>
</div>
<div>
<p>&nbsp;</p>
</div>
<div>
<p>Regards,</p>
</div>
<div>
<p>Christian.</p>
</div>
<div>
<p>&nbsp;</p>
</div>
</div>
<div>
<p>&nbsp;</p>
<div>
<p>Am 18.09.2019 10:08 schrieb &quot;Deng, Emily&quot; &lt;<a href=3D"mailt=
o:Emily.Deng@amd.com">Emily.Deng@amd.com</a>&gt;:</p>
<blockquote style=3D"border:none; border-left:solid #CCCCCC 1.0pt; padding:=
0in 0in 0in 6.0pt; margin-left:4.8pt; margin-top:5.0pt; margin-right:0in; m=
argin-bottom:5.0pt">
<div>
<div>
<p>Hi Christian,</p>
<p>&nbsp;&nbsp;&nbsp;&nbsp; Before unloading driver, user must sure there i=
s not any userspace to use of amdgpu, if not, it will report driver is in u=
se. And the unloading driver is a feature about amdgpu driver which will be=
 easier to replace driver without rebooting VM. Do you
 think it has any issue about driver unloading path?</p>
<p>&nbsp;</p>
<p>Best wishes</p>
<p>Emily Deng</p>
<div style=3D"border:none; border-left:solid blue 1.5pt; padding:0in 0in 0i=
n 4.0pt">
<div>
<div style=3D"border:none; border-top:solid #E1E1E1 1.0pt; padding:3.0pt 0i=
n 0in 0in">
<p><b>From:</b> Koenig, Christian &lt;<a href=3D"mailto:Christian.Koenig@am=
d.com">Christian.Koenig@amd.com</a>&gt;
<br>
<b>Sent:</b> Wednesday, September 18, 2019 3:54 PM<br>
<b>To:</b> Zhang, Jack (Jian) &lt;<a href=3D"mailto:Jack.Zhang1@amd.com">Ja=
ck.Zhang1@amd.com</a>&gt;<br>
<b>Cc:</b> <a href=3D"mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.f=
reedesktop.org</a>; Teng, Rui &lt;<a href=3D"mailto:Rui.Teng@amd.com">Rui.T=
eng@amd.com</a>&gt;; Deng, Emily &lt;<a href=3D"mailto:Emily.Deng@amd.com">=
Emily.Deng@amd.com</a>&gt;; Cui, Flora &lt;<a href=3D"mailto:Flora.Cui@amd.=
com">Flora.Cui@amd.com</a>&gt;<br>
<b>Subject:</b> RE: [PATCH] drm/amdgpu/sriov: omit fbcon error under sriov =
or passthrough</p>
</div>
</div>
<p>&nbsp;</p>
<div>
<div>
<p>Hi Jack,</p>
<div>
<p>&nbsp;</p>
</div>
<div>
<p>Well that believe is unfortunately completely wrong.</p>
</div>
<div>
<p>&nbsp;</p>
</div>
<div>
<p>The point is that ANY use of amdgpu by userspace will prevent correct dr=
iver unload, that qxl is used for the fbcon doesn't change anything here.</=
p>
</div>
<div>
<p>&nbsp;</p>
</div>
<div>
<p>So the patch is a clear NAK. Driver unload is not supposed to work even =
under SRIOV.</p>
</div>
<div>
<p>&nbsp;</p>
</div>
<div>
<p>Regards,</p>
</div>
<div>
<p>Christian.</p>
</div>
<div>
<p>&nbsp;</p>
</div>
<div>
<p>&nbsp;</p>
</div>
</div>
<div>
<p>&nbsp;</p>
<div>
<p>Am 18.09.2019 09:32 schrieb &quot;Zhang, Jack (Jian)&quot; &lt;<a href=
=3D"mailto:Jack.Zhang1@amd.com">Jack.Zhang1@amd.com</a>&gt;:</p>
</div>
</div>
</div>
<div>
<p style=3D"margin-bottom:12.0pt">Hi, Christian and folks,<br>
<br>
In virtual machines(such virt-manager), there's always a virtual graphics d=
evice existed like &quot;qxl&quot; as the default gfx device.<br>
So under such condition, we believe it's reasonable to unload amdgpu driver=
 as it is not treated as the default fbcon device.<br>
<br>
Would you please help to review this patch?<br>
<br>
Best wishes,<br>
Jack<br>
<br>
-----Original Message-----<br>
From: Jack Zhang &lt;<a href=3D"mailto:Jack.Zhang1@amd.com">Jack.Zhang1@amd=
.com</a>&gt; <br>
Sent: Wednesday, September 18, 2019 3:25 PM<br>
To: <a href=3D"mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesk=
top.org</a><br>
Cc: Zhang, Jack (Jian) &lt;<a href=3D"mailto:Jack.Zhang1@amd.com">Jack.Zhan=
g1@amd.com</a>&gt;<br>
Subject: [PATCH] drm/amdgpu/sriov: omit fbcon error under sriov or passthro=
ugh<br>
<br>
In virtual machine, there would be a qxl or cirrus graphics device as the d=
efault master fbcon device.<br>
<br>
So for PF(passthrough mode) or SRIOV VF, it is reasonable to unload amdgpu =
driver. Amdgpu doesn't have to be the only fbcon device under this conditio=
n.<br>
<br>
Signed-off-by: Jack Zhang &lt;<a href=3D"mailto:Jack.Zhang1@amd.com">Jack.Z=
hang1@amd.com</a>&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 5 &#43;&#43;&#43;--<br>
&nbsp;1 file changed, 3 insertions(&#43;), 2 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/=
amdgpu/amdgpu_drv.c<br>
index 420888e..ada2b25 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c<br>
@@ -1103,8 &#43;1103,9 @@ static void<br>
&nbsp;amdgpu_pci_remove(struct pci_dev *pdev)&nbsp; {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_device *dev =3D=
 pci_get_drvdata(pdev);<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DRM_ERROR(&quot;Device removal is cur=
rently not supported outside of fbcon\n&quot;);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_device *adev =3D de=
v-&gt;dev_private;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!amdgpu_sriov_vf(adev) &amp;&=
amp; !amdgpu_passthrough(adev))<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; DRM_ERROR(&quot;&nbsp;&nbsp; &nbsp; currently not supported =
outside of <br>
&#43;fbcon\n&quot;);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_dev_unplug(dev);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_dev_put(dev);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pci_disable_device(pdev);<=
br>
--<br>
2.7.4</p>
</div>
</div>
</div>
</div>
</blockquote>
</div>
<p>&nbsp;</p>
</div>
</div>
</div>
</div>
</div>
</blockquote>
</div>
<p class=3D"MsoNormal">&nbsp;</p>
</div>
</div>
</div>
</div>
</blockquote>
<p class=3D"MsoNormal">&nbsp;</p>
</blockquote>
<p class=3D"MsoNormal">&nbsp;</p>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_5810a3fe792948dab09c8ec4f4e2ca23emailandroidcom_--

--===============1327305803==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1327305803==--
