Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 744371A433F
	for <lists+amd-gfx@lfdr.de>; Fri, 10 Apr 2020 10:00:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 002116EC87;
	Fri, 10 Apr 2020 08:00:36 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2070.outbound.protection.outlook.com [40.107.223.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D816C6EC87
 for <amd-gfx@lists.freedesktop.org>; Fri, 10 Apr 2020 08:00:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oEIdmRPvY7JZ59J0SdrHIJqs71TrWHKRm5hPeAcNAJ+NtOy7h8CZMZtMkXxzE68rnZguFVbrkUG7t4Xq37Hsjg6r9qH6rQZQ46TckJGp7Pf71pYEQKxVHAkw1FDFSOavtTZlAvW2eS19C6IFcD9r3VKVTqy9KqH7TZdh7W4caULw/Ski8f1PWVsJkLUG/FRD5F81G1oQtiU9CKFHWpmfiE4l0SLc85rpw4kC/+qpA3VJ7zOH/yA20MLQikXSyWA8TYiIHYylexKuB8p7nUtct0QmRhKYhY/f8a1RdoPndMVjJ7K6kKoFrXwQGPrDySQc+9OGg791eR2CwfSz8BFtwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wKoaQoBJkSelzFqXbpOJfvzMO1s6w7tXa5HS/QVDZmI=;
 b=m17SZZM31/mwG67oBMLHlMEFcXqajoD82TMUzwlVVg5IRjUyOOFwVw5B8S64ip9IQD4uhA4LAXUCR2uIw+smVf4ZwyFjiRgmRywUBZ6S2gw9Uxqk8RgaY2iYnfqXK6o+1iB3q3NibXrCn0g53cyjzguzBTODCr080/U32aoZs9gsLpIpoMk+arwGiPVRDVFa8XzcR5Cf6kz2mUWa9hSYff94jnxnYUL2WMZhaMDy8B/nlSHiRfgWAHmE+ZZWpHvdu1hZGm7zb3aXLT6/CBd4OWS8k7AsWtdTlv1gheR9ajNnw6soEIQJG/BlJitqTrXdo4RU8dpge0U+neTvcC+jPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wKoaQoBJkSelzFqXbpOJfvzMO1s6w7tXa5HS/QVDZmI=;
 b=FcJULItOvYcQOdoXJpELXoPaaC5ZBmuv54Jo20LwVsXjZwqC+12GotRAQGpeo/lOqsi3tIp+4FRm3VlhscY+dAm3Ok1xm2BKzjlgqqPXT1D10Qa/a6txna0eSdsyALmc62fwWkoOTbyge5MaVpTxAKP7yL5+2+7krEJKPqEeTeI=
Received: from BN6PR12MB1283.namprd12.prod.outlook.com (2603:10b6:404:19::8)
 by BN6PR12MB1524.namprd12.prod.outlook.com (2603:10b6:405:4::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.15; Fri, 10 Apr
 2020 08:00:33 +0000
Received: from BN6PR12MB1283.namprd12.prod.outlook.com
 ([fe80::60b6:8e56:2853:614a]) by BN6PR12MB1283.namprd12.prod.outlook.com
 ([fe80::60b6:8e56:2853:614a%5]) with mapi id 15.20.2878.022; Fri, 10 Apr 2020
 08:00:33 +0000
From: "Chen, Guchun" <Guchun.Chen@amd.com>
To: "Zhang, Hawking" <Hawking.Zhang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "Li, Dennis" <Dennis.Li@amd.com>, "Zhou1, 
 Tao" <Tao.Zhou1@amd.com>, "Clements, John" <John.Clements@amd.com>
Subject: RE: [PATCH] drm/amdgpu: add uncorrectable error count print in UMC
 ecc irq cb
Thread-Topic: [PATCH] drm/amdgpu: add uncorrectable error count print in UMC
 ecc irq cb
Thread-Index: AQHWDuvqsSAWGrZhHEW++nfZhlP1CqhxywAAgAACPACAAACuAIAAMCxQ
Date: Fri, 10 Apr 2020 08:00:33 +0000
Message-ID: <BN6PR12MB12832AE86B47DCBCA2C94F26F1DE0@BN6PR12MB1283.namprd12.prod.outlook.com>
References: <20200410035528.27347-1-guchun.chen@amd.com>
 <DM6PR12MB4075902286A10D35E42015D1FCDE0@DM6PR12MB4075.namprd12.prod.outlook.com>
 <DM6PR12MB4075841B0C5015B48AF45EA8FCDE0@DM6PR12MB4075.namprd12.prod.outlook.com>
 <DM6PR12MB407589D518D861C2479E77BAFCDE0@DM6PR12MB4075.namprd12.prod.outlook.com>
In-Reply-To: <DM6PR12MB407589D518D861C2479E77BAFCDE0@DM6PR12MB4075.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Enabled=true;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_SetDate=2020-04-10T08:00:07Z; 
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Method=Privileged;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Name=Public_0;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_ActionId=f09b79d7-7e47-4c0b-bf46-0000c91d3e3f;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_ContentBits=1
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_enabled: true
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_setdate: 2020-04-10T08:00:30Z
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_method: Privileged
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_name: Public_0
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_actionid: 19bede26-08a7-48a6-827b-000002d10d39
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_contentbits: 0
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Guchun.Chen@amd.com; 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 1c314256-870a-417f-380b-08d7dd253f19
x-ms-traffictypediagnostic: BN6PR12MB1524:|BN6PR12MB1524:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN6PR12MB152414B2DECD9D81D4A339BBF1DE0@BN6PR12MB1524.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0369E8196C
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR12MB1283.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10009020)(4636009)(346002)(376002)(39860400002)(136003)(396003)(366004)(64756008)(76116006)(66946007)(66556008)(81156014)(5660300002)(8936002)(6506007)(2906002)(66476007)(52536014)(66446008)(86362001)(186003)(110136005)(55016002)(7696005)(6636002)(316002)(9686003)(478600001)(71200400001)(8676002)(33656002)(966005)(30864003)(26005);
 DIR:OUT; SFP:1101; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: x9/7MoJqRnEu2hdHgFabvzGXlnlOyvVHA27Y/ZeSjyjbjdbJ27hMiy+Mr/5+2fReqH1R1IUqpOmkU83hWksOTvxsDADib1fHdPTGMwcr+cjNHMoLKJ2AdlKnQbadI6fSWdMnc4efkDSpWisQw8Sj8g7Vsh3RnE0bV+kcSWFxbxVGiiNr73ESp2YNOBXbXlh040etID6FFwXv6P2UIrLppLfHiW0eID+hFkCJG4QjhKyYVpeNseIAM1Mr7ZfTPYZ0e2NRRbk9ZeOmrD8siD4uZlHfunHgsmRo5TVXRnSRu2bRcqG3y3u0e5oL7w3JxojC7EvLbcQaiXNMhVLhc2CPYLiu0IponI8lG7Tzzrlvo2URV9Gbjtey2BvPszlB54/cybIIRWLLUbu2NhHaq9N+5R+YZCNpo+zRcuJKCMveperFrIx6ug+vhd8MLljMe2BA
x-ms-exchange-antispam-messagedata: TWp//07O7/GA0Za2Aqpn3MpghZRcr6eDveSD/AcmONgSMwzHLYwFtoYeRaXZpDr+Dg+5i/5QVddaJrpVosG+LP2eSLYHPZvUjHKadQnvLfnW4xpAkLkmR0ylyNG0TEbKQduvdg/Gfr7MGoaafY3NAA==
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c314256-870a-417f-380b-08d7dd253f19
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Apr 2020 08:00:33.5541 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WuAHg+bH7zItTwIx+Mie4t6Nz07za4ROpOeabS1HAcXmjeq1hzadskZnDFmsCQNxEcCLxTv05hlpScIJD1o4mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1524
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
Content-Type: multipart/mixed; boundary="===============1191506750=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1191506750==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN6PR12MB12832AE86B47DCBCA2C94F26F1DE0BN6PR12MB1283namp_"

--_000_BN6PR12MB12832AE86B47DCBCA2C94F26F1DE0BN6PR12MB1283namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

[AMD Public Use]

Hi Hawking,

I submitted one new patch to address these rules just now. Please review.

Regards,
Guchun

_____________________________________________
From: Zhang, Hawking <Hawking.Zhang@amd.com>
Sent: Friday, April 10, 2020 1:07 PM
To: Chen, Guchun <Guchun.Chen@amd.com>; amd-gfx@lists.freedesktop.org; Li, =
Dennis <Dennis.Li@amd.com>; Zhou1, Tao <Tao.Zhou1@amd.com>; Clements, John =
<John.Clements@amd.com>
Subject: RE: [PATCH] drm/amdgpu: add uncorrectable error count print in UMC=
 ecc irq cb


[AMD Official Use Only - Internal Distribution Only]

Hi Guchun,

I put all the rules together. Please make the patch accordingly.

1). Use "correctable/uncorrectable *hardware* error", instead of just "corr=
ectable/uncorrectable error" in all callback functions that prints RAS erro=
r counters
2). Add wording "no user action necessary" for all the "correctable error" =
related kernel messages
3). For the sync flood interrupt, let's not just indicate ATHUB_ERROR_EVENT=
 type, but also "uncorrectable hardware error (ERREVENT_ATHUB_INT) detected=
". And so does the BIF interrupt for the UE.
4). Replace DRM_INFO with dev_info for all the RAS related kernel messaging=
.

Regards,
Hawking

-----Original Message-----
From: Zhang, Hawking
Sent: Friday, April 10, 2020 13:05
To: Chen, Guchun <Guchun.Chen@amd.com<mailto:Guchun.Chen@amd.com>>; 'amd-gf=
x@lists.freedesktop.org' <amd-gfx@lists.freedesktop.org<mailto:amd-gfx@list=
s.freedesktop.org>>; Li, Dennis <Dennis.Li@amd.com<mailto:Dennis.Li@amd.com=
>>; Zhou1, Tao <Tao.Zhou1@amd.com<mailto:Tao.Zhou1@amd.com>>; Clements, Joh=
n <John.Clements@amd.com<mailto:John.Clements@amd.com>>
Subject: RE: [PATCH] drm/amdgpu: add uncorrectable error count print in UMC=
 ecc irq cb

[AMD Official Use Only - Internal Distribution Only]

And some more rules in RAS wording in kernel message.

1). Use "correctable/uncorrectable *hardware* error", instead of just "corr=
ectable/uncorrectable error" in all callback functions that prints RAS erro=
r counters 2). Add wording "no user action necessary" for all the "correcta=
ble error" related kernel messages 3). For the sync flood interrupt, let's =
not just indicate ATHUB_ERROR_EVENT type, but also "uncorrectable hardware =
error (ERREVENT_ATHUB_INT) detected". And so does the BIF interrupt for the=
 ue.

Regards,
Hawking

-----Original Message-----
From: Zhang, Hawking
Sent: Friday, April 10, 2020 12:57
To: Chen, Guchun <Guchun.Chen@amd.com<mailto:Guchun.Chen@amd.com>>; amd-gfx=
@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org>; Li, Dennis <D=
ennis.Li@amd.com<mailto:Dennis.Li@amd.com>>; Zhou1, Tao <Tao.Zhou1@amd.com<=
mailto:Tao.Zhou1@amd.com>>; Clements, John <John.Clements@amd.com<mailto:Jo=
hn.Clements@amd.com>>
Subject: RE: [PATCH] drm/amdgpu: add uncorrectable error count print in UMC=
 ecc irq cb

[AMD Official Use Only - Internal Distribution Only]

Hello Guchun,

Besides this, could you please also make a patch to replace DRM_INFO with d=
ev_info in amdgpu_ras_check_supported. Basically, we'd prefer to have devic=
e bdf as the prefix in RAS related wording in kernel message, instead of DR=
M pre-fix.

Please also have a review again on the other RAS wording in case there is s=
till use DRM_INFO for the print out message. We shall let user know exactly=
 gpu device for any RAS error information.

Regards,
Hawking
-----Original Message-----
From: Chen, Guchun <Guchun.Chen@amd.com<mailto:Guchun.Chen@amd.com>>
Sent: Friday, April 10, 2020 11:55
To: amd-gfx@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org>; Zh=
ang, Hawking <Hawking.Zhang@amd.com<mailto:Hawking.Zhang@amd.com>>; Li, Den=
nis <Dennis.Li@amd.com<mailto:Dennis.Li@amd.com>>; Zhou1, Tao <Tao.Zhou1@am=
d.com<mailto:Tao.Zhou1@amd.com>>; Clements, John <John.Clements@amd.com<mai=
lto:John.Clements@amd.com>>
Cc: Chen, Guchun <Guchun.Chen@amd.com<mailto:Guchun.Chen@amd.com>>
Subject: [PATCH] drm/amdgpu: add uncorrectable error count print in UMC ecc=
 irq cb

Uncorrectable error count printing is missed when issuing UMC UE injection.=
 When going to the error count log function in GPU recover work thread, the=
re is no chance to get correct error count value by last error injection an=
d print, because the error status register is automatically cleared after r=
eading in UMC ecc irq callback. So add such message printing in UMC ecc irq=
 cb to be consistent with other RAS error interrupt cases.

Signed-off-by: Guchun Chen <guchun.chen@amd.com<mailto:guchun.chen@amd.com>=
>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_umc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_umc.c b/drivers/gpu/drm/amd/=
amdgpu/amdgpu_umc.c
index f4d40855147b..267f7c30f4dd 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_umc.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_umc.c
@@ -121,6 +121,9 @@ int amdgpu_umc_process_ras_data_cb(struct amdgpu_device=
 *adev,

        /* only uncorrectable error needs gpu reset */
        if (err_data->ue_count) {
+               dev_info(adev->dev, "%ld uncorrectable errors detected in U=
MC block\n",
+                       err_data->ue_count);
+
                if (err_data->err_addr_cnt &&
                    amdgpu_ras_add_bad_pages(adev, err_data->err_addr,
                                                err_data->err_addr_cnt))
--
2.17.1


--_000_BN6PR12MB12832AE86B47DCBCA2C94F26F1DE0BN6PR12MB1283namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<!-- converted from rtf -->
<style><!-- .EmailQuote { margin-left: 1pt; padding-left: 4pt; border-left:=
 #800000 2px solid; } --></style>
</head>
<body>
<font face=3D"Times New Roman" size=3D"3"><span style=3D"font-size:12pt;"><=
a name=3D"_msipheader87abd423"></a>
<div><font face=3D"Arial" size=3D"2" color=3D"#317100"><span style=3D"font-=
size:10pt;">[AMD Public Use]<br>

</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">Hi H=
awking,</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&nbs=
p;</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">I su=
bmitted one new patch to address these rules just now. Please review.</span=
></font></div>
<div><font size=3D"2"><span style=3D"font-size:11pt;">&nbsp;</span></font><=
/div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">Rega=
rds,</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">Guch=
un</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&nbs=
p;</span></font></div>
<div><font face=3D"DengXian" size=3D"2"><span style=3D"font-size:11pt;">___=
__________________________________________<br>

<b>From:</b> Zhang, Hawking &lt;Hawking.Zhang@amd.com&gt; <br>

<b>Sent:</b> Friday, April 10, 2020 1:07 PM<br>

<b>To:</b> Chen, Guchun &lt;Guchun.Chen@amd.com&gt;; amd-gfx@lists.freedesk=
top.org; Li, Dennis &lt;Dennis.Li@amd.com&gt;; Zhou1, Tao &lt;Tao.Zhou1@amd=
.com&gt;; Clements, John &lt;John.Clements@amd.com&gt;<br>

<b>Subject:</b> RE: [PATCH] drm/amdgpu: add uncorrectable error count print=
 in UMC ecc irq cb</span></font></div>
<div><font size=3D"2"><span style=3D"font-size:11pt;">&nbsp;</span></font><=
/div>
<div><font size=3D"2"><span style=3D"font-size:11pt;">&nbsp;</span></font><=
/div>
<a name=3D"_msipheadera92e061b"></a>
<div><font face=3D"Arial" size=3D"2" color=3D"#0078D7"><span style=3D"font-=
size:10pt;">[AMD Official Use Only - Internal Distribution Only]<br>

</span></font></div>
<div><font face=3D"Calibri" size=3D"2" color=3D"#2F5496"><span style=3D"fon=
t-size:11pt;">Hi Guchun,</span></font></div>
<div><font face=3D"Calibri" size=3D"2" color=3D"#2F5496"><span style=3D"fon=
t-size:11pt;">&nbsp;</span></font></div>
<div><font face=3D"Calibri" size=3D"2" color=3D"#2F5496"><span style=3D"fon=
t-size:11pt;">I put all the rules together. Please make the patch according=
ly.</span></font></div>
<div><font face=3D"Calibri" size=3D"2" color=3D"#2F5496"><span style=3D"fon=
t-size:11pt;">&nbsp;</span></font></div>
<div><font face=3D"Calibri" size=3D"2" color=3D"#2F5496"><span style=3D"fon=
t-size:11pt;">1). Use &quot;correctable/uncorrectable *hardware* error&quot=
;, instead of just &quot;correctable/uncorrectable error&quot; in all callb=
ack functions that prints RAS error counters</span></font></div>
<div><font face=3D"Calibri" size=3D"2" color=3D"#2F5496"><span style=3D"fon=
t-size:11pt;">2). Add wording &quot;no user action necessary&quot; for all =
the &quot;correctable error&quot; related kernel messages</span></font></di=
v>
<div><font face=3D"Calibri" size=3D"2" color=3D"#2F5496"><span style=3D"fon=
t-size:11pt;">3). For the sync flood interrupt, let's not just indicate ATH=
UB_ERROR_EVENT type, but also &quot;uncorrectable hardware error (ERREVENT_=
ATHUB_INT) detected&quot;. And so does the BIF interrupt
for the UE.</span></font></div>
<div><font face=3D"Calibri" size=3D"2" color=3D"#2F5496"><span style=3D"fon=
t-size:11pt;">4). Replace DRM_INFO with dev_info for all the RAS related ke=
rnel messaging.</span></font></div>
<div><font face=3D"Calibri" size=3D"2" color=3D"#2F5496"><span style=3D"fon=
t-size:11pt;">&nbsp;</span></font></div>
<div><font face=3D"Calibri" size=3D"2" color=3D"#2F5496"><span style=3D"fon=
t-size:11pt;">Regards,<br>

Hawking</span></font></div>
<div><font size=3D"2"><span style=3D"font-size:11pt;">&nbsp;</span></font><=
/div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">----=
-Original Message-----<br>

From: Zhang, Hawking <br>

Sent: Friday, April 10, 2020 13:05<br>

To: Chen, Guchun &lt;<a href=3D"mailto:Guchun.Chen@amd.com"><font color=3D"=
#0563C1"><u>Guchun.Chen@amd.com</u></font></a>&gt;; 'amd-gfx@lists.freedesk=
top.org' &lt;<a href=3D"mailto:amd-gfx@lists.freedesktop.org"><font color=
=3D"#0563C1"><u>amd-gfx@lists.freedesktop.org</u></font></a>&gt;;
Li, Dennis &lt;<a href=3D"mailto:Dennis.Li@amd.com"><font color=3D"#0563C1"=
><u>Dennis.Li@amd.com</u></font></a>&gt;; Zhou1, Tao &lt;<a href=3D"mailto:=
Tao.Zhou1@amd.com"><font color=3D"#0563C1"><u>Tao.Zhou1@amd.com</u></font><=
/a>&gt;; Clements, John &lt;<a href=3D"mailto:John.Clements@amd.com"><font =
color=3D"#0563C1"><u>John.Clements@amd.com</u></font></a>&gt;<br>

Subject: RE: [PATCH] drm/amdgpu: add uncorrectable error count print in UMC=
 ecc irq cb</span></font></div>
<div><font size=3D"2"><span style=3D"font-size:11pt;">&nbsp;</span></font><=
/div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">[AMD=
 Official Use Only - Internal Distribution Only]</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&nbs=
p;</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">And =
some more rules in RAS wording in kernel message.</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&nbs=
p;</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">1). =
Use &quot;correctable/uncorrectable *hardware* error&quot;, instead of just=
 &quot;correctable/uncorrectable error&quot; in all callback functions that=
 prints RAS error counters 2). Add wording &quot;no user action
necessary&quot; for all the &quot;correctable error&quot; related kernel me=
ssages 3). For the sync flood interrupt, let's not just indicate ATHUB_ERRO=
R_EVENT type, but also &quot;uncorrectable hardware error (ERREVENT_ATHUB_I=
NT) detected&quot;. And so does the BIF interrupt for the
ue.</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&nbs=
p;</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">Rega=
rds,</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">Hawk=
ing</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&nbs=
p;</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">----=
-Original Message-----</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">From=
: Zhang, Hawking</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">Sent=
: Friday, April 10, 2020 12:57</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">To: =
Chen, Guchun &lt;<a href=3D"mailto:Guchun.Chen@amd.com">Guchun.Chen@amd.com=
</a>&gt;; <a href=3D"mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.fr=
eedesktop.org</a>; Li, Dennis &lt;<a href=3D"mailto:Dennis.Li@amd.com">Denn=
is.Li@amd.com</a>&gt;;
Zhou1, Tao &lt;<a href=3D"mailto:Tao.Zhou1@amd.com">Tao.Zhou1@amd.com</a>&g=
t;; Clements, John &lt;<a href=3D"mailto:John.Clements@amd.com">John.Clemen=
ts@amd.com</a>&gt;</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">Subj=
ect: RE: [PATCH] drm/amdgpu: add uncorrectable error count print in UMC ecc=
 irq cb</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&nbs=
p;</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">[AMD=
 Official Use Only - Internal Distribution Only]</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&nbs=
p;</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">Hell=
o Guchun,</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&nbs=
p;</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">Besi=
des this, could you please also make a patch to replace DRM_INFO with dev_i=
nfo in amdgpu_ras_check_supported. Basically, we'd prefer to have device bd=
f as the prefix in RAS related wording
in kernel message, instead of DRM pre-fix.</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&nbs=
p;</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">Plea=
se also have a review again on the other RAS wording in case there is still=
 use DRM_INFO for the print out message. We shall let user know exactly gpu=
 device for any RAS error information.</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&nbs=
p;</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">Rega=
rds,</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">Hawk=
ing</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">----=
-Original Message-----</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">From=
: Chen, Guchun &lt;<a href=3D"mailto:Guchun.Chen@amd.com">Guchun.Chen@amd.c=
om</a>&gt;</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">Sent=
: Friday, April 10, 2020 11:55</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">To: =
<a href=3D"mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesktop.=
org</a>; Zhang, Hawking &lt;<a href=3D"mailto:Hawking.Zhang@amd.com">Hawkin=
g.Zhang@amd.com</a>&gt;; Li, Dennis &lt;<a href=3D"mailto:Dennis.Li@amd.com=
">Dennis.Li@amd.com</a>&gt;;
Zhou1, Tao &lt;<a href=3D"mailto:Tao.Zhou1@amd.com">Tao.Zhou1@amd.com</a>&g=
t;; Clements, John &lt;<a href=3D"mailto:John.Clements@amd.com">John.Clemen=
ts@amd.com</a>&gt;</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">Cc: =
Chen, Guchun &lt;<a href=3D"mailto:Guchun.Chen@amd.com">Guchun.Chen@amd.com=
</a>&gt;</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">Subj=
ect: [PATCH] drm/amdgpu: add uncorrectable error count print in UMC ecc irq=
 cb</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&nbs=
p;</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">Unco=
rrectable error count printing is missed when issuing UMC UE injection. Whe=
n going to the error count log function in GPU recover work thread, there i=
s no chance to get correct error count
value by last error injection and print, because the error status register =
is automatically cleared after reading in UMC ecc irq callback. So add such=
 message printing in UMC ecc irq cb to be consistent with other RAS error i=
nterrupt cases.</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&nbs=
p;</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">Sign=
ed-off-by: Guchun Chen &lt;<a href=3D"mailto:guchun.chen@amd.com">guchun.ch=
en@amd.com</a>&gt;</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">---<=
/span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;"> dri=
vers/gpu/drm/amd/amdgpu/amdgpu_umc.c | 3 &#43;&#43;&#43;</span></font></div=
>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;"> 1 f=
ile changed, 3 insertions(&#43;)</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&nbs=
p;</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">diff=
 --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_umc.c b/drivers/gpu/drm/amd/amdg=
pu/amdgpu_umc.c</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">inde=
x f4d40855147b..267f7c30f4dd 100644</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">--- =
a/drivers/gpu/drm/amd/amdgpu/amdgpu_umc.c</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&#43=
;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/amdgpu_umc.c</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">@@ -=
121,6 &#43;121,9 @@ int amdgpu_umc_process_ras_data_cb(struct amdgpu_device=
 *adev,</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&nbs=
p;</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* only uncorrectable error ne=
eds gpu reset */</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (err_data-&gt;ue_count) {</=
span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&#43=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; dev_info(adev-&gt;dev, &quot;%ld uncorrectable errors detected i=
n UMC block\n&quot;,</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&#43=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; err_data-&gt;ue_=
count);</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&#43=
;</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; if (err_data-&gt;err_addr_cnt &amp;&amp;</span></font></d=
iv>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_ras_add_bad_pages(adev, er=
r_data-&gt;err_addr,</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; err_data-&gt;er=
r_addr_cnt))</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">--</=
span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">2.17=
.1</span></font></div>
<div><font size=3D"2"><span style=3D"font-size:11pt;">&nbsp;</span></font><=
/div>
</span></font>
</body>
</html>

--_000_BN6PR12MB12832AE86B47DCBCA2C94F26F1DE0BN6PR12MB1283namp_--

--===============1191506750==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--===============1191506750==--
