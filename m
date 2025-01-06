Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 048B9A02103
	for <lists+amd-gfx@lfdr.de>; Mon,  6 Jan 2025 09:41:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F6BC10E5BE;
	Mon,  6 Jan 2025 08:41:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="O+0PqQuM";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from out30-110.freemail.mail.aliyun.com
 (out30-110.freemail.mail.aliyun.com [115.124.30.110])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0791110E55E
 for <amd-gfx@lists.freedesktop.org>; Mon,  6 Jan 2025 03:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux.alibaba.com; s=default;
 t=1736132837; h=From:Message-Id:Content-Type:Mime-Version:Subject:Date:To;
 bh=70zHEg5DXSAf/l+IM+6xVEYT3ERs+6xDDDodUjbxKTs=;
 b=O+0PqQuMjgqvYH1M9EpSZj48808cryrQYlww01JOBZ9l22qfsYic1Z8EPBbHOtzeIgjKysfrRAI8mk8ce3I61ptRJSzF/CzB1gj1l095S1y2kjQGtvme/+Vth6fMU5Jy+vuQ4fX0QSNc2zMi0NpNvsaS3+asJSNN7acG0L9PyQg=
Received: from smtpclient.apple(mailfrom:gerry@linux.alibaba.com
 fp:SMTPD_---0WMzzutC_1736132835 cluster:ay36) by smtp.aliyun-inc.com;
 Mon, 06 Jan 2025 11:07:15 +0800
From: Gerry Liu <gerry@linux.alibaba.com>
Message-Id: <C1435298-B6B0-488E-8A62-C1C84B6E4BA8@linux.alibaba.com>
Content-Type: multipart/alternative;
 boundary="Apple-Mail=_2D0012EB-1E15-484B-984E-B575962714C3"
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [PATCH v2 1/6] amdgpu: fix possible resource leakage in
 kfd_cleanup_nodes()
Date: Mon, 6 Jan 2025 11:07:14 +0800
In-Reply-To: <Z3oXDBgDvgbVpdpX@shuo-ali-mbp.local>
Cc: amd-gfx@lists.freedesktop.org, xiaogang.chen@amd.com, lijo.lazar@amd.com,
 Kent.Russell@amd.com
To: Shuo Liu <shuox.liu@linux.alibaba.com>
References: <cover.1736044362.git.gerry@linux.alibaba.com>
 <70f5963233c8a34354ec8a9efebc3a7b4c7940d4.1736044362.git.gerry@linux.alibaba.com>
 <Z3oXDBgDvgbVpdpX@shuo-ali-mbp.local>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-Mailman-Approved-At: Mon, 06 Jan 2025 08:41:41 +0000
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
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>


--Apple-Mail=_2D0012EB-1E15-484B-984E-B575962714C3
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



> 2025=E5=B9=B41=E6=9C=885=E6=97=A5 13:22=EF=BC=8CShuo Liu =
<shuox.liu@linux.alibaba.com> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> Hi Gerry,
>=20
> On Sun  5.Jan'25 at 10:45:29 +0800, Jiang Liu wrote:
>> Fix possible resource leakage on error recovery path in function
>> kgd2kfd_device_init().
>>=20
>> Signed-off-by: Jiang Liu <gerry@linux.alibaba.com>
>> ---
>> drivers/gpu/drm/amd/amdkfd/kfd_device.c | 9 +++++----
>> 1 file changed, 5 insertions(+), 4 deletions(-)
>>=20
>> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device.c =
b/drivers/gpu/drm/amd/amdkfd/kfd_device.c
>> index a29374c86405..fa5054940486 100644
>> --- a/drivers/gpu/drm/amd/amdkfd/kfd_device.c
>> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_device.c
>> @@ -898,15 +898,15 @@ bool kgd2kfd_device_init(struct kfd_dev *kfd,
>> 		if (kfd->adev->xcp_mgr)
>> 			kfd_setup_interrupt_bitmap(node, i);
>>=20
>> +		spin_lock_init(&node->watch_points_lock);
>> +
>> +		kfd->nodes[i] =3D node;
>> +
>> 		/* Initialize the KFD node */
>> 		if (kfd_init_node(node)) {
>> 			dev_err(kfd_device, "Error initializing KFD =
node\n");
>> 			goto node_init_error;
>> 		}
>> -
>> -		spin_lock_init(&node->watch_points_lock);
>> -
>> -		kfd->nodes[i] =3D node;
>> 	}
>>=20
>> 	svm_range_set_max_pages(kfd->adev);
>> @@ -921,6 +921,7 @@ bool kgd2kfd_device_init(struct kfd_dev *kfd,
>> 	goto out;
>>=20
>> node_init_error:
>> +	i++;
> The err cleanup path can release node itself. So the following
> kfd_cleanup_nodes() may do a double free?=20
Hi Shuo,
	I missed the `kfree()` in function kfd_init_node(), so this =
patch is wrong and should be dropped.

Thanks,
Gerry
>> node_alloc_error:
>> 	kfd_cleanup_nodes(kfd, i);
>> 	kfd_doorbell_fini(kfd);
> shuo


--Apple-Mail=_2D0012EB-1E15-484B-984E-B575962714C3
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><br =
class=3D""><div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D"">2025=E5=B9=B41=E6=9C=885=E6=97=A5 13:22=EF=BC=8CShuo Liu =
&lt;<a href=3D"mailto:shuox.liu@linux.alibaba.com" =
class=3D"">shuox.liu@linux.alibaba.com</a>&gt; =E5=86=99=E9=81=93=EF=BC=9A=
</div><br class=3D"Apple-interchange-newline"><div class=3D""><meta =
charset=3D"UTF-8" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 18px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">Hi Gerry,</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 18px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><br style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 18px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 18px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">On Sun &nbsp;5.Jan'25 at 10:45:29 +0800, Jiang Liu =
wrote:</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 18px; font-style: normal; font-variant-caps: =
normal; font-weight: 400; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><blockquote type=3D"cite" style=3D"font-family: =
Helvetica; font-size: 18px; font-style: normal; font-variant-caps: =
normal; font-weight: 400; letter-spacing: normal; orphans: auto; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D"">Fix =
possible resource leakage on error recovery path in function<br =
class=3D"">kgd2kfd_device_init().<br class=3D""><br =
class=3D"">Signed-off-by: Jiang Liu &lt;<a =
href=3D"mailto:gerry@linux.alibaba.com" =
class=3D"">gerry@linux.alibaba.com</a>&gt;<br class=3D"">---<br =
class=3D"">drivers/gpu/drm/amd/amdkfd/kfd_device.c | 9 +++++----<br =
class=3D"">1 file changed, 5 insertions(+), 4 deletions(-)<br =
class=3D""><br class=3D"">diff --git =
a/drivers/gpu/drm/amd/amdkfd/kfd_device.c =
b/drivers/gpu/drm/amd/amdkfd/kfd_device.c<br class=3D"">index =
a29374c86405..fa5054940486 100644<br class=3D"">--- =
a/drivers/gpu/drm/amd/amdkfd/kfd_device.c<br class=3D"">+++ =
b/drivers/gpu/drm/amd/amdkfd/kfd_device.c<br class=3D"">@@ -898,15 =
+898,15 @@ bool kgd2kfd_device_init(struct kfd_dev *kfd,<br =
class=3D""><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>if (kfd-&gt;adev-&gt;xcp_mgr)<br class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>kfd_setup_interrupt_bitmap(node, i);<br class=3D""><br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>spin_lock_init(&amp;node-&gt;watch_points_lock);<br class=3D"">+<br=
 class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>kfd-&gt;nodes[i] =3D node;<br class=3D"">+<br class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>/* =
Initialize the KFD node */<br class=3D""><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>if (kfd_init_node(node)) {<br =
class=3D""><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>dev_err(kfd_device, "Error initializing KFD node\n");<br =
class=3D""><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>goto node_init_error;<br class=3D""><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>}<br class=3D"">-<br =
class=3D"">-<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>spin_lock_init(&amp;node-&gt;watch_points_lock);<br class=3D"">-<br=
 class=3D"">-<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>kfd-&gt;nodes[i] =3D node;<br class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>}<br =
class=3D""><br class=3D""><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	=
</span>svm_range_set_max_pages(kfd-&gt;adev);<br class=3D"">@@ -921,6 =
+921,7 @@ bool kgd2kfd_device_init(struct kfd_dev *kfd,<br =
class=3D""><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>goto out;<br class=3D""><br class=3D"">node_init_error:<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>i++;<br class=3D""></blockquote><span style=3D"caret-color: =
rgb(0, 0, 0); font-family: Helvetica; font-size: 18px; font-style: =
normal; font-variant-caps: normal; font-weight: 400; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">The err cleanup path can release node itself. So the =
following</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 18px; font-style: normal; font-variant-caps: =
normal; font-weight: 400; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 18px; font-style: normal; font-variant-caps: =
normal; font-weight: 400; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" =
class=3D"">kfd_cleanup_nodes() may do a double free?<span =
class=3D"Apple-converted-space">&nbsp;</span></span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
18px; font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" =
class=3D""></div></blockquote><div>Hi Shuo,</div><div><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>I missed =
the `kfree()` in function kfd_init_node(), so this patch is wrong and =
should be dropped.</div><div><br =
class=3D""></div>Thanks,</div><div>Gerry<br class=3D""><blockquote =
type=3D"cite" class=3D""><div class=3D""><blockquote type=3D"cite" =
style=3D"font-family: Helvetica; font-size: 18px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D"">node_alloc_error:<br class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>kfd_cleanup_nodes(kfd, i);<br class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>kfd_doorbell_fini(kfd);<br class=3D""></blockquote><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
18px; font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;" =
class=3D"">shuo</span></div></blockquote></div><br =
class=3D""></body></html>=

--Apple-Mail=_2D0012EB-1E15-484B-984E-B575962714C3--
