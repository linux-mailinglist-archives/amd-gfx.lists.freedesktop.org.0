Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B241B1EFA29
	for <lists+amd-gfx@lfdr.de>; Fri,  5 Jun 2020 16:14:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EF8B6E905;
	Fri,  5 Jun 2020 14:14:02 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770057.outbound.protection.outlook.com [40.107.77.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58E446E905
 for <amd-gfx@lists.freedesktop.org>; Fri,  5 Jun 2020 14:14:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ggeh3YXdTJrnMmRbphdVX2qd/NG4/tBBoconugunNNnNFPBAQAjaeyRBi1SUJm+/s48sy7gedTqD4CZ6+IsYGkK6GKltb69zLAlNGAOd3R+04nlgYZ5EpYTWBp+XsYgPw5fG6y3S5ew2V69JPl3iHk7uDs/pxglsm8Y8RwOhxARbGgZvENqc+c/SF6TjH/mWxi6LSAerQcUcCraBgqTEJdVLDCDh68xr6KgwCT3OPpqbeH1qdiAQvdgRa+PZ2b5O2iKKucIP8RTZlakiP1EJiMP8zrPgGgRioPF70fWuqFflvzQgVF46dOwUblrQq48SeEh8j9s7x2IGgFfQG0AYBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BFaouf1VwKNZL9aZCqDNK8vo1cxpVvXcoHZaq3Rmoh4=;
 b=g2UdZggS/ITvfLip8d68DbDhRIhmGkCkyW8sJ2TgBTfnkj5L7CCvdlQVOHC7dvOr/7iRZZ48S8dL6gKFffymDqpQib4d+mizmWBjwjVajTFWIZ3eNruTRWKFZHHOwbxQWE04bjKqoGwm+fRJnZlqJWTFqe3ZlotQs9fIBkjFioN2sPH/t61lRJesgwLmuJBZcRIWshWlVpf8simiJrgpUWCLDvovW95s70iFZqf4ZzqLltHWL+U2cm0UgURFzNBGfk7XRi+eVtlk16FbzkoFKdqAB8r/mXyyS1q03a+FSiuCD+XWaqSoqLe38OLBhL/XFw5jiZSw32/Dg+SSDDm+Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BFaouf1VwKNZL9aZCqDNK8vo1cxpVvXcoHZaq3Rmoh4=;
 b=DY424iLfVMTy271u2RvYgI2IWvRMyv7MbEJfuH8CaVmCn2RU1Ucbkqtm4oC6xGy/jr5ai/8ccQVb5YlMUkEH+KA8+8Ogsh7KsCM011JEEf0YFaXhx0d6P2aZNdvOMYt97AemI4IdD7Zs9li50BgQ4QYNZEFKbzTy/DzKRNrAwDs=
Received: from DM6PR12MB4075.namprd12.prod.outlook.com (2603:10b6:5:21d::8) by
 DM6PR12MB3066.namprd12.prod.outlook.com (2603:10b6:5:11a::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3066.20; Fri, 5 Jun 2020 14:13:58 +0000
Received: from DM6PR12MB4075.namprd12.prod.outlook.com
 ([fe80::50d1:ecd6:255c:fbcd]) by DM6PR12MB4075.namprd12.prod.outlook.com
 ([fe80::50d1:ecd6:255c:fbcd%3]) with mapi id 15.20.3066.018; Fri, 5 Jun 2020
 14:13:58 +0000
From: "Zhang, Hawking" <Hawking.Zhang@amd.com>
To: "Gao, Likun" <Likun.Gao@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdgpu: skip fb size query for navi10 previous asic
Thread-Topic: [PATCH] drm/amdgpu: skip fb size query for navi10 previous asic
Thread-Index: AQHWOznaZ9JcTgW3Wk6nJGdozn5XzKjKDg3AgAAAp5CAAAGrsA==
Date: Fri, 5 Jun 2020 14:13:58 +0000
Message-ID: <DM6PR12MB4075E21E04CB874BC2B9BE8EFC860@DM6PR12MB4075.namprd12.prod.outlook.com>
References: <20200605130412.202089-1-likun.gao@amd.com>
 <DM6PR12MB4075B8807E76FF2925063F35FC860@DM6PR12MB4075.namprd12.prod.outlook.com>
 <DM6PR12MB40752665F199B53B99DE432CFC860@DM6PR12MB4075.namprd12.prod.outlook.com>
In-Reply-To: <DM6PR12MB40752665F199B53B99DE432CFC860@DM6PR12MB4075.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Enabled=true;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_SetDate=2020-06-05T14:04:41Z; 
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Method=Privileged;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Name=Public_0;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_ActionId=4b76a02e-c23a-4b0a-905c-00002e517422;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_ContentBits=1
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_enabled: true
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_setdate: 2020-06-05T14:13:56Z
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_method: Privileged
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_name: Public_0
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_actionid: 835fbf6b-1cd2-464f-a7a7-0000bc2f03ca
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_contentbits: 0
authentication-results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
x-originating-ip: [58.247.170.242]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 69cc08a6-f276-4040-a040-08d8095ab0a7
x-ms-traffictypediagnostic: DM6PR12MB3066:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB30668F3550A9A8B0BA900F11FC860@DM6PR12MB3066.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0425A67DEF
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pNVOwUM+7l3RjhF9xIlE1nu3szOpxiLSA+QteaNP0qP/hvl5sEbKt+BusMS32fGNb7r2ISe5GseYPK4StoA2RULhQY86D41dMEWB+Gx8ZwS/oPK1+pAjdTS+QwKlbqL0yU1k1GIA1c1L2FUHNfutxRhrrXbXi6mAXW9KhS/v8+xjlP3elok9YnxNafanIDPX6QUxQ0O0spKjQE5FzcAU6nie3U3iPX/e9mItIRScTItM3+nKpGCQfNLz4ABi1919816mAqS2x9JS6Y1zF/WvYfenQVwg8P7neCCjWvIFik/oesNFiPrvgWVdHyZIbo/nTAtaUSDr+o8eCkc3DoYKXsVfQhwjQxD2S521ChtJPmM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4075.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(396003)(136003)(366004)(376002)(39860400002)(346002)(26005)(71200400001)(4326008)(8676002)(86362001)(478600001)(64756008)(66446008)(8936002)(5660300002)(66556008)(2906002)(66946007)(66476007)(966005)(186003)(52536014)(45080400002)(76116006)(316002)(2940100002)(7696005)(9686003)(83380400001)(6506007)(33656002)(55016002)(53546011)(110136005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: WeniQMs2mC4Q+QIuiTl+d2grY39Yk0Vho6wnQFXmWMAYSmhxojTbvHC69XaOZGWaifbpFVXPYWQPL+Li8w6mzJgM5qPGfITbADutUcRr9Wtc3pG3YXMGu0A7b2iBol2XMckFLJGxubcZ5DDV1oz3kG5tFw/B88jWUVVO4O0xFfb1/+ccbLIC8MjvI4Hya9zkhoNHhIquLDCx5DWMEqIPjoYhDX20z7OzpCBjaapCcHoqpV54VGlta4L9a0ziUauQ3j/TgWsMJHwth/CnDES63CWSa4wgZE3dhrCgofngsIhbGyFHV0Tn8V+XAGUW3tGwjLBsVAoMSdnOrLX5qOU5l0/M9NzmWCzDk8XH9GY8KBEDYn4Hd/FprtpbSVqwdkQEtHxaSz5CvhmaXhyPtyi5kI3TCTvsnvEd25V9VBpk7SM0LaTfibp1FQKP6081c3w9UrIK81z52BWvo6V6zBREFbYXQWJ2O0yqcup2jaiA85yXMF1RcBqvC4/S7ocrKXZJ
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69cc08a6-f276-4040-a040-08d8095ab0a7
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2020 14:13:58.6655 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pbghf0YVqHPHwcYVxix74WhPKM4grUifZ5KmjorLDc4pxslhRZNc0zGY/AucZ7M0NA08xoimVxgv5VHdIUrLIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3066
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
Cc: "Xu, Feifei" <Feifei.Xu@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

[AMD Public Use]

It looks more reasonable to me to move the AISC type check to the following. We usually don't add any ASIC type check in atomfirmware interfaces.

	adev->discovery_tmr_size =
		amdgpu_atomfirmware_get_fw_reserved_fb_size(adev);

Regards,
Hawking

-----Original Message-----
From: Zhang, Hawking <Hawking.Zhang@amd.com> 
Sent: Friday, June 5, 2020 22:10
To: Zhang, Hawking <Hawking.Zhang@amd.com>; Gao, Likun <Likun.Gao@amd.com>; amd-gfx@lists.freedesktop.org
Cc: Xu, Feifei <Feifei.Xu@amd.com>
Subject: RE: [PATCH] drm/amdgpu: skip fb size query for navi10 previous asic

[AMD Public Use]

Wait, I see the risk. the amdgpu_ttm_init is general one even the prior Vega10 ASIC will invoke it, and they don't have atomfirmware support.

Regards,
Hawking

-----Original Message-----
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of Zhang, Hawking
Sent: Friday, June 5, 2020 22:05
To: Gao, Likun <Likun.Gao@amd.com>; amd-gfx@lists.freedesktop.org
Cc: Xu, Feifei <Feifei.Xu@amd.com>
Subject: RE: [PATCH] drm/amdgpu: skip fb size query for navi10 previous asic

[AMD Public Use]

Does it mean there is legacy VBIOS that even doesn't have firmwareinfo table and introduce crash?

I think we expect the atomfirmware interface return 0 for ASICs prior to Sienna Cichlid

Regards,
Hawking

-----Original Message-----
From: Gao, Likun <Likun.Gao@amd.com> 
Sent: Friday, June 5, 2020 21:04
To: amd-gfx@lists.freedesktop.org
Cc: Zhang, Hawking <Hawking.Zhang@amd.com>; Xu, Feifei <Feifei.Xu@amd.com>; Gao, Likun <Likun.Gao@amd.com>
Subject: [PATCH] drm/amdgpu: skip fb size query for navi10 previous asic

From: Likun Gao <Likun.Gao@amd.com>

Skip for reserved fb size query for the ASIC older than navi10, as those asic do not need for TMR region reserve and may get an invalid value.

Signed-off-by: Likun Gao <Likun.Gao@amd.com>
Change-Id: Idbc57805b8070f27ba6c3cf22f1892d6dab92f06
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c
index a9adccfda4c0..e2a64ae7bcaf 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c
@@ -603,6 +603,9 @@ int amdgpu_atomfirmware_get_fw_reserved_fb_size(struct amdgpu_device *adev)
 	u8 frev, crev;
 	int fw_reserved_fb_size;
 
+	if (adev->asic_type < CHIP_NAVI10)
+		return 0;
+
 	index = get_index_into_master_table(atom_master_list_of_data_tables_v2_1,
 			firmwareinfo);
 
--
2.25.1
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;data=02%7C01%7Chawking.zhang%40amd.com%7C3e694422d2454046603e08d809596b07%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637269626942920124&amp;sdata=n7NDuLsmSx66FSf8OXd4rpq%2FLXNmTEAo%2BiWAuqSRbC0%3D&amp;reserved=0
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
