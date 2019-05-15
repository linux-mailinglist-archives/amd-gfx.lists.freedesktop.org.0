Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB5931FCF0
	for <lists+amd-gfx@lfdr.de>; Thu, 16 May 2019 03:43:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29B6989254;
	Thu, 16 May 2019 01:43:33 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70FF889202
 for <amd-gfx@lists.freedesktop.org>; Wed, 15 May 2019 18:15:11 +0000 (UTC)
Received: by mail-pg1-x52c.google.com with SMTP id d30so176235pgm.7
 for <amd-gfx@lists.freedesktop.org>; Wed, 15 May 2019 11:15:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=mDGQPLMYLFvHhs86BkXjvTKiF06yZKCJA4GmTThJ4og=;
 b=FWKIsm6NJFN4gEQdBz+EFlV9bfbZLy/rYUMCV3kfxu2fZcAzKLJMwhF3iQwcq0rDdN
 KHTiIOkk/U50QOSZL7gkKIOUGcIBH2XCQBNf33siCq82Wzylq7eSFqEpgatb0zQqq+Fv
 zjW4EEKJxYlkxsJrm/mTx/KV0CdLeLKje7EPqb+gD2ylLJfN98B/uMa+wdiITrB1uWeN
 +BfBPX7ePYnsMmqLAuiTvElHnIV6E91pNi/Zp22uAeiXAWp3LlZJTsnuYTHUDtSlq0kH
 BYZZjrjOj7eUqNHozVo4KhBqgbiJqldriFcDBC6QcjeVRkhddt0GJigA71BFwu+JU9Vk
 /Reg==
X-Gm-Message-State: APjAAAVhyZ5s3ZI5kT7DlTZhXpvZOvvNqCXBQfpNRQc8Wpqj47sJsSqr
 X6oRlxROmBtoFWOSGuC9PhhZhY1ABiWFc/Km7Iq1yveSuwOxeA==
X-Google-Smtp-Source: APXvYqzz3+EuT87nP8qQGBxIj8ZZsCJcrPqURPiK8AWSyxDaWCoxklAbO3Q0s3B9pUzHV55b16mrrg9AERQOOtm2BP0=
X-Received: by 2002:aa7:9151:: with SMTP id 17mr47169480pfi.192.1557944110104; 
 Wed, 15 May 2019 11:15:10 -0700 (PDT)
MIME-Version: 1.0
From: Micah Morton <mortonm@google.com>
Date: Wed, 15 May 2019 11:14:59 -0700
Message-ID: <CAJEGiUaGUG_8FK33-_a4ufTgacjzMds66boF+1Ytx9NYKbPX9Q@mail.gmail.com>
Subject: GPU passthrough support for Stoney [Radeon R2/R3/R4/R5 Graphics]?
To: amd-gfx@lists.freedesktop.org
X-Mailman-Approved-At: Thu, 16 May 2019 01:43:32 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=mDGQPLMYLFvHhs86BkXjvTKiF06yZKCJA4GmTThJ4og=;
 b=CIVXWtzvNnlnws23lqGpy5ZSXwZIKKn0b74b9tEaxIUC/Mico65COw5O14usjPC/iz
 Ca8G/+G07a9HtniQX0lbQScjYMV+BQbv5gh++X8gZ1/Mh6uRGhZ3fB0N0/M0Bg7ySawV
 VPsRzPI7YjapSg3KbVe+AbL7AIbO1q7r+YbHqj4ykNMkSXZufUfciDULxHsIJLzH6g5C
 I1i6zdV1rprk7+CSRw+Od/0HQtBc58PtGH6S5YHg/7cuLMIo4E3amWZpvFRSezPOAPU6
 wshwoz77hEgdOEdiL6TNtFGkjgQ+yKu+v9kqKYLd2uAW2NiXDE9quZv7JTLw3NuKcVu+
 P3cw==
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
Content-Type: multipart/mixed; boundary="===============1095822132=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1095822132==
Content-Type: multipart/alternative; boundary="00000000000043ba7e0588f121c1"

--00000000000043ba7e0588f121c1
Content-Type: text/plain; charset="UTF-8"

Hi folks,

I'm interested in running a VM on a system with an integrated Stoney
[Radeon R2/R3/R4/R5 Graphics] card and passing through the graphics card to
the VM using the IOMMU. I'm wondering whether this is feasible and supposed
to be doable with the right setup (as opposed to passing a discrete GPU to
the VM, which I think is definitely doable?).

So far, I can do all the qemu/kvm/vfio/iommu stuff to run the VM and pass
the integrated GPU to it, but the drm driver in the VM fails during
amdgpu_device_init(). Specifically, the logs show the SMU being
unresponsive, which leads to a 'SMU firmware load failed' error message and
kernel panic. I can share VM logs and the invocation of qemu and such if
helpful, but first wanted to know at a high level if this should be
feasible?

P.S.: I'm not initializing the GPU in the host bios or host kernel at all,
so I should be passing a fresh GPU to the VM. Also, I'm pretty sure I'm
running the correct VGA bios for this GPU in the guest VM bios before guest
boot.

Any comments/suggestions would be appreciated!

Micah

--00000000000043ba7e0588f121c1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr">Hi folk=
s,</div><div dir=3D"ltr"><div><br></div><div>I&#39;m interested in running =
a VM on a system with an integrated Stoney [Radeon R2/R3/R4/R5 Graphics] ca=
rd and passing through the graphics card to the VM using the IOMMU. I&#39;m=
 wondering whether this is feasible and supposed to be doable with the righ=
t setup (as opposed to passing a discrete GPU to the VM, which I think is d=
efinitely doable?).</div><div><br></div><div>So far, I can do all the qemu/=
kvm/vfio/iommu stuff to run the VM and pass the integrated GPU to it, but t=
he drm driver in the VM fails during amdgpu_device_init(). Specifically, th=
e logs show the SMU being unresponsive, which leads to a &#39;SMU firmware =
load failed&#39; error message and kernel panic. I can share VM logs and th=
e invocation of qemu and such if helpful, but first wanted to know at a hig=
h level if this should be feasible?</div><div><br></div><div>P.S.: I&#39;m =
not initializing the GPU in the host bios or host kernel at all, so I shoul=
d be passing a fresh GPU to the VM. Also, I&#39;m pretty sure I&#39;m runni=
ng the correct VGA bios for this GPU in the guest VM bios before guest boot=
.</div><div><br></div><div>Any comments/suggestions would be appreciated!</=
div><div><br></div><div>Micah</div><div><br></div><div><br></div></div></di=
v></div></div>

--00000000000043ba7e0588f121c1--

--===============1095822132==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1095822132==--
