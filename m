Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84539CE8DA
	for <lists+amd-gfx@lfdr.de>; Mon,  7 Oct 2019 18:15:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 032596E60C;
	Mon,  7 Oct 2019 16:15:36 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BAE26E60C
 for <amd-gfx@lists.freedesktop.org>; Mon,  7 Oct 2019 16:15:35 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id m18so113767wmc.1
 for <amd-gfx@lists.freedesktop.org>; Mon, 07 Oct 2019 09:15:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=f8YWvdZ9eAEqe1AHH4IZukyu6fu/x4wVq0AJw4+qbfc=;
 b=lfKR0SzO8ND7umkfu2WKoHJVjBKJtAfEmpZb0eb4vXRM1cJkWc5en240WYKVwiHJqO
 hO+F743VVQpYUOE5zk8Zj7Qgl77pQZC9Dz2PkcwKseoiDSK3Wyixbtr9qreIbhDTQ50Z
 gTjISaurax170PVSIkk2hamxf6EZ5iKrK27J7IEt01QDV40up7GrtbP+ZYNhAtOHisi3
 1z8h61RMjNTdhrnIkl/UfT7iyuqjYHpg4x1/YClKbkcQWuHGLhFiOjx3AeWM9zPoUZ6T
 GmnO50knT2a8ks5OOmlCxdKmgLUp01Gkkvv+2RfLf0ld4t3NH5keYzDlxVCvZ9wY6keO
 SDvw==
X-Gm-Message-State: APjAAAVwUAp+vcpKrwccHDpxB/ZBaklLF+yqkOHjEMOVmLhqD5U2uOdw
 hAT+77ZZI2exuJzQ2Zwj3/A8al51ellgZ6/AqyIqXQ==
X-Google-Smtp-Source: APXvYqwq/za+SmH15gGvCYuVwX2LAGpV+r5SWKYbICV4HfuyVhpZzsGOHh30chIduOJy3CBSQLR1BK6L4c8Ha1ra4zo=
X-Received: by 2002:a1c:7d92:: with SMTP id y140mr31615wmc.141.1570464933521; 
 Mon, 07 Oct 2019 09:15:33 -0700 (PDT)
MIME-Version: 1.0
References: <20191004141529.5342-1-alexander.deucher@amd.com>
In-Reply-To: <20191004141529.5342-1-alexander.deucher@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 7 Oct 2019 12:15:22 -0400
Message-ID: <CADnq5_P403SOcTOVybyHaa8xN16s1pXFRpHC=nTWZ4K3rJ+u3g@mail.gmail.com>
Subject: Re: [PATCH] drm/amdkfd: fix the build when CIK support is disabled
To: amd-gfx list <amd-gfx@lists.freedesktop.org>, Yong Zhao <yong.zhao@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=f8YWvdZ9eAEqe1AHH4IZukyu6fu/x4wVq0AJw4+qbfc=;
 b=PFbZRqhbHzw4lQ1hCXNtfduzyrR7hx+MkoJqmX+iQtZNOGcGUeLo8PsTnP+vrEuHc9
 jCKiPb+r+d6/Mswc+qIF7zGfZMNkbcTEteGOWr3EUsDHUUjOHw716WEc1mj/ZGDxELwL
 S8JPC0OgD6729x8ctJmxeMSRfhwLWFy7ewHbiRqwrajq5EcTpa3qzE61JLZQ6U8FC3do
 MHuWpdBy5GyjH3jghmh/s/S73+RZGXQGlNQgc9aB6czDuqkSB0vrc2HyrAXPaakEJwBj
 g57hZgrmqeLt50KfmYBme05hTr3rZr5oQlcHoSTlNsyoemgcMhy3/VyS4qcXVxV5CiBP
 jf7A==
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UGluZy4uLgoKT24gRnJpLCBPY3QgNCwgMjAxOSBhdCAxMDoxNSBBTSBBbGV4IERldWNoZXIgPGFs
ZXhkZXVjaGVyQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBBZGQgcHJvcGVyIGlmZGVmcyBhcm91bmQg
Q0lLIGNvZGUgaW4ga2ZkIHNldHVwLgo+Cj4gU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxh
bGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGtmZC9rZmRfZGV2aWNlLmMgfCA2ICsrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRp
b25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2Rl
dmljZS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZS5jCj4gaW5kZXgg
MGRiMjczNTg3YWY0Li5kODk4YWRmMjVmYmIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRrZmQva2ZkX2RldmljZS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRr
ZmQva2ZkX2RldmljZS5jCj4gQEAgLTM5LDcgKzM5LDkgQEAKPiAgICovCj4gIHN0YXRpYyBhdG9t
aWNfdCBrZmRfbG9ja2VkID0gQVRPTUlDX0lOSVQoMCk7Cj4KPiArI2lmZGVmIENPTkZJR19EUk1f
QU1ER1BVX0NJSwo+ICBleHRlcm4gY29uc3Qgc3RydWN0IGtmZDJrZ2RfY2FsbHMgZ2Z4X3Y3X2tm
ZDJrZ2Q7Cj4gKyNlbmRpZgo+ICBleHRlcm4gY29uc3Qgc3RydWN0IGtmZDJrZ2RfY2FsbHMgZ2Z4
X3Y4X2tmZDJrZ2Q7Cj4gIGV4dGVybiBjb25zdCBzdHJ1Y3Qga2ZkMmtnZF9jYWxscyBnZnhfdjlf
a2ZkMmtnZDsKPiAgZXh0ZXJuIGNvbnN0IHN0cnVjdCBrZmQya2dkX2NhbGxzIGFyY3R1cnVzX2tm
ZDJrZ2Q7Cj4gQEAgLTQ3LDExICs0OSwxNSBAQCBleHRlcm4gY29uc3Qgc3RydWN0IGtmZDJrZ2Rf
Y2FsbHMgZ2Z4X3YxMF9rZmQya2dkOwo+Cj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3Qga2ZkMmtnZF9j
YWxscyAqa2ZkMmtnZF9mdW5jc1tdID0gewo+ICAjaWZkZWYgS0ZEX1NVUFBPUlRfSU9NTVVfVjIK
PiArI2lmZGVmIENPTkZJR19EUk1fQU1ER1BVX0NJSwo+ICAgICAgICAgW0NISVBfS0FWRVJJXSA9
ICZnZnhfdjdfa2ZkMmtnZCwKPiArI2VuZGlmCj4gICAgICAgICBbQ0hJUF9DQVJSSVpPXSA9ICZn
Znhfdjhfa2ZkMmtnZCwKPiAgICAgICAgIFtDSElQX1JBVkVOXSA9ICZnZnhfdjlfa2ZkMmtnZCwK
PiAgI2VuZGlmCj4gKyNpZmRlZiBDT05GSUdfRFJNX0FNREdQVV9DSUsKPiAgICAgICAgIFtDSElQ
X0hBV0FJSV0gPSAmZ2Z4X3Y3X2tmZDJrZ2QsCj4gKyNlbmRpZgo+ICAgICAgICAgW0NISVBfVE9O
R0FdID0gJmdmeF92OF9rZmQya2dkLAo+ICAgICAgICAgW0NISVBfRklKSV0gPSAmZ2Z4X3Y4X2tm
ZDJrZ2QsCj4gICAgICAgICBbQ0hJUF9QT0xBUklTMTBdID0gJmdmeF92OF9rZmQya2dkLAo+IC0t
Cj4gMi4yMC4xCj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
