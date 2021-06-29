Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA9B53B78ED
	for <lists+amd-gfx@lfdr.de>; Tue, 29 Jun 2021 21:57:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0342989F33;
	Tue, 29 Jun 2021 19:57:12 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F14EA6E8B8
 for <amd-gfx@lists.freedesktop.org>; Tue, 29 Jun 2021 15:46:01 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id z4so1828008plg.8
 for <amd-gfx@lists.freedesktop.org>; Tue, 29 Jun 2021 08:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=/OiV8fo6JoCtv4Z7iEdMkWE/FcspKigRd/olcjKyFRE=;
 b=DwBeh7tfBxoeVeLZ/jVX2l/ERmc2gaAJaEu5NRGD0N+XTVpTNF8wg9jdMdOuzIPqTw
 dH7ya9g5MDL3Z8DjqiOU02NVsVLJZB2VZKczSwT72XCmymdtQsCM9Hem6G4xkOjLxcQi
 KX+psxcU+wigk0TTrBrLzRjiwRQO2e88t1hbutX6TeVl+OBXt9LBurisF2lvyID+7UrQ
 epMxOGfw6W2rmmyB26vrNZzmhNFLPJ3mzMspWwYpuGSljY4A62cmPqGdNlc+pKxRS+V+
 Djmzk0m+39vKwxLhOsmNjvWXy98YlCT6uvBpjRGKRr1fjJKtX45UwY8T63DSTQYrIve3
 5bqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=/OiV8fo6JoCtv4Z7iEdMkWE/FcspKigRd/olcjKyFRE=;
 b=i2bpUo9F9MgxFCToj6ySPp4fPL1SNwExyC1i6xVNqGtiM6KWvlXvsfDE21NnWUyqIF
 nMtLXi6iTsPsuRwfmq8CpItBBXEUGQLtsVOkQLRkNtrYQJ3tOVpzM7lcSxw1w0WxdeBl
 4VYAwoWoTWJ2GuyzwD0QvUN2oRoipFRxLIIW5TRAf+d2Ofj0SBsLz2Wav8/42isUp8oD
 g6CufSLnnWjrCqWtZRolg2fjdoKoBwPRGXfuVQ7e1jcFXNH3lgt1lbGsTc1hd3YlJBvM
 tSljp4XARTh8hm2niD/oPh54a8dwhX7vcut6QiShw5aHpNci9ARGYYllQzzVtb+KPPWA
 Lmmg==
X-Gm-Message-State: AOAM532UvcjqBrqe/XrF2HvtcyDOxBxhZjnYBRe3/wCdrDAhfPTKGG2M
 iMtx9EJZHKqclFK20dFxKuc4cmkJRes+FAYgYMr5Wmkx
X-Google-Smtp-Source: ABdhPJzry8/KK1CXoL00J3BVKPm32SnKCpA+TQdv+fCabijAfNZQgVEeCLPm+3dI5ke/GCXJcoE38W1hx62bBnLt8Dk=
X-Received: by 2002:a17:90a:7c4b:: with SMTP id
 e11mr45009653pjl.73.1624981561408; 
 Tue, 29 Jun 2021 08:46:01 -0700 (PDT)
MIME-Version: 1.0
From: Ketsui <esgwpl@gmail.com>
Date: Tue, 29 Jun 2021 22:45:50 +0700
Message-ID: <CAB3xKZ1PQeZXiXNootYrdPc5RHo9KZ5vM8zX3V5ydAD8-AhfMA@mail.gmail.com>
Subject: Re: AMDGPU error: "[drm:amdgpu_dm_atomic_commit_tail [amdgpu]]
 *ERROR* Waiting for fences timed out!"
To: amd-gfx@lists.freedesktop.org
X-Mailman-Approved-At: Tue, 29 Jun 2021 19:57:10 +0000
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
Content-Type: multipart/mixed; boundary="===============0221469998=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0221469998==
Content-Type: multipart/alternative; boundary="000000000000bc010c05c5e9809f"

--000000000000bc010c05c5e9809f
Content-Type: text/plain; charset="UTF-8"

I have the 3200G I'm still getting this error with that version.

[ +23.754701] amdgpu 0000:08:00.0: amdgpu: [gfxhub0] retry page fault
(src_id:0 ring:0 vmid:2 pasid:32773, for process mpv pid 5016 thread
mpv:cs0 pid 5064)
[  +0.000017] amdgpu 0000:08:00.0: amdgpu:   in page starting at address
0x80010009e000 from client 27
[  +0.000007] amdgpu 0000:08:00.0: amdgpu:
VM_L2_PROTECTION_FAULT_STATUS:0x00240C51
[  +0.000003] amdgpu 0000:08:00.0: amdgpu:       Faulty UTCL2 client ID:
CPG (0x6)
[  +0.000003] amdgpu 0000:08:00.0: amdgpu:       MORE_FAULTS: 0x1
[  +0.000002] amdgpu 0000:08:00.0: amdgpu:       WALKER_ERROR: 0x0
[  +0.000002] amdgpu 0000:08:00.0: amdgpu:       PERMISSION_FAULTS: 0x5
[  +0.000002] amdgpu 0000:08:00.0: amdgpu:       MAPPING_ERROR: 0x0
[  +0.000001] amdgpu 0000:08:00.0: amdgpu:       RW: 0x1

--000000000000bc010c05c5e9809f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I have the 3200G I&#39;m still getting this error wit=
h that version.</div><div><br></div><div>[ +23.754701] amdgpu 0000:08:00.0:=
 amdgpu: [gfxhub0] retry page fault (src_id:0 ring:0 vmid:2 pasid:32773, fo=
r process mpv pid 5016 thread mpv:cs0 pid 5064)<br>[=C2=A0 +0.000017] amdgp=
u 0000:08:00.0: amdgpu:=C2=A0=C2=A0 in page starting at address 0x80010009e=
000 from client 27<br>[=C2=A0 +0.000007] amdgpu 0000:08:00.0: amdgpu: VM_L2=
_PROTECTION_FAULT_STATUS:0x00240C51<br>[=C2=A0 +0.000003] amdgpu 0000:08:00=
.0: amdgpu:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Faulty UTCL2 client ID: CPG=
 (0x6)<br>[=C2=A0 +0.000003] amdgpu 0000:08:00.0: amdgpu:=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 MORE_FAULTS: 0x1<br>[=C2=A0 +0.000002] amdgpu 0000:08:00=
.0: amdgpu:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 WALKER_ERROR: 0x0<br>[=C2=
=A0 +0.000002] amdgpu 0000:08:00.0: amdgpu:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 PERMISSION_FAULTS: 0x5<br>[=C2=A0 +0.000002] amdgpu 0000:08:00.0: am=
dgpu:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MAPPING_ERROR: 0x0<br>[=C2=A0 +0.=
000001] amdgpu 0000:08:00.0: amdgpu:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 RW=
: 0x1<br></div></div>

--000000000000bc010c05c5e9809f--

--===============0221469998==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--===============0221469998==--
