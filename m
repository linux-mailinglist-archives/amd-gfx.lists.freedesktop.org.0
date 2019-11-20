Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B6D1041B2
	for <lists+amd-gfx@lfdr.de>; Wed, 20 Nov 2019 18:04:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 052456E784;
	Wed, 20 Nov 2019 17:04:29 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E68A6E784
 for <amd-gfx@lists.freedesktop.org>; Wed, 20 Nov 2019 17:04:27 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id c22so428950wmd.1
 for <amd-gfx@lists.freedesktop.org>; Wed, 20 Nov 2019 09:04:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=ens2sycrJ9vVwGOAnvOmZHAVczz92YFxwlgzkN1hEhY=;
 b=oWaUZPIre35MqSR/APFtFPDMoWGMkFUlGr2Up9U8sC3TDb3j7jEzH5S4JdWirX6RLm
 d20SejnzJBmFngnNWKpLW/zb2/0kg33APgSSlZ4KVuOTMXVm2Eg5dzqNJP5vtmJrAf1H
 8PaAn34uYB8H5IUhW3q+tW1anizjxlvQsstBuHfGHpDHiioOPF3LVH3NP85AVk5MF0Sd
 zh13m5psIzBd+I274/G5HE3TfL3tMLyebVQM/O3LLVkA31nXM8wN5qRUHNM0OUQbfToi
 qdV+ASRkXQUNPY/RAzdnkmhIfFEYKQwr4f5024W0c724JKC6nFM0E/Mm+FwqbbaBflk4
 spSA==
X-Gm-Message-State: APjAAAXYIJJQ/jLA4Jnhq9251JbxN0vFkH13EAJYw6auXJRUzaFz5KsF
 cfqp7F5Gr2vm5ihFhQ28Q04XaKwVnJrZIHOMF7Cr4nzEYDY=
X-Google-Smtp-Source: APXvYqwQF7UFI9ECOIObMJeMMhk9zsWIzjFdNZlZPjUOaa9bI9Jtxm1+PMhqzaYy8BCBzxstLzGeFrrpBl6BzgEh0TA=
X-Received: by 2002:a1c:e308:: with SMTP id a8mr4492599wmh.55.1574269465671;
 Wed, 20 Nov 2019 09:04:25 -0800 (PST)
MIME-Version: 1.0
From: =?UTF-8?Q?Yusuf_Alt=C4=B1parmak?= <yusufalti1997@gmail.com>
Date: Wed, 20 Nov 2019 20:04:17 +0300
Message-ID: <CAGzVRjwf9Zo+i_L7rgZKV2oEXqXbMNK1e-z41Tpu+TzsyzfVOQ@mail.gmail.com>
Subject: AMD e9171 linux driver
To: amd-gfx@lists.freedesktop.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=ens2sycrJ9vVwGOAnvOmZHAVczz92YFxwlgzkN1hEhY=;
 b=YwSK/0x1e1pI8kn3Bn+D2YtOypSn6LFFffn01AtlNdRf+L9Ogjh1tt6Bvl79C8ZCIO
 dq97yJ90gWDJlN/3u5IARRmaoZl5/aBL7bOxAWsy/Jc26q2qdP5bWLzDuSj46//yvYcj
 FTINo0wo1KwgCSu+puxmLs1NEhA9sN0KEkp6eNAlejkXVMzaxzMT56nhysubIeeSN2y4
 4eeObj9X0rAiwoFPfOLrs4buyzoF+sUaG+6RyGXy8D6tS0afjFSPzM8chzk99Hh59cHT
 JYa1xkXtjunP535nI7MrR7qnXGuOUN21pk7vDzv8YTqCVJuiCTK5lwDndERKfSV+Kbvp
 1oVg==
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
Content-Type: multipart/mixed; boundary="===============1033552520=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1033552520==
Content-Type: multipart/alternative; boundary="000000000000483d4b0597ca2c27"

--000000000000483d4b0597ca2c27
Content-Type: text/plain; charset="UTF-8"

Hello,

I have simple question. I want to use e9171 with my embedded t1042d4rdb-64b
board. Does linux kernel provide a driver for e9171? More specific, does
'amdgpu'(https://github.com/torvalds/linux/tree/master/drivers/gpu/drm/amd)
provides driver for e9171 ?

Best regards

--000000000000483d4b0597ca2c27
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<div><br></div><div>I have simple question. I want t=
o use e9171 with my embedded t1042d4rdb-64b board. Does linux kernel provid=
e a driver for e9171? More specific, does &#39;amdgpu&#39;(<a href=3D"https=
://github.com/torvalds/linux/tree/master/drivers/gpu/drm/amd">https://githu=
b.com/torvalds/linux/tree/master/drivers/gpu/drm/amd</a>) provides driver f=
or e9171 ?</div><div><br></div><div>Best regards</div></div>

--000000000000483d4b0597ca2c27--

--===============1033552520==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1033552520==--
