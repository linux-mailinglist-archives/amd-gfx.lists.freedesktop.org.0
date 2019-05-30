Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC1F2F774
	for <lists+amd-gfx@lfdr.de>; Thu, 30 May 2019 08:30:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 502FF89B8F;
	Thu, 30 May 2019 06:30:42 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCC0289B8F;
 Thu, 30 May 2019 06:30:40 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 7E19820033;
 Thu, 30 May 2019 08:30:36 +0200 (CEST)
Date: Thu, 30 May 2019 08:30:29 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: drop drmP.h usage? [Was: [pull] amdgpu, amdkfd drm-next-5.3]
Message-ID: <20190530063029.GA20000@ravnborg.org>
References: <20190529220944.14464-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190529220944.14464-1-alexander.deucher@amd.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
 a=6cHt9Nh_mV51WdzMUoMA:9 a=CjuIK1q_8ugA:10
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
Cc: Alex Deucher <alexander.deucher@amd.com>, daniel.vetter@ffwll.ch,
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SGkgQWxleCBldCBhbGwuCgo+IC0gVmFyaW91cyBjbGVhbnVwcwoKQW55IGNoYW5jZSB0byBwZXJz
dWFkZSBvbmUgb2YgeW91IGd1eXMgdG8gc3dlZXAgdGhyb3VnaCB0aGUgYW1kIC8gcmFlZGVvbgp0
cmVlIGFuZCBkcm9wIHVzZSBvZiB0aGUgZGVwcmVjYXRlZCBoZWFkZXIgZHJtUC5oPwoKU3RhdHVz
IGF0IHRoZSBtb21lbnQgKGRybS1taXNjLW5leHQpOgokZ2l0IGdyZXAgZHJtUCB8IGN1dCAtZCAn
LycgLWYgMSAgfCB1bmlxIC1jIHwgc29ydCAtbiB8IHRhaWwgLW4gMTAKICAgICAxMSBtZXNvbgog
ICAgIDEyIG1lZGlhdGVrCiAgICAgMTMgdm13Z2Z4CiAgICAgMTUgcm9ja2NoaXAKICAgICAxNiBz
dGkKICAgICAxOCBzdW40aQogICAgIDI0IGV4eW5vcwogICAgIDI3IG5vdXZlYXUKICAgIDEwMyBy
YWRlb24KICAgIDExMCBhbWQKCm5vdXZlYXUgaXMgYWxyZWFkeSB0YWtlbiBjYXJlIG9mLCB0aGUg
Y2xlYW51cCBpcyBpbiB0aGVpciB0cmVlLgphbWQgYW5kIHJhZGVvbiBhcmUgdGhlIHR3byAid29y
c3QiIGRyaXZlcnMgaW4gdGhpcyByZXNwZWN0IGF0IHRoZQptb21lbnQuCgpUaGFua3MsCglTYW0K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
