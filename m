Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D86C38ED1D
	for <lists+amd-gfx@lfdr.de>; Thu, 15 Aug 2019 15:40:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 771336E3F4;
	Thu, 15 Aug 2019 13:40:54 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680085.outbound.protection.outlook.com [40.107.68.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 174A56E3F4
 for <amd-gfx@lists.freedesktop.org>; Thu, 15 Aug 2019 13:40:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BCewmxT/PNfXFZ9P0bm35kogfBInnZA5rXVWeiYaD3zl4379T/AQ4VE75PmofhzlKHb7mpkepbxRckna8zSLyZxblrxUHikodghQf7GgMGXz+sfy3CgkAf0FAsauGZdXK7qMtamyyvOaAN+6SaDr31E38A3sSXdXHuw9r48BXKjgRLU96b7lSep299TtzyHNEZMkdROjkOtMz9NJ/CAnHzzhEMwB2X3tlV6nh1Tf4evlj5ZlKJ5CeqHNdkT2rfPmb71B35cF8OtqLTPteB6mbEBbovfB5T93KkUIMYZO0TeL84hynf9m2z4g+Wv8ugXqpE3ZJZcsz2bNkyAyT1Y2+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WMX2PmtPedXj2V7H+/F1k9BEVEknkj2+P8672vuoAPE=;
 b=cv1qfPzlqPz2L9Ir59evuFPxKc6XMdjpAVEQtl5Hza8Kf0Ct6GYTgfAr/zgtEbvlbByqcSsH4EDHkx8hvxyPXo1DaOKzJ6oXAyQO++sserbvEx5In5Mi90lUHRJwEnPYHXdRpIb0ewJkPn5yExG9O3XieGdQXiyiJ52fFiiChwT/S4LI9cEJVJlUwZr+hm7/q00IFFA+uv22JEr2y2iqeyxVvXQqNYxn1iNUHEsP4MC0H2w0CQ4mfhEZQYlBzP8F2Sgw1x5CvxuD1Y5sVsw3kzDEiTBeNS+fkqchlhqDzzbM3iZObSVw/afBRVGTMLsh2lqs6PJsiLSNt1M53MgmWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN6PR12MB1809.namprd12.prod.outlook.com (10.175.101.17) by
 BN6PR12MB1457.namprd12.prod.outlook.com (10.172.24.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Thu, 15 Aug 2019 13:40:46 +0000
Received: from BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::8542:935:262c:53d1]) by BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::8542:935:262c:53d1%10]) with mapi id 15.20.2178.016; Thu, 15 Aug 2019
 13:40:46 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/amdgpu: add firmware header printing for psp fw
 loading
Thread-Topic: [PATCH 2/2] drm/amdgpu: add firmware header printing for psp fw
 loading
Thread-Index: AQHVU06a00LXup6b70ST78XRZTk5nab8N104
Date: Thu, 15 Aug 2019 13:40:46 +0000
Message-ID: <BN6PR12MB180964CBF7F0391D91F69D51F7AC0@BN6PR12MB1809.namprd12.prod.outlook.com>
References: <20190815094815.20819-1-xiaojie.yuan@amd.com>,
 <20190815094815.20819-2-xiaojie.yuan@amd.com>
In-Reply-To: <20190815094815.20819-2-xiaojie.yuan@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.58.219.65]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 69c0a2b5-173a-484c-b3cd-08d721862d76
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN6PR12MB1457; 
x-ms-traffictypediagnostic: BN6PR12MB1457:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN6PR12MB145763DFB0C4B6B5ADE4972BF7AC0@BN6PR12MB1457.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:826;
x-forefront-prvs: 01304918F3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(366004)(39850400004)(396003)(346002)(189003)(199004)(81166006)(81156014)(8936002)(5660300002)(8676002)(229853002)(14454004)(26005)(86362001)(110136005)(54906003)(99286004)(186003)(53546011)(478600001)(33656002)(6506007)(102836004)(7696005)(52536014)(19627405001)(105004)(76176011)(446003)(11346002)(486006)(476003)(316002)(2501003)(3846002)(966005)(25786009)(4326008)(6436002)(256004)(74316002)(6116002)(9686003)(236005)(2906002)(6306002)(54896002)(66946007)(66476007)(66556008)(64756008)(66446008)(55016002)(6246003)(76116006)(53936002)(606006)(66066001)(71190400001)(7736002)(71200400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1457;
 H:BN6PR12MB1809.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: shiK9FkY6b3jN+RJGAcilJi36nE02Wi4VDNd4B1wEoTHqznOdKfsAttXSWm3mXOrLNuDDtXg0bawUJzelgvFb4PePROfhOZXejrgDILOKuj6RkmfBV8S3EqxXrxnYYB5Chkqiw9m82Kgbqrj0Rf2th9n67mnaMS2IuglcwlEjbzVDJiNEtNwYAwTkrpDxJTrxzlMTr7ft+zkaIm6qQTBC01esrRc1Pi/v2GQRBI8e3C9S6VzMT+TA92jCy+UMCLzKSv7pFZv+6F+UWSZUYXQ/9XQQFN/7dwCewVQCiJH40O3nOBgOyw8eU+4nTpGfNRcO1dyv50sKnvWgCb/2FU6FNBED61E5LsXFdI33frOtivioSVQ4RXCHIuV44vRmyquVQ7SE1Kxp/E7TsyrNSmsc8yyHJThFjm2Mhw/mu3mLq8=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69c0a2b5-173a-484c-b3cd-08d721862d76
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2019 13:40:46.6323 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6RqjiH+MoNT8EXgQ49PCY9sckQTZfZIkqrymgXbvsg4Dnfsycj1SB+rPUWZgBkcQexXQLa+XMBNWvKJHKnlsEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1457
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WMX2PmtPedXj2V7H+/F1k9BEVEknkj2+P8672vuoAPE=;
 b=zN0EjdbHllr30JfavSfKCP8dGwYK1dYM0t/J8r3ajOlOPDEd3qR8JsBohD82Si5PsLxgWLsW2H98ZFTpfuRZVDlHh32exI9xEqhtwtcj0xvAF7pc5oo8Y2tntO/Uc5MMCs94nCA9952U5Y6R19ifshtfHcVhx2NhKXBqqvZr8yY=
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
Cc: "Xiao, Jack" <Jack.Xiao@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>, "Zhang,
 Hawking" <Hawking.Zhang@amd.com>
Content-Type: multipart/mixed; boundary="===============0231450004=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0231450004==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN6PR12MB180964CBF7F0391D91F69D51F7AC0BN6PR12MB1809namp_"

--_000_BN6PR12MB180964CBF7F0391D91F69D51F7AC0BN6PR12MB1809namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Series is:
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Yuan, Xi=
aojie <Xiaojie.Yuan@amd.com>
Sent: Thursday, August 15, 2019 5:48 AM
To: amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>
Cc: Xiao, Jack <Jack.Xiao@amd.com>; Huang, Ray <Ray.Huang@amd.com>; Yuan, X=
iaojie <Xiaojie.Yuan@amd.com>; Zhang, Hawking <Hawking.Zhang@amd.com>
Subject: [PATCH 2/2] drm/amdgpu: add firmware header printing for psp fw lo=
ading

firmware header information is printed for direct fw loading but not
added for psp fw loading yet

Signed-off-by: Xiaojie Yuan <xiaojie.yuan@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c | 54 +++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c b/drivers/gpu/drm/amd/=
amdgpu/amdgpu_psp.c
index 4b2d2fd72dc6..7715c0da5229 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
@@ -944,6 +944,58 @@ static int psp_get_fw_type(struct amdgpu_firmware_info=
 *ucode,
         return 0;
 }

+static void psp_print_fw_hdr(struct psp_context *psp,
+                            struct amdgpu_firmware_info *ucode)
+{
+       struct amdgpu_device *adev =3D psp->adev;
+       const struct sdma_firmware_header_v1_0 *sdma_hdr =3D
+               (const struct sdma_firmware_header_v1_0 *)
+               adev->sdma.instance[ucode->ucode_id - AMDGPU_UCODE_ID_SDMA0=
].fw->data;
+       const struct gfx_firmware_header_v1_0 *ce_hdr =3D
+               (const struct gfx_firmware_header_v1_0 *)adev->gfx.ce_fw->d=
ata;
+       const struct gfx_firmware_header_v1_0 *pfp_hdr =3D
+               (const struct gfx_firmware_header_v1_0 *)adev->gfx.pfp_fw->=
data;
+       const struct gfx_firmware_header_v1_0 *me_hdr =3D
+               (const struct gfx_firmware_header_v1_0 *)adev->gfx.me_fw->d=
ata;
+       const struct gfx_firmware_header_v1_0 *mec_hdr =3D
+               (const struct gfx_firmware_header_v1_0 *)adev->gfx.mec_fw->=
data;
+       const struct rlc_firmware_header_v2_0 *rlc_hdr =3D
+               (const struct rlc_firmware_header_v2_0 *)adev->gfx.rlc_fw->=
data;
+       const struct smc_firmware_header_v1_0 *smc_hdr =3D
+               (const struct smc_firmware_header_v1_0 *)adev->pm.fw->data;
+
+       switch (ucode->ucode_id) {
+       case AMDGPU_UCODE_ID_SDMA0:
+       case AMDGPU_UCODE_ID_SDMA1:
+       case AMDGPU_UCODE_ID_SDMA2:
+       case AMDGPU_UCODE_ID_SDMA3:
+       case AMDGPU_UCODE_ID_SDMA4:
+       case AMDGPU_UCODE_ID_SDMA5:
+       case AMDGPU_UCODE_ID_SDMA6:
+       case AMDGPU_UCODE_ID_SDMA7:
+               amdgpu_ucode_print_sdma_hdr(&sdma_hdr->header);
+               break;
+       case AMDGPU_UCODE_ID_CP_CE:
+               amdgpu_ucode_print_gfx_hdr(&ce_hdr->header);
+               break;
+       case AMDGPU_UCODE_ID_CP_PFP:
+               amdgpu_ucode_print_gfx_hdr(&pfp_hdr->header);
+               break;
+       case AMDGPU_UCODE_ID_CP_ME:
+               amdgpu_ucode_print_gfx_hdr(&me_hdr->header);
+               break;
+       case AMDGPU_UCODE_ID_CP_MEC1:
+               amdgpu_ucode_print_gfx_hdr(&mec_hdr->header);
+               break;
+       case AMDGPU_UCODE_ID_RLC_G:
+               amdgpu_ucode_print_rlc_hdr(&rlc_hdr->header);
+               break;
+       case AMDGPU_UCODE_ID_SMC:
+               amdgpu_ucode_print_smc_hdr(&smc_hdr->header);
+               break;
+       }
+}
+
 static int psp_prep_load_ip_fw_cmd_buf(struct amdgpu_firmware_info *ucode,
                                        struct psp_gfx_cmd_resp *cmd)
 {
@@ -1028,6 +1080,8 @@ static int psp_np_fw_load(struct psp_context *psp)
                     ucode->ucode_id =3D=3D AMDGPU_UCODE_ID_CP_MEC2_JT)
                         continue;

+               psp_print_fw_hdr(psp, ucode);
+
                 ret =3D psp_execute_np_fw_load(psp, ucode);
                 if (ret)
                         return ret;
--
2.20.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_BN6PR12MB180964CBF7F0391D91F69D51F7AC0BN6PR12MB1809namp_
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
ounces@lists.freedesktop.org&gt; on behalf of Yuan, Xiaojie &lt;Xiaojie.Yua=
n@amd.com&gt;<br>
<b>Sent:</b> Thursday, August 15, 2019 5:48 AM<br>
<b>To:</b> amd-gfx@lists.freedesktop.org &lt;amd-gfx@lists.freedesktop.org&=
gt;<br>
<b>Cc:</b> Xiao, Jack &lt;Jack.Xiao@amd.com&gt;; Huang, Ray &lt;Ray.Huang@a=
md.com&gt;; Yuan, Xiaojie &lt;Xiaojie.Yuan@amd.com&gt;; Zhang, Hawking &lt;=
Hawking.Zhang@amd.com&gt;<br>
<b>Subject:</b> [PATCH 2/2] drm/amdgpu: add firmware header printing for ps=
p fw loading</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">firmware header information is printed for direct =
fw loading but not<br>
added for psp fw loading yet<br>
<br>
Signed-off-by: Xiaojie Yuan &lt;xiaojie.yuan@amd.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c | 54 &#43;&#43;&#43;&#43;&#43=
;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43=
;&#43;&#43;&#43;&#43;&#43;<br>
&nbsp;1 file changed, 54 insertions(&#43;)<br>
<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c b/drivers/gpu/drm/amd/=
amdgpu/amdgpu_psp.c<br>
index 4b2d2fd72dc6..7715c0da5229 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c<br>
@@ -944,6 &#43;944,58 @@ static int psp_get_fw_type(struct amdgpu_firmware_=
info *ucode,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&nbsp;}<br>
&nbsp;<br>
&#43;static void psp_print_fw_hdr(struct psp_context *psp,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; struct amdgpu_firmware_info *ucode)<br>
&#43;{<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_device *adev =3D ps=
p-&gt;adev;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const struct sdma_firmware_header=
_v1_0 *sdma_hdr =3D<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; (const struct sdma_firmware_header_v1_0 *)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; adev-&gt;sdma.instance[ucode-&gt;ucode_id - AMDGPU_UCODE_ID_=
SDMA0].fw-&gt;data;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const struct gfx_firmware_header_=
v1_0 *ce_hdr =3D<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; (const struct gfx_firmware_header_v1_0 *)adev-&gt;gfx.ce_fw-=
&gt;data;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const struct gfx_firmware_header_=
v1_0 *pfp_hdr =3D<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; (const struct gfx_firmware_header_v1_0 *)adev-&gt;gfx.pfp_fw=
-&gt;data;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const struct gfx_firmware_header_=
v1_0 *me_hdr =3D<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; (const struct gfx_firmware_header_v1_0 *)adev-&gt;gfx.me_fw-=
&gt;data;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const struct gfx_firmware_header_=
v1_0 *mec_hdr =3D<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; (const struct gfx_firmware_header_v1_0 *)adev-&gt;gfx.mec_fw=
-&gt;data;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const struct rlc_firmware_header_=
v2_0 *rlc_hdr =3D<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; (const struct rlc_firmware_header_v2_0 *)adev-&gt;gfx.rlc_fw=
-&gt;data;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const struct smc_firmware_header_=
v1_0 *smc_hdr =3D<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; (const struct smc_firmware_header_v1_0 *)adev-&gt;pm.fw-&gt;=
data;<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; switch (ucode-&gt;ucode_id) {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case AMDGPU_UCODE_ID_SDMA0:<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case AMDGPU_UCODE_ID_SDMA1:<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case AMDGPU_UCODE_ID_SDMA2:<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case AMDGPU_UCODE_ID_SDMA3:<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case AMDGPU_UCODE_ID_SDMA4:<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case AMDGPU_UCODE_ID_SDMA5:<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case AMDGPU_UCODE_ID_SDMA6:<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case AMDGPU_UCODE_ID_SDMA7:<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; amdgpu_ucode_print_sdma_hdr(&amp;sdma_hdr-&gt;header);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; break;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case AMDGPU_UCODE_ID_CP_CE:<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; amdgpu_ucode_print_gfx_hdr(&amp;ce_hdr-&gt;header);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; break;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case AMDGPU_UCODE_ID_CP_PFP:<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; amdgpu_ucode_print_gfx_hdr(&amp;pfp_hdr-&gt;header);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; break;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case AMDGPU_UCODE_ID_CP_ME:<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; amdgpu_ucode_print_gfx_hdr(&amp;me_hdr-&gt;header);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; break;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case AMDGPU_UCODE_ID_CP_MEC1:<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; amdgpu_ucode_print_gfx_hdr(&amp;mec_hdr-&gt;header);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; break;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case AMDGPU_UCODE_ID_RLC_G:<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; amdgpu_ucode_print_rlc_hdr(&amp;rlc_hdr-&gt;header);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; break;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case AMDGPU_UCODE_ID_SMC:<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; amdgpu_ucode_print_smc_hdr(&amp;smc_hdr-&gt;header);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; break;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&#43;}<br>
&#43;<br>
&nbsp;static int psp_prep_load_ip_fw_cmd_buf(struct amdgpu_firmware_info *u=
code,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; struct psp_gfx_cmd_resp *cmd)<br>
&nbsp;{<br>
@@ -1028,6 &#43;1080,8 @@ static int psp_np_fw_load(struct psp_context *psp=
)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ucode-&gt;ucode_id =3D=3D AMD=
GPU_UCODE_ID_CP_MEC2_JT)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; conti=
nue;<br>
&nbsp;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; psp_print_fw_hdr(psp, ucode);<br>
&#43;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; ret =3D psp_execute_np_fw_load(psp, ucode);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; if (ret)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; retur=
n ret;<br>
-- <br>
2.20.1<br>
<br>
_______________________________________________<br>
amd-gfx mailing list<br>
amd-gfx@lists.freedesktop.org<br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/amd-gfx">https://=
lists.freedesktop.org/mailman/listinfo/amd-gfx</a></div>
</span></font></div>
</body>
</html>

--_000_BN6PR12MB180964CBF7F0391D91F69D51F7AC0BN6PR12MB1809namp_--

--===============0231450004==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0231450004==--
