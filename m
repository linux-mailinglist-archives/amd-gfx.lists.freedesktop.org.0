Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 642D02FF91
	for <lists+amd-gfx@lfdr.de>; Thu, 30 May 2019 17:45:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A47A06E160;
	Thu, 30 May 2019 15:45:37 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790075.outbound.protection.outlook.com [40.107.79.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95AF66E15F
 for <amd-gfx@lists.freedesktop.org>; Thu, 30 May 2019 15:45:35 +0000 (UTC)
Received: from MWHPR12MB1422.namprd12.prod.outlook.com (10.169.205.8) by
 MWHPR12MB1853.namprd12.prod.outlook.com (10.175.49.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.23; Thu, 30 May 2019 15:45:34 +0000
Received: from MWHPR12MB1422.namprd12.prod.outlook.com
 ([fe80::1810:5dae:1b14:78fd]) by MWHPR12MB1422.namprd12.prod.outlook.com
 ([fe80::1810:5dae:1b14:78fd%2]) with mapi id 15.20.1922.024; Thu, 30 May 2019
 15:45:34 +0000
From: "Abramov, Slava" <Slava.Abramov@amd.com>
To: "StDenis, Tom" <Tom.StDenis@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amd/doc: add rough outline of tracepoint documentation
Thread-Topic: [PATCH] drm/amd/doc: add rough outline of tracepoint
 documentation
Thread-Index: AQHVFvfSk/7dElBPCEmqyib7EQtDxKaDyyDq
Date: Thu, 30 May 2019 15:45:33 +0000
Message-ID: <MWHPR12MB1422F8CD20776EFC9B4C8288FE180@MWHPR12MB1422.namprd12.prod.outlook.com>
References: <20190530145600.12241-1-tom.stdenis@amd.com>
In-Reply-To: <20190530145600.12241-1-tom.stdenis@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6bb4d976-e39f-4b02-6c4f-08d6e515da7e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MWHPR12MB1853; 
x-ms-traffictypediagnostic: MWHPR12MB1853:
x-microsoft-antispam-prvs: <MWHPR12MB185393E962A81E47F1B6F15AFE180@MWHPR12MB1853.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:249;
x-forefront-prvs: 00531FAC2C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(376002)(396003)(136003)(346002)(366004)(189003)(199004)(2906002)(76176011)(71190400001)(6436002)(86362001)(71200400001)(110136005)(66556008)(66446008)(26005)(9686003)(81166006)(316002)(81156014)(8676002)(6116002)(102836004)(66476007)(486006)(6246003)(8936002)(64756008)(476003)(53936002)(3846002)(6606003)(11346002)(33656002)(5660300002)(14454004)(2501003)(186003)(478600001)(229853002)(72206003)(7736002)(52536014)(7696005)(19627405001)(66946007)(256004)(73956011)(66066001)(68736007)(54896002)(55016002)(99286004)(25786009)(91956017)(76116006)(446003)(6506007)(74316002)(53546011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1853;
 H:MWHPR12MB1422.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 2RPVYCbYcK6m73DygbDI+69U/mjnr+F+XDsQxNwjukz/5PY3tH+5DIn+RJ8AsG/IwP5L4FGtfWOL0Qhp+e12B49MMyRf98/pfzdar8No3rQWuj6XWmCV2KvgkPWqTnwHIzLj3ENblH1hIEJl5fSbEXqdhnczQsVBOpZfO+wbYGOpu0Lktr4g91zkm1gHwC9fcwk0mNAKGF0MztqliJDiP31Hn1YXimWqAqV7piRmlSGTB13RZmIG4UHx9dtHfqAmezmIRoRLrgj6hMTzLd37cSOqHEB3rTbIQ1hMsVKXcXp1poVAOkFVCyVpEQFS5qSKH46V95HbD7inlhBUhdLMGk/YrH+QuMnDsCqmfX38LY5oL8Da0p/WqNFUFSax9O+KAgKWjzZ2yvX2QnkIZZPRPMorudgMiHYy6qQkyivb3gg=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bb4d976-e39f-4b02-6c4f-08d6e515da7e
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 May 2019 15:45:33.9764 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sabramov@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1853
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZGkX6/MJYiiYXCQMc8U+q/yt14b/4OeBq7vFqjM6fwo=;
 b=ybsQ8Saa+vXgUxS1gM8AXIdke68j3aY1axeiEt3mPHWqHqIhrcUEXzLg6k12xYTAOe9HpcESyafzun+iQCtcE3t627Vt/nboW4Dzuc/xD18hkXNZK87Bp1aOpkdc3/s1BaF7T5plMz5lqqsXBd8XlqYfjzGZwRi/FXtNAFskBdw=
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
Content-Type: multipart/mixed; boundary="===============0523682061=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0523682061==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MWHPR12MB1422F8CD20776EFC9B4C8288FE180MWHPR12MB1422namp_"

--_000_MWHPR12MB1422F8CD20776EFC9B4C8288FE180MWHPR12MB1422namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Comments inline (marked with [slava a]).


General comment - word capitalisation in the lists is inconsistent


________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of StDenis,=
 Tom <Tom.StDenis@amd.com>
Sent: Thursday, May 30, 2019 10:56 AM
To: amd-gfx@lists.freedesktop.org
Cc: StDenis, Tom
Subject: [PATCH] drm/amd/doc: add rough outline of tracepoint documentation

Signed-off-by: Tom St Denis <tom.stdenis@amd.com>
---
 Documentation/gpu/amdgpu.rst              |  10 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h | 221 ++++++++++++++++++++++
 2 files changed, 231 insertions(+)

diff --git a/Documentation/gpu/amdgpu.rst b/Documentation/gpu/amdgpu.rst
index 86138798128f..3564765110e5 100644
--- a/Documentation/gpu/amdgpu.rst
+++ b/Documentation/gpu/amdgpu.rst
@@ -89,6 +89,16 @@ AMDGPU RAS debugfs control interface
 .. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
    :internal:

+AMDGPU Tracing Support
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
+   :doc: AMDGPU Tracing Support
+
+
+.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
+   :internal:
+

 GPU Power/Thermal Controls and Monitoring
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_trace.h
index d3ca2424b5fe..71febb90d3e3 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
@@ -37,6 +37,227 @@
 #define AMDGPU_JOB_GET_TIMELINE_NAME(job) \
          job->base.s_fence->finished.ops->get_timeline_name(&job->base.s_f=
ence->finished)

+/**
+ * DOC: AMDGPU Tracing Support
+ *
+ * The AMDGPU driver provides numerous trace points that can aid
+ * in debugging.  They are globally enabled by the file:
+ *
+ * /sys/kernel/debug/tracing/events/amdgpu/enable
+ *
+ * or individually by the enable files in the sub-directories
+ * of that directory.
+ *
+ * amdgpu_mm_rreg, amdgpu_mm_wreg
+ * ------------------------------
+ *
+ * These trace points track reads and writes to MMIO registers by
+ * the kernel driver (activity inside ring/indirect buffers are not
+ * traced) which can be used to diagnose IP block activity and
+ * responses.

[slava a] Either 'activities are not traced' or 'activity is not traced'
[slava a] Double usage of word 'activity' sounds weird.

[snap]

--_000_MWHPR12MB1422F8CD20776EFC9B4C8288FE180MWHPR12MB1422namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"><!-- P {margin-top:0;margi=
n-bottom:0;} --></style>
</head>
<body dir=3D"ltr">
<div id=3D"divtagdefaultwrapper" style=3D"font-size: 12pt; color: rgb(0, 0,=
 0); font-family: Calibri, Helvetica, sans-serif, EmojiFont, &quot;Apple Co=
lor Emoji&quot;, &quot;Segoe UI Emoji&quot;, NotoColorEmoji, &quot;Segoe UI=
 Symbol&quot;, &quot;Android Emoji&quot;, EmojiSymbols;" dir=3D"ltr">
<p style=3D"margin-top:0;margin-bottom:0">Comments inline (marked with [sla=
va a]).</p>
<p style=3D"margin-top:0;margin-bottom:0"><br>
</p>
<p style=3D"margin-top:0;margin-bottom:0">General comment - word capitalisa=
tion in the lists is inconsistent</p>
<br>
<br>
<div style=3D"color: rgb(0, 0, 0);">
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> amd-gfx &lt;amd-gfx-b=
ounces@lists.freedesktop.org&gt; on behalf of StDenis, Tom &lt;Tom.StDenis@=
amd.com&gt;<br>
<b>Sent:</b> Thursday, May 30, 2019 10:56 AM<br>
<b>To:</b> amd-gfx@lists.freedesktop.org<br>
<b>Cc:</b> StDenis, Tom<br>
<b>Subject:</b> [PATCH] drm/amd/doc: add rough outline of tracepoint docume=
ntation</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Signed-off-by: Tom St Denis &lt;tom.stdenis@amd.co=
m&gt;<br>
---<br>
&nbsp;Documentation/gpu/amdgpu.rst&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 10 &#43;<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h | 221 &#43;&#43;&#43;&#43;&=
#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&=
#43;&#43;&#43;<br>
&nbsp;2 files changed, 231 insertions(&#43;)<br>
<br>
diff --git a/Documentation/gpu/amdgpu.rst b/Documentation/gpu/amdgpu.rst<br=
>
index 86138798128f..3564765110e5 100644<br>
--- a/Documentation/gpu/amdgpu.rst<br>
&#43;&#43;&#43; b/Documentation/gpu/amdgpu.rst<br>
@@ -89,6 &#43;89,16 @@ AMDGPU RAS debugfs control interface<br>
&nbsp;.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c<br>
&nbsp;&nbsp;&nbsp; :internal:<br>
&nbsp;<br>
&#43;AMDGPU Tracing Support<br>
&#43;=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&#43;<br>
&#43;.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h<br>
&#43;&nbsp;&nbsp; :doc: AMDGPU Tracing Support<br>
&#43;<br>
&#43;<br>
&#43;.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h<br>
&#43;&nbsp;&nbsp; :internal:<br>
&#43;<br>
&nbsp;<br>
&nbsp;GPU Power/Thermal Controls and Monitoring<br>
&nbsp;=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_trace.h<br>
index d3ca2424b5fe..71febb90d3e3 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h<br>
@@ -37,6 &#43;37,227 @@<br>
&nbsp;#define AMDGPU_JOB_GET_TIMELINE_NAME(job) \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; job-&gt;base.s_fence=
-&gt;finished.ops-&gt;get_timeline_name(&amp;job-&gt;base.s_fence-&gt;finis=
hed)<br>
&nbsp;<br>
&#43;/**<br>
&#43; * DOC: AMDGPU Tracing Support<br>
&#43; *<br>
&#43; * The AMDGPU driver provides numerous trace points that can aid<br>
&#43; * in debugging.&nbsp; They are globally enabled by the file:<br>
&#43; *<br>
&#43; * /sys/kernel/debug/tracing/events/amdgpu/enable<br>
&#43; *<br>
&#43; * or individually by the enable files in the sub-directories<br>
&#43; * of that directory.<br>
&#43; *<br>
&#43; * amdgpu_mm_rreg, amdgpu_mm_wreg<br>
&#43; * ------------------------------<br>
&#43; *<br>
&#43; * These trace points track reads and writes to MMIO registers by</div=
>
<div class=3D"PlainText"><span style=3D"font-size: 11pt;">&#43; * the kerne=
l driver (activity inside ring/indirect buffers are not</span><br>
</div>
<div class=3D"PlainText"><span style=3D"font-size: 11pt;">&#43; * traced) w=
hich can be used to diagnose IP block activity and</span><br>
</div>
<div class=3D"PlainText">&#43; * responses.</div>
<div class=3D"PlainText">
<div class=3D"PlainText" style=3D"font-family: Calibri, Helvetica, sans-ser=
if, EmojiFont, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, N=
otoColorEmoji, &quot;Segoe UI Symbol&quot;, &quot;Android Emoji&quot;, Emoj=
iSymbols; font-size: 14.6667px;">
<br class=3D"Apple-interchange-newline">
[slava a] Either 'activities are not traced' or 'activity is not traced'</d=
iv>
<div class=3D"PlainText" style=3D"font-family: Calibri, Helvetica, sans-ser=
if, EmojiFont, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, N=
otoColorEmoji, &quot;Segoe UI Symbol&quot;, &quot;Android Emoji&quot;, Emoj=
iSymbols; font-size: 14.6667px;">
<span style=3D"font-size: 11pt;">[slava a] Double usage of word 'activity' =
sounds weird.&nbsp;&nbsp;</span></div>
</div>
<div class=3D"PlainText"><br>
</div>
<div class=3D"PlainText">[snap]</div>
</span></font></div>
</div>
</div>
</body>
</html>

--_000_MWHPR12MB1422F8CD20776EFC9B4C8288FE180MWHPR12MB1422namp_--

--===============0523682061==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0523682061==--
