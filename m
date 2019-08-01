Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B667DF49
	for <lists+amd-gfx@lfdr.de>; Thu,  1 Aug 2019 17:44:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BF336E705;
	Thu,  1 Aug 2019 15:44:28 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740049.outbound.protection.outlook.com [40.107.74.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55561892CD
 for <amd-gfx@lists.freedesktop.org>; Thu,  1 Aug 2019 15:44:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jyoaMcR08HBUX64xO6X7oHICwVfn/n2D/qspJUV7muPQp9Swq9KauVfkcH5wx/lyaQbSRSdYoww8z1gHBKKvy8eq9T7j6vnouqvi6cjY6cZfRAl0cSKt32OIXpiqW/rKfPxytmlbm0M13AiF1k2qrcGGlaEscNcYi3EVeZ5G07+gL0JJJlo++sbA81LMtCsN/nkc34vXoCv3QFYnDB2E/tUNdQM0o7MzwnJF/ryq8RsWuTVWv5iGsJjCzU11tOCG2kZclVWVNAz1AsB2Uj5aY3T8e4gKvwWuBzb/GKMOYziq82mmz9zDqNdnogdR8+YxsmlERXRygUmUGSt/9lWiwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cTdnwklWHNlNdqSqg8o6mxYKoaRhC3n8cSDNpsB08dE=;
 b=SEGdLZzQFhcyhlUyhzjrP891ecdyqYOpBxTwtPIiqEWWmr+/9zrK/WNlVPZStrHvM9POjq3SMIGC/U2YP479EQCuE7i0nREK7j1jOHCnTP7JDRLzjcIHkAuiA1zmk4Vws6acMZ/Dy3EcOd/fUrDWi1W5Vdc7ghJUBBNYNverj/Ovz3VGN7LX/34eAmanxCyG3fBRLrnpYS5yn9Yz91HZxWq40Q+ImfIEf3BkoxPrd/U2augBF9aIBvw7CILzcXjXZ9KkCq4e8gw0f+83JqfCYBjoRLXA6HUiicwe6WICJpvLOSlO9HcKJ1beVs6P1c0dQOovndgMtx7dJG1HbdltGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from BN6PR12MB1809.namprd12.prod.outlook.com (10.175.101.17) by
 BN6PR12MB1426.namprd12.prod.outlook.com (10.168.230.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.15; Thu, 1 Aug 2019 15:44:21 +0000
Received: from BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::b90e:dd82:7384:5b7b]) by BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::b90e:dd82:7384:5b7b%11]) with mapi id 15.20.2094.017; Thu, 1 Aug 2019
 15:44:21 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "Russell, Kent" <Kent.Russell@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm/amdgpu: Update NBIO headers to add TXCLK3/4
Thread-Topic: [PATCH 1/2] drm/amdgpu: Update NBIO headers to add TXCLK3/4
Thread-Index: AQHVSF8SYAUYhjAWz0SMxbNnCseh1KbmbxyW
Date: Thu, 1 Aug 2019 15:44:21 +0000
Message-ID: <BN6PR12MB1809CECA61194E8FD9F01F21F7DE0@BN6PR12MB1809.namprd12.prod.outlook.com>
References: <20190801114828.12273-1-kent.russell@amd.com>
In-Reply-To: <20190801114828.12273-1-kent.russell@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [71.219.6.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4c09dc2f-d2b2-43e2-29b2-08d716971f68
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN6PR12MB1426; 
x-ms-traffictypediagnostic: BN6PR12MB1426:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BN6PR12MB1426705DE734F5ED788B6A88F7DE0@BN6PR12MB1426.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:422;
x-forefront-prvs: 01165471DB
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(376002)(39860400002)(396003)(136003)(346002)(199004)(189003)(110136005)(8676002)(6116002)(105004)(6306002)(55016002)(11346002)(26005)(3846002)(54896002)(6436002)(9686003)(14454004)(446003)(25786009)(8936002)(236005)(71200400001)(71190400001)(14444005)(53936002)(256004)(76116006)(186003)(52536014)(316002)(478600001)(6246003)(74316002)(66476007)(486006)(66066001)(66446008)(5660300002)(76176011)(19627405001)(606006)(7696005)(66556008)(86362001)(99286004)(81156014)(81166006)(2906002)(7736002)(2501003)(15650500001)(68736007)(53546011)(64756008)(476003)(229853002)(66946007)(6506007)(102836004)(33656002)(966005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1426;
 H:BN6PR12MB1809.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: m29YCxjOBdp7sPMGuYQefL1pZ7oMkODBo3M4dTe9dkfiZMjq4piFSd5+C09aO4agj0yLhm7MERxqojy6yurvz8Hnas4bQAqQWmQirqdL/Rrp6cC94Ssk2UdgI6RafdM6RRkZgzl3qxCb80uoVFZb5G6wzDAnRuyAQH2frR73QRxH2i4JAl6IKDvo5sVlD42XYsB6D/7S1bnNI5oI23wZIUvIsAWCXFVkx6PjyHp61gl71ZDLwzU0aHKBptnWQVZdOKR9nXQuhqkaBv+dWfIa12555d+QFqdBKllQ1MXyAbLgn7Z+28fp4nzrUKQHgNDIillEwrXa4p7AD4Fs9gZ74PGVXTDtu+Iguq+cGoPp+MA7oj7FRC+RJICxyXKIAZeyBpw2nWxEBZyhkwrSf3T8TH+G+K0WtaIgFq7bjG2RagY=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c09dc2f-d2b2-43e2-29b2-08d716971f68
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2019 15:44:21.7877 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: adeucher@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1426
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cTdnwklWHNlNdqSqg8o6mxYKoaRhC3n8cSDNpsB08dE=;
 b=VC1uPv1KJoUPwE5e1cspnG7kZlztp0jQV4Ct9eB5RbfBNviXx892BE3WhWqsZOnbPeReu01Ut2DAMQPtALUIU++sf6maLyhJLJu9i/YD8QfvC9eTOIDdJzKg4ZKiEaTXDppGdUCpedGASnYtFtnYsXsQ3UmkxcpA9CnVixBhb1I=
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
Content-Type: multipart/mixed; boundary="===============0236257061=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0236257061==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN6PR12MB1809CECA61194E8FD9F01F21F7DE0BN6PR12MB1809namp_"

--_000_BN6PR12MB1809CECA61194E8FD9F01F21F7DE0BN6PR12MB1809namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Series is:
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Russell,=
 Kent <Kent.Russell@amd.com>
Sent: Thursday, August 1, 2019 7:48 AM
To: amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>
Cc: Russell, Kent <Kent.Russell@amd.com>
Subject: [PATCH 1/2] drm/amdgpu: Update NBIO headers to add TXCLK3/4

These are added for VG20, and are needed for PCIe bandwidth.

Change-Id: I54474bb53ed563d083521d24944f5f97d372f001
Signed-off-by: Kent Russell <kent.russell@amd.com>
---
 .../include/asic_reg/nbio/nbio_7_0_sh_mask.h  | 30 +++++++++++++++++++
 .../amd/include/asic_reg/nbio/nbio_7_0_smn.h  |  6 ++++
 2 files changed, 36 insertions(+)

diff --git a/drivers/gpu/drm/amd/include/asic_reg/nbio/nbio_7_0_sh_mask.h b=
/drivers/gpu/drm/amd/include/asic_reg/nbio/nbio_7_0_sh_mask.h
index 88602479a1aa..ee8c15e4543d 100644
--- a/drivers/gpu/drm/amd/include/asic_reg/nbio/nbio_7_0_sh_mask.h
+++ b/drivers/gpu/drm/amd/include/asic_reg/nbio/nbio_7_0_sh_mask.h
@@ -74709,6 +74709,36 @@
 //PCIE_PERF_COUNT1_TXCLK2
 #define PCIE_PERF_COUNT1_TXCLK2__COUNTER1__SHIFT                          =
                                    0x0
 #define PCIE_PERF_COUNT1_TXCLK2__COUNTER1_MASK                            =
                                    0xFFFFFFFFL
+//PCIE_PERF_CNTL_TXCLK3
+#define PCIE_PERF_CNTL_TXCLK3__EVENT0_SEL__SHIFT                          =
                                    0x0
+#define PCIE_PERF_CNTL_TXCLK3__EVENT1_SEL__SHIFT                          =
                                    0x8
+#define PCIE_PERF_CNTL_TXCLK3__COUNTER0_UPPER__SHIFT                      =
                                    0x10
+#define PCIE_PERF_CNTL_TXCLK3__COUNTER1_UPPER__SHIFT                      =
                                    0x18
+#define PCIE_PERF_CNTL_TXCLK3__EVENT0_SEL_MASK                            =
                                    0x000000FFL
+#define PCIE_PERF_CNTL_TXCLK3__EVENT1_SEL_MASK                            =
                                    0x0000FF00L
+#define PCIE_PERF_CNTL_TXCLK3__COUNTER0_UPPER_MASK                        =
                                    0x00FF0000L
+#define PCIE_PERF_CNTL_TXCLK3__COUNTER1_UPPER_MASK                        =
                                    0xFF000000L
+//PCIE_PERF_COUNT0_TXCLK3
+#define PCIE_PERF_COUNT0_TXCLK3__COUNTER0__SHIFT                          =
                                    0x0
+#define PCIE_PERF_COUNT0_TXCLK3__COUNTER0_MASK                            =
                                    0xFFFFFFFFL
+//PCIE_PERF_COUNT1_TXCLK3
+#define PCIE_PERF_COUNT1_TXCLK3__COUNTER1__SHIFT                          =
                                    0x0
+#define PCIE_PERF_COUNT1_TXCLK3__COUNTER1_MASK                            =
                                    0xFFFFFFFFL
+//PCIE_PERF_CNTL_TXCLK4
+#define PCIE_PERF_CNTL_TXCLK4__EVENT0_SEL__SHIFT                          =
                                    0x0
+#define PCIE_PERF_CNTL_TXCLK4__EVENT1_SEL__SHIFT                          =
                                    0x8
+#define PCIE_PERF_CNTL_TXCLK4__COUNTER0_UPPER__SHIFT                      =
                                    0x10
+#define PCIE_PERF_CNTL_TXCLK4__COUNTER1_UPPER__SHIFT                      =
                                    0x18
+#define PCIE_PERF_CNTL_TXCLK4__EVENT0_SEL_MASK                            =
                                    0x000000FFL
+#define PCIE_PERF_CNTL_TXCLK4__EVENT1_SEL_MASK                            =
                                    0x0000FF00L
+#define PCIE_PERF_CNTL_TXCLK4__COUNTER0_UPPER_MASK                        =
                                    0x00FF0000L
+#define PCIE_PERF_CNTL_TXCLK4__COUNTER1_UPPER_MASK                        =
                                    0xFF000000L
+//PCIE_PERF_COUNT0_TXCLK4
+#define PCIE_PERF_COUNT0_TXCLK4__COUNTER0__SHIFT                          =
                                    0x0
+#define PCIE_PERF_COUNT0_TXCLK4__COUNTER0_MASK                            =
                                    0xFFFFFFFFL
+//PCIE_PERF_COUNT1_TXCLK4
+#define PCIE_PERF_COUNT1_TXCLK4__COUNTER1__SHIFT                          =
                                    0x0
+#define PCIE_PERF_COUNT1_TXCLK4__COUNTER1_MASK                            =
                                    0xFFFFFFFFL
 //PCIE_PRBS_CLR
 #define PCIE_PRBS_CLR__PRBS_CLR__SHIFT                                    =
                                    0x0
 #define PCIE_PRBS_CLR__PRBS_POLARITY_EN__SHIFT                            =
                                    0x18
diff --git a/drivers/gpu/drm/amd/include/asic_reg/nbio/nbio_7_0_smn.h b/dri=
vers/gpu/drm/amd/include/asic_reg/nbio/nbio_7_0_smn.h
index caf5ffdc130a..6702575bc6e3 100644
--- a/drivers/gpu/drm/amd/include/asic_reg/nbio/nbio_7_0_smn.h
+++ b/drivers/gpu/drm/amd/include/asic_reg/nbio/nbio_7_0_smn.h
@@ -50,6 +50,12 @@
 #define smnPCIE_PERF_CNTL_TXCLK2                        0x11180254
 #define smnPCIE_PERF_COUNT0_TXCLK2                      0x11180258
 #define smnPCIE_PERF_COUNT1_TXCLK2                      0x1118025c
+#define smnPCIE_PERF_CNTL_TXCLK3                        0x1118021c
+#define smnPCIE_PERF_COUNT0_TXCLK3                      0x11180220
+#define smnPCIE_PERF_COUNT1_TXCLK3                      0x11180224
+#define smnPCIE_PERF_CNTL_TXCLK4                        0x11180228
+#define smnPCIE_PERF_COUNT0_TXCLK4                      0x1118022c
+#define smnPCIE_PERF_COUNT1_TXCLK4                      0x11180230

 #define smnPCIE_RX_NUM_NAK                              0x11180038
 #define smnPCIE_RX_NUM_NAK_GENERATED                    0x1118003c
--
2.17.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_BN6PR12MB1809CECA61194E8FD9F01F21F7DE0BN6PR12MB1809namp_
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
<b>Sent:</b> Thursday, August 1, 2019 7:48 AM<br>
<b>To:</b> amd-gfx@lists.freedesktop.org &lt;amd-gfx@lists.freedesktop.org&=
gt;<br>
<b>Cc:</b> Russell, Kent &lt;Kent.Russell@amd.com&gt;<br>
<b>Subject:</b> [PATCH 1/2] drm/amdgpu: Update NBIO headers to add TXCLK3/4=
</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">These are added for VG20, and are needed for PCIe =
bandwidth.<br>
<br>
Change-Id: I54474bb53ed563d083521d24944f5f97d372f001<br>
Signed-off-by: Kent Russell &lt;kent.russell@amd.com&gt;<br>
---<br>
&nbsp;.../include/asic_reg/nbio/nbio_7_0_sh_mask.h&nbsp; | 30 &#43;&#43;&#4=
3;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#4=
3;&#43;<br>
&nbsp;.../amd/include/asic_reg/nbio/nbio_7_0_smn.h&nbsp; |&nbsp; 6 &#43;&#4=
3;&#43;&#43;<br>
&nbsp;2 files changed, 36 insertions(&#43;)<br>
<br>
diff --git a/drivers/gpu/drm/amd/include/asic_reg/nbio/nbio_7_0_sh_mask.h b=
/drivers/gpu/drm/amd/include/asic_reg/nbio/nbio_7_0_sh_mask.h<br>
index 88602479a1aa..ee8c15e4543d 100644<br>
--- a/drivers/gpu/drm/amd/include/asic_reg/nbio/nbio_7_0_sh_mask.h<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/include/asic_reg/nbio/nbio_7_0_sh_mas=
k.h<br>
@@ -74709,6 &#43;74709,36 @@<br>
&nbsp;//PCIE_PERF_COUNT1_TXCLK2<br>
&nbsp;#define PCIE_PERF_COUNT1_TXCLK2__COUNTER1__SHIFT&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x0<br>
&nbsp;#define PCIE_PERF_COUNT1_TXCLK2__COUNTER1_MASK&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0xFFFFFFFFL<br>
&#43;//PCIE_PERF_CNTL_TXCLK3<br>
&#43;#define PCIE_PERF_CNTL_TXCLK3__EVENT0_SEL__SHIFT&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x0<br>
&#43;#define PCIE_PERF_CNTL_TXCLK3__EVENT1_SEL__SHIFT&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x8<br>
&#43;#define PCIE_PERF_CNTL_TXCLK3__COUNTER0_UPPER__SHIFT&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; 0x10<br>
&#43;#define PCIE_PERF_CNTL_TXCLK3__COUNTER1_UPPER__SHIFT&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; 0x18<br>
&#43;#define PCIE_PERF_CNTL_TXCLK3__EVENT0_SEL_MASK&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x000000FFL<br>
&#43;#define PCIE_PERF_CNTL_TXCLK3__EVENT1_SEL_MASK&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x0000FF00L<br>
&#43;#define PCIE_PERF_CNTL_TXCLK3__COUNTER0_UPPER_MASK&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x00FF0000L<br>
&#43;#define PCIE_PERF_CNTL_TXCLK3__COUNTER1_UPPER_MASK&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0xFF000000L<br>
&#43;//PCIE_PERF_COUNT0_TXCLK3<br>
&#43;#define PCIE_PERF_COUNT0_TXCLK3__COUNTER0__SHIFT&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x0<br>
&#43;#define PCIE_PERF_COUNT0_TXCLK3__COUNTER0_MASK&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0xFFFFFFFFL<br>
&#43;//PCIE_PERF_COUNT1_TXCLK3<br>
&#43;#define PCIE_PERF_COUNT1_TXCLK3__COUNTER1__SHIFT&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x0<br>
&#43;#define PCIE_PERF_COUNT1_TXCLK3__COUNTER1_MASK&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0xFFFFFFFFL<br>
&#43;//PCIE_PERF_CNTL_TXCLK4<br>
&#43;#define PCIE_PERF_CNTL_TXCLK4__EVENT0_SEL__SHIFT&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x0<br>
&#43;#define PCIE_PERF_CNTL_TXCLK4__EVENT1_SEL__SHIFT&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x8<br>
&#43;#define PCIE_PERF_CNTL_TXCLK4__COUNTER0_UPPER__SHIFT&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; 0x10<br>
&#43;#define PCIE_PERF_CNTL_TXCLK4__COUNTER1_UPPER__SHIFT&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; 0x18<br>
&#43;#define PCIE_PERF_CNTL_TXCLK4__EVENT0_SEL_MASK&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x000000FFL<br>
&#43;#define PCIE_PERF_CNTL_TXCLK4__EVENT1_SEL_MASK&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x0000FF00L<br>
&#43;#define PCIE_PERF_CNTL_TXCLK4__COUNTER0_UPPER_MASK&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x00FF0000L<br>
&#43;#define PCIE_PERF_CNTL_TXCLK4__COUNTER1_UPPER_MASK&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0xFF000000L<br>
&#43;//PCIE_PERF_COUNT0_TXCLK4<br>
&#43;#define PCIE_PERF_COUNT0_TXCLK4__COUNTER0__SHIFT&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x0<br>
&#43;#define PCIE_PERF_COUNT0_TXCLK4__COUNTER0_MASK&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0xFFFFFFFFL<br>
&#43;//PCIE_PERF_COUNT1_TXCLK4<br>
&#43;#define PCIE_PERF_COUNT1_TXCLK4__COUNTER1__SHIFT&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x0<br>
&#43;#define PCIE_PERF_COUNT1_TXCLK4__COUNTER1_MASK&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0xFFFFFFFFL<br>
&nbsp;//PCIE_PRBS_CLR<br>
&nbsp;#define PCIE_PRBS_CLR__PRBS_CLR__SHIFT&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; 0x0<br>
&nbsp;#define PCIE_PRBS_CLR__PRBS_POLARITY_EN__SHIFT&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x18<br>
diff --git a/drivers/gpu/drm/amd/include/asic_reg/nbio/nbio_7_0_smn.h b/dri=
vers/gpu/drm/amd/include/asic_reg/nbio/nbio_7_0_smn.h<br>
index caf5ffdc130a..6702575bc6e3 100644<br>
--- a/drivers/gpu/drm/amd/include/asic_reg/nbio/nbio_7_0_smn.h<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/include/asic_reg/nbio/nbio_7_0_smn.h<=
br>
@@ -50,6 &#43;50,12 @@<br>
&nbsp;#define smnPCIE_PERF_CNTL_TXCLK2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; 0x11180254<br>
&nbsp;#define smnPCIE_PERF_COUNT0_TXCLK2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; 0x11180258<br>
&nbsp;#define smnPCIE_PERF_COUNT1_TXCLK2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; 0x1118025c<br>
&#43;#define smnPCIE_PERF_CNTL_TXCLK3&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; 0x1118021c<br>
&#43;#define smnPCIE_PERF_COUNT0_TXCLK3&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; 0x11180220<br>
&#43;#define smnPCIE_PERF_COUNT1_TXCLK3&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; 0x11180224<br>
&#43;#define smnPCIE_PERF_CNTL_TXCLK4&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; 0x11180228<br>
&#43;#define smnPCIE_PERF_COUNT0_TXCLK4&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; 0x1118022c<br>
&#43;#define smnPCIE_PERF_COUNT1_TXCLK4&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; 0x11180230<br>
&nbsp;<br>
&nbsp;#define smnPCIE_RX_NUM_NAK&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x11180038<br>
&nbsp;#define smnPCIE_RX_NUM_NAK_GENERATED&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; 0x1118003c<br>
-- <br>
2.17.1<br>
<br>
_______________________________________________<br>
amd-gfx mailing list<br>
amd-gfx@lists.freedesktop.org<br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/amd-gfx">https://=
lists.freedesktop.org/mailman/listinfo/amd-gfx</a></div>
</span></font></div>
</body>
</html>

--_000_BN6PR12MB1809CECA61194E8FD9F01F21F7DE0BN6PR12MB1809namp_--

--===============0236257061==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0236257061==--
