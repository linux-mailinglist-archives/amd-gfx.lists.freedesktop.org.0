Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A81B57DF
	for <lists+amd-gfx@lfdr.de>; Wed, 18 Sep 2019 00:06:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF7746ED85;
	Tue, 17 Sep 2019 22:06:09 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 412 seconds by postgrey-1.36 at gabe;
 Tue, 17 Sep 2019 22:06:08 UTC
Received: from us-smtp-delivery-72.mimecast.com
 (us-smtp-delivery-72.mimecast.com [216.205.24.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C46BD6ED85
 for <amd-gfx@lists.freedesktop.org>; Tue, 17 Sep 2019 22:06:08 +0000 (UTC)
Received: from smtp01.valvesoftware.com (smtp01.valvesoftware.com
 [208.64.203.181]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-223-JMXnAX81NVmclgFgESMx9A-1; Tue, 17 Sep 2019 17:59:12 -0400
Received: from [172.16.1.107] (helo=antispam.valve.org)
 by smtp01.valvesoftware.com with esmtp (Exim 4.86_2)
 (envelope-from <pgriffais@valvesoftware.com>) id 1iALV9-0006ZM-Cc
 for amd-gfx@lists.freedesktop.org; Tue, 17 Sep 2019 14:59:11 -0700
Received: from antispam.valve.org (127.0.0.1) id hg5biu0171so for
 <amd-gfx@lists.freedesktop.org>;
 Tue, 17 Sep 2019 14:59:11 -0700 (envelope-from <pgriffais@valvesoftware.com>)
Received: from mail1.valvemail.org ([172.16.144.22])
 by antispam.valve.org ([172.16.1.107]) (SonicWALL 9.0.5.2081 )
 with ESMTP id o201909172159110014850-5; Tue, 17 Sep 2019 14:59:11 -0700
Received: from [172.18.21.27] (172.18.21.27) by mail1.valvemail.org
 (172.16.144.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1415.2; Tue, 17 Sep
 2019 14:58:17 -0700
Subject: =?UTF-8?B?UmU6IFJl77yaW1BBVENIXSBkcm0vYW1kZ3B1OiByZXN2ZXJ0ICJkaXNh?=
 =?UTF-8?Q?ble_bulk_moves_for_now=22?=
To: "Zhou, David(ChunMing)" <David1.Zhou@amd.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
References: <20190912101535.71686-1-christian.koenig@amd.com>
 <f0b19f35-5852-8cbe-2256-e769169d8884@amd.com>
 <df915c16-198d-502d-6eed-975a0471ec13@gmail.com>
 <ayyik7-bhm0th-f76qzcrx4nuhoz097-fqib6y-d00kkm-l8swdj-bb0hlq-6hyzem-xpderd-hmxy8m-n7py9m2f0bz2o58vot2offja-ec4pyzuy9pjm-235qpt-69n2k9ugq2z1gpw45e-vjjmkviqgdj4.1568301521040@email.android.com>
From: "Pierre-Loup A. Griffais" <pgriffais@valvesoftware.com>
Message-ID: <f4fd2410-7031-764b-1ee6-4182dec04a82@valvesoftware.com>
Date: Tue, 17 Sep 2019 14:56:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <ayyik7-bhm0th-f76qzcrx4nuhoz097-fqib6y-d00kkm-l8swdj-bb0hlq-6hyzem-xpderd-hmxy8m-n7py9m2f0bz2o58vot2offja-ec4pyzuy9pjm-235qpt-69n2k9ugq2z1gpw45e-vjjmkviqgdj4.1568301521040@email.android.com>
Content-Language: en-US
X-ClientProxiedBy: mail1.valvemail.org (172.16.144.22) To mail1.valvemail.org
 (172.16.144.22)
X-EXCLAIMER-MD-CONFIG: fe5cb8ea-1338-4c54-81e0-ad323678e037
X-Mlf-CnxnMgmt-Allow: 172.16.144.22
X-Mlf-Version: 9.0.5.2081
X-Mlf-License: BSVKCAP__
X-Mlf-UniqueId: o201909172159110014850
X-MC-Unique: JMXnAX81NVmclgFgESMx9A-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=valvesoftware.com; 
 s=mc20150811; t=1568757967;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8tUzuMRp+DKkJJVWgd7wAsBucumfAbxpW72CuNkMhwQ=;
 b=LUXkHThHzYdCd1wphbX9pcsVN9m1WgvY5VX/Sa/iHZhNbmgSP5FKeFN2eyWKlMXQse/Elk
 dZhnjZLVY/JO4f1HeWnSKpX/QXcmq3KbW5AaXxJVOkE2L/Nwl311Ksv4Yv6UR0R9edpTJX
 l+ZM1YBRER03hBPRE+fCGPp/Fhx80JM=
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
Content-Type: multipart/mixed; boundary="===============0260363629=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0260363629==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="------------10F568794A1E5406AEBAF53B"

--------------10F568794A1E5406AEBAF53B
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Hello,

Applying this locally, the issue we were seeing with very high submit=20
times in high-end workloads seems largely gone. My methodology is to=20
measure the total time spent in DRM_IOCTL_AMDGPU_CS with `strace -T` for=20
the whole first scene of the Shadow of the Tomb Raider benchmark, and=20
divide by the frame count in that scene to get an idea of how much CPU=20
time is spent in submissions per frame. More details below.

On a Vega20 system with a 3900X, at High settings (~6 gigs of VRAM usage=20
according to UMR, no contention):

 =C2=A0- 5.2.14: 1.1ms per frame in CS

 =C2=A0- 5.2.14 + LRU bulk moves: 0.6ms per frame in CS

On a Polaris10 system with a i7-7820X, at Very High Settings (7.7G/8G=20
VRAM used, no contention):

 =C2=A0- 5.2.15: 12.03ms per frame in CS (!)

 =C2=A0- 5.2.15 + LRU bulk moves:=C2=A0 1.35ms per frame in CS

The issue is largely addressed. 1.35ms is still higher than I'd expect,=20
but it's still pretty reasonable. Note that on many of our usecases,=20
submission happens in a separate thread and doesn't typically impact=20
overall frame time/latency if you have extra CPU cores to work with.=20
However it very negatively affects performance as soon as the CPU gets=20
saturated, and burns a ton of power.

Thanks!

 =C2=A0- Pierre-Loup

Methodology details:

# Mesa patched to kill() itself with SIGCONT in vkQueuePresent to act as=20
a frame marker in-band with the strace data.

# strace collection:

strace -f -p 13113 -e ioctl,kill -o sottr_first_scene_vanilla -T

# frame count:

cat sottr_first_scene_vanilla | grep kill\( | wc -l
616

# total time spent in _CS:

cat sottr_first_scene_vanilla | grep AMDGPU_CS | grep -v unfinished | tr=20
-s ' '=C2=A0 | cut -d ' ' -f7 | tr -d \< | tr -d \> | xargs=C2=A0 | tr ' ' =
'+' | bc
7.411782

# seconds to milliseconds, then divide by frame count

(gdb) p 7.41 * 1000.0 / 616.0
$1 =3D 12.029220779220779

On 9/12/19 8:18 AM, Zhou, David(ChunMing) wrote:
> I dont know dkms status=EF=BC=8Canyway, we should submit this one as earl=
y as=20
> possible.
>
> -------- =E5=8E=9F=E5=A7=8B=E9=82=AE=E4=BB=B6 --------
> =E4=B8=BB=E9=A2=98=EF=BC=9ARe: [PATCH] drm/amdgpu: resvert "disable bulk =
moves for now"
> =E5=8F=91=E4=BB=B6=E4=BA=BA=EF=BC=9AChristian K=C3=B6nig
> =E6=94=B6=E4=BB=B6=E4=BA=BA=EF=BC=9A"Zhou, David(ChunMing)" ,amd-gfx@list=
s.freedesktop.org
> =E6=8A=84=E9=80=81=EF=BC=9A
>
> Just to double check: We do have that enabled in the DKMS package for a
> while and doesn't encounter any more problems with it, correct?
>
> Thanks,
> Christian.
>
> Am 12.09.19 um 16:02 schrieb Chunming Zhou:
> > RB on it to go ahead.
> >
> > -David
> >
> > =E5=9C=A8 2019/9/12 18:15, Christian K=C3=B6nig =E5=86=99=E9=81=93:
> >> This reverts commit a213c2c7e235cfc0e0a161a558f7fdf2fb3a624a.
> >>
> >> The changes to fix this should have landed in 5.1.
> >>
> >> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> >> ---
> >>=C2=A0=C2=A0=C2=A0 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c | 2 --
> >>=C2=A0=C2=A0=C2=A0 1 file changed, 2 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c=20
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> >> index 48349e4f0701..fd3fbaa73fa3 100644
> >> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> >> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> >> @@ -603,14 +603,12 @@ void amdgpu_vm_move_to_lru_tail(struct=20
> amdgpu_device *adev,
> >>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct ttm_bo_global *glob =3D ade=
v->mman.bdev.glob;
> >>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct amdgpu_vm_bo_base *bo_base;
> >>
> >> -#if 0
> >>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (vm->bulk_moveable) {
> >>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 spin_lock(&glob->lru_lock);
> >> ttm_bo_bulk_move_lru_tail(&vm->lru_bulk_move);
> >>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 spin_unlock(&glob->lru_lock);
> >>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 return;
> >>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> >> -#endif
> >>
> >>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 memset(&vm->lru_bulk_move, 0, size=
of(vm->lru_bulk_move));
> >>
>
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--------------10F568794A1E5406AEBAF53B
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8=
">
  </head>
  <body text=3D"#000000" bgcolor=3D"#FFFFFF">
    <p>Hello,</p>
    <p>Applying this locally, the issue we were seeing with very high
      submit times in high-end workloads seems largely gone. My
      methodology is to measure the total time spent in
      DRM_IOCTL_AMDGPU_CS with `strace -T` for the whole first scene of
      the Shadow of the Tomb Raider benchmark, and divide by the frame
      count in that scene to get an idea of how much CPU time is spent
      in submissions per frame. More details below.<br>
    </p>
    <p>On a Vega20 system with a 3900X, at High settings (~6 gigs of
      VRAM usage according to UMR, no contention):</p>
    <p>=C2=A0- 5.2.14: 1.1ms per frame in CS</p>
    <p>=C2=A0- 5.2.14 + LRU bulk moves: 0.6ms per frame in CS</p>
    <p>On a Polaris10 system with a i7-7820X, at Very High Settings
      (7.7G/8G VRAM used, no contention):</p>
    <p>=C2=A0- 5.2.15: 12.03ms per frame in CS (!)</p>
    <p>=C2=A0- 5.2.15 + LRU bulk moves:=C2=A0 1.35ms per frame in CS</p>
    <p>The issue is largely addressed. 1.35ms is still higher than I'd
      expect, but it's still pretty reasonable. Note that on many of our
      usecases, submission happens in a separate thread and doesn't
      typically impact overall frame time/latency if you have extra CPU
      cores to work with. However it very negatively affects performance
      as soon as the CPU gets saturated, and burns a ton of power.</p>
    <p>Thanks!</p>
    <p>=C2=A0- Pierre-Loup</p>
    <p>Methodology details:</p>
    <p># Mesa patched to kill() itself with SIGCONT in vkQueuePresent to
      act as a frame marker in-band with the strace data.<br>
    </p>
    <p># strace collection:</p>
    <p>strace -f -p 13113 -e ioctl,kill -o sottr_first_scene_vanilla -T</p>
    <p># frame count:<br>
    </p>
    <p>cat sottr_first_scene_vanilla | grep kill\( | wc -l<br>
      616</p>
    <p># total time spent in _CS:</p>
    <p>cat sottr_first_scene_vanilla | grep AMDGPU_CS | grep -v
      unfinished | tr -s ' '=C2=A0 | cut -d ' ' -f7 | tr -d \&lt; | tr -d
      \&gt; | xargs=C2=A0 | tr ' ' '+' | bc<br>
      7.411782</p>
    <p># seconds to milliseconds, then divide by frame count</p>
    <p>(gdb) p 7.41 * 1000.0 / 616.0<br>
      $1 =3D 12.029220779220779<br>
    </p>
    <div class=3D"moz-cite-prefix">On 9/12/19 8:18 AM, Zhou,
      David(ChunMing) wrote:<br>
    </div>
    <blockquote type=3D"cite"
cite=3D"mid:ayyik7-bhm0th-f76qzcrx4nuhoz097-fqib6y-d00kkm-l8swdj-bb0hlq-6hy=
zem-xpderd-hmxy8m-n7py9m2f0bz2o58vot2offja-ec4pyzuy9pjm-235qpt-69n2k9ugq2z1=
gpw45e-vjjmkviqgdj4.1568301521040@email.android.com">
      <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF=
-8">
      <meta name=3D"Generator" content=3D"Microsoft Exchange Server">
      <!-- converted from text -->
      <style><!-- .EmailQuote { margin-left: 1pt; padding-left: 4pt; border=
-left: #800000 2px solid; } --></style>
      <div>I dont know dkms status=EF=BC=8Canyway, we should submit this on=
e as
        early as possible.<br>
        <br>
        -------- =E5=8E=9F=E5=A7=8B=E9=82=AE=E4=BB=B6 --------<br>
        =E4=B8=BB=E9=A2=98=EF=BC=9ARe: [PATCH] drm/amdgpu: resvert "disable=
 bulk moves for now"<br>
        =E5=8F=91=E4=BB=B6=E4=BA=BA=EF=BC=9AChristian K=C3=B6nig <br>
        =E6=94=B6=E4=BB=B6=E4=BA=BA=EF=BC=9A"Zhou, David(ChunMing)" ,<a cla=
ss=3D"moz-txt-link-abbreviated" href=3D"mailto:amd-gfx@lists.freedesktop.or=
g">amd-gfx@lists.freedesktop.org</a><br>
        =E6=8A=84=E9=80=81=EF=BC=9A<br>
        <br>
      </div>
      <font size=3D"2"><span style=3D"font-size:11pt;">
          <div class=3D"PlainText">Just to double check: We do have that
            enabled in the DKMS package for a
            <br>
            while and doesn't encounter any more problems with it,
            correct?<br>
            <br>
            Thanks,<br>
            Christian.<br>
            <br>
            Am 12.09.19 um 16:02 schrieb Chunming Zhou:<br>
            &gt; RB on it to go ahead.<br>
            &gt;<br>
            &gt; -David<br>
            &gt;<br>
            &gt; =E5=9C=A8 2019/9/12 18:15, Christian K=C3=B6nig =E5=86=99=
=E9=81=93:<br>
            &gt;&gt; This reverts commit
            a213c2c7e235cfc0e0a161a558f7fdf2fb3a624a.<br>
            &gt;&gt;<br>
            &gt;&gt; The changes to fix this should have landed in 5.1.<br>
            &gt;&gt;<br>
            &gt;&gt; Signed-off-by: Christian K=C3=B6nig
            <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:christian.koe=
nig@amd.com">&lt;christian.koenig@amd.com&gt;</a><br>
            &gt;&gt; ---<br>
            &gt;&gt;=C2=A0=C2=A0=C2=A0 drivers/gpu/drm/amd/amdgpu/amdgpu_vm=
.c | 2 --<br>
            &gt;&gt;=C2=A0=C2=A0=C2=A0 1 file changed, 2 deletions(-)<br>
            &gt;&gt;<br>
            &gt;&gt; diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
            b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c<br>
            &gt;&gt; index 48349e4f0701..fd3fbaa73fa3 100644<br>
            &gt;&gt; --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c<br>
            &gt;&gt; +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c<br>
            &gt;&gt; @@ -603,14 +603,12 @@ void
            amdgpu_vm_move_to_lru_tail(struct amdgpu_device *adev,<br>
            &gt;&gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct ttm_bo_glob=
al *glob =3D
            adev-&gt;mman.bdev.glob;<br>
            &gt;&gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct amdgpu_vm_b=
o_base *bo_base;<br>
            &gt;&gt;=C2=A0=C2=A0=C2=A0 <br>
            &gt;&gt; -#if 0<br>
            &gt;&gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (vm-&gt;bulk_mo=
veable) {<br>
            &gt;&gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 spin_lock(&amp;glob-&gt;lru_lock);<br>
            &gt;&gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
            ttm_bo_bulk_move_lru_tail(&amp;vm-&gt;lru_bulk_move);<br>
            &gt;&gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 spin_unlock(&amp;glob-&gt;lru_lock);<br>
            &gt;&gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;<br>
            &gt;&gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }<br>
            &gt;&gt; -#endif<br>
            &gt;&gt;=C2=A0=C2=A0=C2=A0 <br>
            &gt;&gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 memset(&amp;vm-&gt=
;lru_bulk_move, 0,
            sizeof(vm-&gt;lru_bulk_move));<br>
            &gt;&gt;=C2=A0=C2=A0=C2=A0 <br>
            <br>
          </div>
        </span></font>
      <br>
      <fieldset class=3D"mimeAttachmentHeader"></fieldset>
      <pre class=3D"moz-quote-pre" wrap=3D"">______________________________=
_________________
amd-gfx mailing list
<a class=3D"moz-txt-link-abbreviated" href=3D"mailto:amd-gfx@lists.freedesk=
top.org">amd-gfx@lists.freedesktop.org</a>
<a class=3D"moz-txt-link-freetext" href=3D"https://lists.freedesktop.org/ma=
ilman/listinfo/amd-gfx">https://lists.freedesktop.org/mailman/listinfo/amd-=
gfx</a></pre>
    </blockquote>
  </body>
</html>

--------------10F568794A1E5406AEBAF53B--


--===============0260363629==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0260363629==--

