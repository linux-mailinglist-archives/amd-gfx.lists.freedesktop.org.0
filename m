Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F27834FA7
	for <lists+amd-gfx@lfdr.de>; Tue,  4 Jun 2019 20:14:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DB0989B8F;
	Tue,  4 Jun 2019 18:14:23 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740080.outbound.protection.outlook.com [40.107.74.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D94C89B8F
 for <amd-gfx@lists.freedesktop.org>; Tue,  4 Jun 2019 18:14:21 +0000 (UTC)
Received: from BN8PR12MB3217.namprd12.prod.outlook.com (20.179.65.149) by
 BN8PR12MB3331.namprd12.prod.outlook.com (20.178.210.208) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1943.22; Tue, 4 Jun 2019 18:14:19 +0000
Received: from BN8PR12MB3217.namprd12.prod.outlook.com
 ([fe80::e504:4ec4:c1c3:a9f8]) by BN8PR12MB3217.namprd12.prod.outlook.com
 ([fe80::e504:4ec4:c1c3:a9f8%5]) with mapi id 15.20.1943.018; Tue, 4 Jun 2019
 18:14:19 +0000
From: "Francis, David" <David.Francis@amd.com>
To: "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v2] drm/amd/display: Add connector debugfs for "output_bpc"
Thread-Topic: [PATCH v2] drm/amd/display: Add connector debugfs for
 "output_bpc"
Thread-Index: AQHVGjQMfUKkKWFz9kmsXIVh6SKUBaaLzgrj
Date: Tue, 4 Jun 2019 18:14:19 +0000
Message-ID: <BN8PR12MB3217F1A7473AFE5372C30DEBEF150@BN8PR12MB3217.namprd12.prod.outlook.com>
References: <20190603174437.23996-1-nicholas.kazlauskas@amd.com>
In-Reply-To: <20190603174437.23996-1-nicholas.kazlauskas@amd.com>
Accept-Language: en-CA, en-US
Content-Language: en-CA
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1fbd12ce-9e19-4912-e3c3-08d6e91876aa
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN8PR12MB3331; 
x-ms-traffictypediagnostic: BN8PR12MB3331:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BN8PR12MB3331BEFD35FBD42D1F8A488CEF150@BN8PR12MB3331.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-forefront-prvs: 0058ABBBC7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(136003)(366004)(39860400002)(396003)(376002)(199004)(189003)(81166006)(11346002)(68736007)(4326008)(446003)(81156014)(74316002)(476003)(91956017)(186003)(6116002)(486006)(8936002)(236005)(6246003)(102836004)(7696005)(110136005)(54906003)(6436002)(71200400001)(71190400001)(2906002)(9686003)(54896002)(55016002)(52536014)(6306002)(76176011)(73956011)(14444005)(256004)(229853002)(8676002)(966005)(53546011)(6506007)(7736002)(86362001)(19627405001)(25786009)(606006)(3846002)(14454004)(53936002)(33656002)(316002)(76116006)(66066001)(64756008)(66446008)(72206003)(2501003)(66946007)(26005)(66476007)(66556008)(99286004)(5660300002)(478600001)(6606003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB3331;
 H:BN8PR12MB3217.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Usc1kenPFYlHBxzI5dkXe1vs9kIatM9kie0dbWl/fcl5bUE/qLzB2ewbMbB3Kpb8w434mJr85quPbiDzsDJ1ha1cq8xObYncawEXyHtvTiwzL1M1EVGq/O3LuglJzqrBZTUgz3XLuEYJeh24j83W9HbAy8IxQs/0gzTRqcr5F0KldaG9skvLsuNIsjEpQQ4Ko540aJLRbovMId1t4SuxFWvJQNoxtaEGbZNx7lZmq7ZmHe6FK/y/wOlf/YIl7X2P1FrGXcwxu87WXYnLiPsAFaG701MTSYWzZGj8kvE4sFLdDcPHq2HcJYOTW7iqjzCC/A0rEOP9kgiaPhcneJdzruIXWr2X3ClE08ek036rAbtzRRc4UMxNI5QGr01dLT71p5MjOGSZsOQzEzLN/Y3x0HD2F5nMWV10S8kS9HCUths=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fbd12ce-9e19-4912-e3c3-08d6e91876aa
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2019 18:14:19.7562 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fdavid@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3331
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ha27NoaUZxfjPxw0mhw58UTFXlEipo+69fu/VJnvilg=;
 b=EHpQGanytNO5KvvKKQsL404GNBEto4nnxI/4aT68/vwiVRDBEba2nxovhdJ4qpFB5y2GJpFs5jvRKlXLpIFudlIEjKZld7BCoYuHNJS+G55aPQTLDARZ9Fb00V+s8nlxr8fRRBPwITel0jtthDqwMNbnyciOefbxo3lzGQD7xBA=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=David.Francis@amd.com; 
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
Cc: "Li, Sun peng \(Leo\)" <Sunpeng.Li@amd.com>, "Wentland,
 Harry" <Harry.Wentland@amd.com>
Content-Type: multipart/mixed; boundary="===============1709622187=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1709622187==
Content-Language: en-CA
Content-Type: multipart/alternative;
	boundary="_000_BN8PR12MB3217F1A7473AFE5372C30DEBEF150BN8PR12MB3217namp_"

--_000_BN8PR12MB3217F1A7473AFE5372C30DEBEF150BN8PR12MB3217namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Looks straightforward


Reviewed-by: David Francis <David.Francis@amd.com>

________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Nicholas=
 Kazlauskas <nicholas.kazlauskas@amd.com>
Sent: June 3, 2019 1:44:37 PM
To: amd-gfx@lists.freedesktop.org
Cc: Li, Sun peng (Leo); Wentland, Harry; Kazlauskas, Nicholas
Subject: [PATCH v2] drm/amd/display: Add connector debugfs for "output_bpc"

[Why]
This will be useful for verifying whether we enter the correct output
color depth from IGT.

[How]
Locks the connector and associated CRTC if available and outputs
the current and maximum output bpc values.

Example:

cat /sys/kernel/debug/dri/0/DP-1/output_bpc
Current: 8
Maximum: 10

v2: Drop unneeded connector status check

Cc: Leo Li <sunpeng.li@amd.com>
Cc: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
---
 .../amd/display/amdgpu_dm/amdgpu_dm_debugfs.c | 71 ++++++++++++++++++-
 1 file changed, 69 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c b/dr=
ivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
index 1d5fc5ad3bee..a3e362fa6747 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
@@ -672,6 +672,71 @@ static ssize_t dp_phy_test_pattern_debugfs_write(struc=
t file *f, const char __us
         return bytes_from_user;
 }

+/*
+ * Returns the current and maximum output bpc for the connector.
+ * Example usage: cat /sys/kernel/debug/dri/0/DP-1/output_bpc
+ */
+static int output_bpc_show(struct seq_file *m, void *data)
+{
+       struct drm_connector *connector =3D m->private;
+       struct drm_device *dev =3D connector->dev;
+       struct drm_crtc *crtc =3D NULL;
+       struct dm_crtc_state *dm_crtc_state =3D NULL;
+       int res =3D -ENODEV;
+       unsigned int bpc;
+
+       mutex_lock(&dev->mode_config.mutex);
+       drm_modeset_lock(&dev->mode_config.connection_mutex, NULL);
+
+       if (connector->state =3D=3D NULL)
+               goto unlock;
+
+       crtc =3D connector->state->crtc;
+       if (crtc =3D=3D NULL)
+               goto unlock;
+
+       drm_modeset_lock(&crtc->mutex, NULL);
+       if (crtc->state =3D=3D NULL)
+               goto unlock;
+
+       dm_crtc_state =3D to_dm_crtc_state(crtc->state);
+       if (dm_crtc_state->stream =3D=3D NULL)
+               goto unlock;
+
+       switch (dm_crtc_state->stream->timing.display_color_depth) {
+       case COLOR_DEPTH_666:
+               bpc =3D 6;
+               break;
+       case COLOR_DEPTH_888:
+               bpc =3D 8;
+               break;
+       case COLOR_DEPTH_101010:
+               bpc =3D 10;
+               break;
+       case COLOR_DEPTH_121212:
+               bpc =3D 12;
+               break;
+       case COLOR_DEPTH_161616:
+               bpc =3D 16;
+               break;
+       default:
+               goto unlock;
+       }
+
+       seq_printf(m, "Current: %u\n", bpc);
+       seq_printf(m, "Maximum: %u\n", connector->display_info.bpc);
+       res =3D 0;
+
+unlock:
+       if (crtc)
+               drm_modeset_unlock(&crtc->mutex);
+
+       drm_modeset_unlock(&dev->mode_config.connection_mutex);
+       mutex_unlock(&dev->mode_config.mutex);
+
+       return res;
+}
+
 /*
  * Returns the min and max vrr vfreq through the connector's debugfs file.
  * Example usage: cat /sys/kernel/debug/dri/0/DP-1/vrr_range
@@ -730,8 +795,6 @@ static ssize_t dp_sdp_message_debugfs_write(struct file=
 *f, const char __user *b
         return write_size;
 }

-DEFINE_SHOW_ATTRIBUTE(vrr_range);
-
 static ssize_t dp_dpcd_address_write(struct file *f, const char __user *bu=
f,
                                  size_t size, loff_t *pos)
 {
@@ -814,6 +877,9 @@ static ssize_t dp_dpcd_data_read(struct file *f, char _=
_user *buf,
         return read_size - r;
 }

+DEFINE_SHOW_ATTRIBUTE(output_bpc);
+DEFINE_SHOW_ATTRIBUTE(vrr_range);
+
 static const struct file_operations dp_link_settings_debugfs_fops =3D {
         .owner =3D THIS_MODULE,
         .read =3D dp_link_settings_read,
@@ -866,6 +932,7 @@ static const struct {
                 {"link_settings", &dp_link_settings_debugfs_fops},
                 {"phy_settings", &dp_phy_settings_debugfs_fop},
                 {"test_pattern", &dp_phy_test_pattern_fops},
+               {"output_bpc", &output_bpc_fops},
                 {"vrr_range", &vrr_range_fops},
                 {"sdp_message", &sdp_message_fops},
                 {"aux_dpcd_address", &dp_dpcd_address_debugfs_fops},
--
2.17.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_BN8PR12MB3217F1A7473AFE5372C30DEBEF150BN8PR12MB3217namp_
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
<p style=3D"margin-top:0;margin-bottom:0">Looks straightforward</p>
<p style=3D"margin-top:0;margin-bottom:0"><br>
</p>
<p style=3D"margin-top:0;margin-bottom:0">Reviewed-by: David Francis &lt;Da=
vid.Francis@amd.com&gt;</p>
</div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> amd-gfx &lt;amd-gfx-b=
ounces@lists.freedesktop.org&gt; on behalf of Nicholas Kazlauskas &lt;nicho=
las.kazlauskas@amd.com&gt;<br>
<b>Sent:</b> June 3, 2019 1:44:37 PM<br>
<b>To:</b> amd-gfx@lists.freedesktop.org<br>
<b>Cc:</b> Li, Sun peng (Leo); Wentland, Harry; Kazlauskas, Nicholas<br>
<b>Subject:</b> [PATCH v2] drm/amd/display: Add connector debugfs for &quot=
;output_bpc&quot;</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">[Why]<br>
This will be useful for verifying whether we enter the correct output<br>
color depth from IGT.<br>
<br>
[How]<br>
Locks the connector and associated CRTC if available and outputs<br>
the current and maximum output bpc values.<br>
<br>
Example:<br>
<br>
cat /sys/kernel/debug/dri/0/DP-1/output_bpc<br>
Current: 8<br>
Maximum: 10<br>
<br>
v2: Drop unneeded connector status check<br>
<br>
Cc: Leo Li &lt;sunpeng.li@amd.com&gt;<br>
Cc: Harry Wentland &lt;harry.wentland@amd.com&gt;<br>
Signed-off-by: Nicholas Kazlauskas &lt;nicholas.kazlauskas@amd.com&gt;<br>
---<br>
&nbsp;.../amd/display/amdgpu_dm/amdgpu_dm_debugfs.c | 71 &#43;&#43;&#43;&#4=
3;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;-<b=
r>
&nbsp;1 file changed, 69 insertions(&#43;), 2 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c b/dr=
ivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c<br>
index 1d5fc5ad3bee..a3e362fa6747 100644<br>
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c=
<br>
@@ -672,6 &#43;672,71 @@ static ssize_t dp_phy_test_pattern_debugfs_write(s=
truct file *f, const char __us<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return bytes_from_user;<br=
>
&nbsp;}<br>
&nbsp;<br>
&#43;/*<br>
&#43; * Returns the current and maximum output bpc for the connector.<br>
&#43; * Example usage: cat /sys/kernel/debug/dri/0/DP-1/output_bpc<br>
&#43; */<br>
&#43;static int output_bpc_show(struct seq_file *m, void *data)<br>
&#43;{<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_connector *connector =
=3D m-&gt;private;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_device *dev =3D connec=
tor-&gt;dev;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_crtc *crtc =3D NULL;<b=
r>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct dm_crtc_state *dm_crtc_sta=
te =3D NULL;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int res =3D -ENODEV;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; unsigned int bpc;<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mutex_lock(&amp;dev-&gt;mode_conf=
ig.mutex);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_modeset_lock(&amp;dev-&gt;mod=
e_config.connection_mutex, NULL);<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (connector-&gt;state =3D=3D NU=
LL)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; goto unlock;<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; crtc =3D connector-&gt;state-&gt;=
crtc;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (crtc =3D=3D NULL)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; goto unlock;<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_modeset_lock(&amp;crtc-&gt;mu=
tex, NULL);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (crtc-&gt;state =3D=3D NULL)<b=
r>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; goto unlock;<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dm_crtc_state =3D to_dm_crtc_stat=
e(crtc-&gt;state);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (dm_crtc_state-&gt;stream =3D=
=3D NULL)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; goto unlock;<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; switch (dm_crtc_state-&gt;stream-=
&gt;timing.display_color_depth) {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case COLOR_DEPTH_666:<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; bpc =3D 6;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; break;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case COLOR_DEPTH_888:<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; bpc =3D 8;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; break;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case COLOR_DEPTH_101010:<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; bpc =3D 10;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; break;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case COLOR_DEPTH_121212:<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; bpc =3D 12;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; break;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case COLOR_DEPTH_161616:<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; bpc =3D 16;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; break;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; default:<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; goto unlock;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; seq_printf(m, &quot;Current: %u\n=
&quot;, bpc);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; seq_printf(m, &quot;Maximum: %u\n=
&quot;, connector-&gt;display_info.bpc);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; res =3D 0;<br>
&#43;<br>
&#43;unlock:<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (crtc)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; drm_modeset_unlock(&amp;crtc-&gt;mutex);<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_modeset_unlock(&amp;dev-&gt;m=
ode_config.connection_mutex);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mutex_unlock(&amp;dev-&gt;mode_co=
nfig.mutex);<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return res;<br>
&#43;}<br>
&#43;<br>
&nbsp;/*<br>
&nbsp; * Returns the min and max vrr vfreq through the connector's debugfs =
file.<br>
&nbsp; * Example usage: cat /sys/kernel/debug/dri/0/DP-1/vrr_range<br>
@@ -730,8 &#43;795,6 @@ static ssize_t dp_sdp_message_debugfs_write(struct =
file *f, const char __user *b<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return write_size;<br>
&nbsp;}<br>
&nbsp;<br>
-DEFINE_SHOW_ATTRIBUTE(vrr_range);<br>
-<br>
&nbsp;static ssize_t dp_dpcd_address_write(struct file *f, const char __use=
r *buf,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; size_t size, loff_t *pos)<=
br>
&nbsp;{<br>
@@ -814,6 &#43;877,9 @@ static ssize_t dp_dpcd_data_read(struct file *f, ch=
ar __user *buf,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return read_size - r;<br>
&nbsp;}<br>
&nbsp;<br>
&#43;DEFINE_SHOW_ATTRIBUTE(output_bpc);<br>
&#43;DEFINE_SHOW_ATTRIBUTE(vrr_range);<br>
&#43;<br>
&nbsp;static const struct file_operations dp_link_settings_debugfs_fops =3D=
 {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .owner =3D THIS_MODULE,<br=
>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .read =3D dp_link_settings=
_read,<br>
@@ -866,6 &#43;932,7 @@ static const struct {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; {&quot;link_settings&quot;, &amp;dp_link_settings_deb=
ugfs_fops},<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; {&quot;phy_settings&quot;, &amp;dp_phy_settings_debug=
fs_fop},<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; {&quot;test_pattern&quot;, &amp;dp_phy_test_pattern_f=
ops},<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; {&quot;output_bpc&quot;, &amp;output_bpc_fops},<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; {&quot;vrr_range&quot;, &amp;vrr_range_fops},<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; {&quot;sdp_message&quot;, &amp;sdp_message_fops},<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; {&quot;aux_dpcd_address&quot;, &amp;dp_dpcd_address_d=
ebugfs_fops},<br>
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

--_000_BN8PR12MB3217F1A7473AFE5372C30DEBEF150BN8PR12MB3217namp_--

--===============1709622187==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1709622187==--
