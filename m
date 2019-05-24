Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 320C229A67
	for <lists+amd-gfx@lfdr.de>; Fri, 24 May 2019 16:54:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B51C36E110;
	Fri, 24 May 2019 14:54:01 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700056.outbound.protection.outlook.com [40.107.70.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E2AE6E110
 for <amd-gfx@lists.freedesktop.org>; Fri, 24 May 2019 14:54:00 +0000 (UTC)
Received: from MWHPR12MB1422.namprd12.prod.outlook.com (10.169.205.8) by
 MWHPR12MB1725.namprd12.prod.outlook.com (10.175.55.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.15; Fri, 24 May 2019 14:53:58 +0000
Received: from MWHPR12MB1422.namprd12.prod.outlook.com
 ([fe80::1810:5dae:1b14:78fd]) by MWHPR12MB1422.namprd12.prod.outlook.com
 ([fe80::1810:5dae:1b14:78fd%2]) with mapi id 15.20.1922.019; Fri, 24 May 2019
 14:53:58 +0000
From: "Abramov, Slava" <Slava.Abramov@amd.com>
To: "StDenis, Tom" <Tom.StDenis@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm/amd/doc: Add XGMI sysfs documentation
Thread-Topic: [PATCH 1/2] drm/amd/doc: Add XGMI sysfs documentation
Thread-Index: AQHVEjPs965QZixG9kSkWyMd73NnpKZ6XJl3
Date: Fri, 24 May 2019 14:53:58 +0000
Message-ID: <MWHPR12MB14220CD84D24757ABCB2D82DFE020@MWHPR12MB1422.namprd12.prod.outlook.com>
References: <20190524132326.7436-1-tom.stdenis@amd.com>
In-Reply-To: <20190524132326.7436-1-tom.stdenis@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a67159af-7c76-47bb-73e7-08d6e057a6fd
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:MWHPR12MB1725; 
x-ms-traffictypediagnostic: MWHPR12MB1725:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MWHPR12MB1725366F458BDAF504FBF87AFE020@MWHPR12MB1725.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2803;
x-forefront-prvs: 0047BC5ADE
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(376002)(366004)(136003)(39860400002)(346002)(199004)(189003)(72206003)(55016002)(66066001)(8676002)(9686003)(110136005)(478600001)(606006)(966005)(68736007)(99286004)(66476007)(66556008)(64756008)(66446008)(76116006)(7696005)(76176011)(73956011)(316002)(66946007)(91956017)(5660300002)(229853002)(256004)(86362001)(6606003)(14444005)(6436002)(71190400001)(71200400001)(25786009)(14454004)(2501003)(6306002)(33656002)(19627405001)(54896002)(81156014)(81166006)(236005)(8936002)(53936002)(6246003)(53546011)(102836004)(74316002)(186003)(6506007)(6116002)(486006)(52536014)(476003)(3846002)(446003)(7736002)(11346002)(26005)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1725;
 H:MWHPR12MB1422.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: c2u9vnZzAAp3P7MN5WtuO9iD7tj9OZNiDorRv/0cUiFzHRPkPT5U23U4UN3e5CXZKsqZD7FGvHQRG0Ck9lN4osnhyjJjvbsLIDHC/Zc77hTIyg3lHf2rJYtA0YZ6gv1QpP54RixMT/ebyxluoJlLF+Krc6heMS1Iau8DprKkD12VHt5DOHZxoyiIyaKFAcNIx+v5aQVgLTmTnq+clglVKs5NtpCL+Ztn6rluwredSaOlA/0YzohzK2RIRcaPALa/mKjE/QSPiy6m95/bSmZAtJHljqyUQYAUrPdBTf8lNBjg9LOq6zldIOLP3fdY472WNH7MyJ8QytS4kTw2vFJ6RoaYWM1lAXigFqkUlph+RJTcmjjL7O736j6QHhXUhhHRLlD0gXaMo+LA3p/Salinh9YYTrWiL1+QFhY57NUZgpg=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a67159af-7c76-47bb-73e7-08d6e057a6fd
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 May 2019 14:53:58.6887 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sabramov@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1725
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NZm6pZeF1FklPLRnzJt6ym0k05eZfMdFjrFJmUncbec=;
 b=CiI9z5A39KKs8hnAuvfXsWmbZtdnXuxdYA9NgiKl/4vzfF3eMglKyh29sGpFyIIrE0Gp+mGCRMSQJIBI4Yaq7zZytNDdKh81NeE7LU1HKWvqg6rouMsrZFMwsNR1SrMT9niV8DQoMXzjWu0wIqsGTflBN5fKnaQF+6JP9EYBdkw=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Slava.Abramov@amd.com; 
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
Content-Type: multipart/mixed; boundary="===============0812945200=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0812945200==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MWHPR12MB14220CD84D24757ABCB2D82DFE020MWHPR12MB1422namp_"

--_000_MWHPR12MB14220CD84D24757ABCB2D82DFE020MWHPR12MB1422namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Acked-by: Slava Abramov <slava.abramov@amd.com>

________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of StDenis,=
 Tom <Tom.StDenis@amd.com>
Sent: Friday, May 24, 2019 9:23:49 AM
To: amd-gfx@lists.freedesktop.org
Cc: StDenis, Tom
Subject: [PATCH 1/2] drm/amd/doc: Add XGMI sysfs documentation

[CAUTION: External Email]

Signed-off-by: Tom St Denis <tom.stdenis@amd.com>
---
 Documentation/gpu/amdgpu.rst             |  9 ++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c | 28 ++++++++++++++++++++++++
 2 files changed, 37 insertions(+)

diff --git a/Documentation/gpu/amdgpu.rst b/Documentation/gpu/amdgpu.rst
index a740e491dfcc..cacfcfad2356 100644
--- a/Documentation/gpu/amdgpu.rst
+++ b/Documentation/gpu/amdgpu.rst
@@ -70,6 +70,15 @@ Interrupt Handling
 .. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
    :internal:

+AMDGPU XGMI Support
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
+   :doc: AMDGPU XGMI Support
+
+.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
+   :internal:
+
 GPU Power/Thermal Controls and Monitoring
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c b/drivers/gpu/drm/amd=
/amdgpu/amdgpu_xgmi.c
index e48e9394f1e4..d11eba09eadd 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
@@ -40,6 +40,34 @@ void *amdgpu_xgmi_hive_try_lock(struct amdgpu_hive_info =
*hive)
        return &hive->device_list;
 }

+/**
+ * DOC: AMDGPU XGMI Support
+ *
+ * XGMI is a high speed interconnect that joins multiple GPU cards
+ * into a homogeneous memory space that is organized by a collective
+ * hive ID and individual node IDs, both of which are 64-bit numbers.
+ *
+ * The file xgmi_device_id contains the unique per GPU device ID and
+ * is stored in the /sys/class/drm/card${cardno}/device/ directory.
+ *
+ * Inside the device directory a sub-directory 'xgmi_hive_info' is
+ * created which contains the hive ID and the list of nodes.
+ *
+ * The hive ID is stored in:
+ *   /sys/class/drm/card${cardno}/device/xgmi_hive_info/xgmi_hive_id
+ *
+ * The node information is stored in numbered directories:
+ *   /sys/class/drm/card${cardno}/device/xgmi_hive_info/node${nodeno}/xgmi=
_device_id
+ *
+ * Each device has their own xgmi_hive_info direction with a mirror
+ * set of node sub-directories.
+ *
+ * The XGMI memory space is built by contiguously adding the power of
+ * two padded VRAM space from each node to each other.
+ *
+ */
+
+
 static ssize_t amdgpu_xgmi_show_hive_id(struct device *dev,
                struct device_attribute *attr, char *buf)
 {
--
2.21.0

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_MWHPR12MB14220CD84D24757ABCB2D82DFE020MWHPR12MB1422namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"><!-- P {margin-top:0;margi=
n-bottom:0;} --></style>
</head>
<body dir=3D"ltr">
<div id=3D"divtagdefaultwrapper" style=3D"font-size:12pt;color:#000000;font=
-family:Calibri,Helvetica,sans-serif;" dir=3D"ltr">
<p style=3D"margin-top:0;margin-bottom:0"><span style=3D"font-family: Calib=
ri, Helvetica, sans-serif, EmojiFont, &quot;Apple Color Emoji&quot;, &quot;=
Segoe UI Emoji&quot;, NotoColorEmoji, &quot;Segoe UI Symbol&quot;, &quot;An=
droid Emoji&quot;, EmojiSymbols; font-size: 16px;">Acked-by: Slava Abramov =
&lt;slava.abramov@amd.com&gt;</span><br>
</p>
</div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> amd-gfx &lt;amd-gfx-b=
ounces@lists.freedesktop.org&gt; on behalf of StDenis, Tom &lt;Tom.StDenis@=
amd.com&gt;<br>
<b>Sent:</b> Friday, May 24, 2019 9:23:49 AM<br>
<b>To:</b> amd-gfx@lists.freedesktop.org<br>
<b>Cc:</b> StDenis, Tom<br>
<b>Subject:</b> [PATCH 1/2] drm/amd/doc: Add XGMI sysfs documentation</font=
>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">[CAUTION: External Email]<br>
<br>
Signed-off-by: Tom St Denis &lt;tom.stdenis@amd.com&gt;<br>
---<br>
&nbsp;Documentation/gpu/amdgpu.rst&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 9 &#43;&#43;&#43;&#43;&#43;&#43;&#4=
3;&#43;<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c | 28 &#43;&#43;&#43;&#43;&#4=
3;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#4=
3;&#43;&#43;&#43;&#43;<br>
&nbsp;2 files changed, 37 insertions(&#43;)<br>
<br>
diff --git a/Documentation/gpu/amdgpu.rst b/Documentation/gpu/amdgpu.rst<br=
>
index a740e491dfcc..cacfcfad2356 100644<br>
--- a/Documentation/gpu/amdgpu.rst<br>
&#43;&#43;&#43; b/Documentation/gpu/amdgpu.rst<br>
@@ -70,6 &#43;70,15 @@ Interrupt Handling<br>
&nbsp;.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c<br>
&nbsp;&nbsp;&nbsp; :internal:<br>
<br>
&#43;AMDGPU XGMI Support<br>
&#43;=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&#43;<br>
&#43;.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c<br>
&#43;&nbsp;&nbsp; :doc: AMDGPU XGMI Support<br>
&#43;<br>
&#43;.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c<br>
&#43;&nbsp;&nbsp; :internal:<br>
&#43;<br>
&nbsp;GPU Power/Thermal Controls and Monitoring<br>
&nbsp;=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c b/drivers/gpu/drm/amd=
/amdgpu/amdgpu_xgmi.c<br>
index e48e9394f1e4..d11eba09eadd 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c<br>
@@ -40,6 &#43;40,34 @@ void *amdgpu_xgmi_hive_try_lock(struct amdgpu_hive_i=
nfo *hive)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return &amp;hive-&gt;device_list=
;<br>
&nbsp;}<br>
<br>
&#43;/**<br>
&#43; * DOC: AMDGPU XGMI Support<br>
&#43; *<br>
&#43; * XGMI is a high speed interconnect that joins multiple GPU cards<br>
&#43; * into a homogeneous memory space that is organized by a collective<b=
r>
&#43; * hive ID and individual node IDs, both of which are 64-bit numbers.<=
br>
&#43; *<br>
&#43; * The file xgmi_device_id contains the unique per GPU device ID and<b=
r>
&#43; * is stored in the /sys/class/drm/card${cardno}/device/ directory.<br=
>
&#43; *<br>
&#43; * Inside the device directory a sub-directory 'xgmi_hive_info' is<br>
&#43; * created which contains the hive ID and the list of nodes.<br>
&#43; *<br>
&#43; * The hive ID is stored in:<br>
&#43; *&nbsp;&nbsp; /sys/class/drm/card${cardno}/device/xgmi_hive_info/xgmi=
_hive_id<br>
&#43; *<br>
&#43; * The node information is stored in numbered directories:<br>
&#43; *&nbsp;&nbsp; /sys/class/drm/card${cardno}/device/xgmi_hive_info/node=
${nodeno}/xgmi_device_id<br>
&#43; *<br>
&#43; * Each device has their own xgmi_hive_info direction with a mirror<br=
>
&#43; * set of node sub-directories.<br>
&#43; *<br>
&#43; * The XGMI memory space is built by contiguously adding the power of<=
br>
&#43; * two padded VRAM space from each node to each other.<br>
&#43; *<br>
&#43; */<br>
&#43;<br>
&#43;<br>
&nbsp;static ssize_t amdgpu_xgmi_show_hive_id(struct device *dev,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; struct device_attribute *attr, char *buf)<br>
&nbsp;{<br>
--<br>
2.21.0<br>
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

--_000_MWHPR12MB14220CD84D24757ABCB2D82DFE020MWHPR12MB1422namp_--

--===============0812945200==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0812945200==--
