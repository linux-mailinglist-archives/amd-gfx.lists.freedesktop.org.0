Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B15F248E21
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:18:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B07A89709;
	Mon, 17 Jun 2019 19:18:39 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93D0E89709
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:18:36 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id y57so12216574qtk.4
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:18:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iWnwv1rsO+qvr2sPS7BlhW55DN/2SCAHeNoRuLW8WY8=;
 b=O2fEGtKLAiWm4DUSEmoBE+N2/3fscp574soCUvW7/pxkEYy+9+5C0O4ziTP/uqagfz
 D6FVSwl17EA/259BUg0eG2CoYQe3oRtBia8WTcxxaxHHBVzm/lUZ/VWtXjQeaXzw59Og
 XPnOv4dv9w8tUqeMOmcxAUBf0DQoCltjE041Woea+Sz9CXZiXC8U9mJfMeMKpwQ8FPXt
 AF0fG2kO39N2dqeFoDfvazNdoukjwB5I51rtrdbwSj5yPzwFqSXSLoRYX1MYFP9UfJpG
 JEXJahjifPeZnJteVPQUFaHyx+EVivrEm0rQ4VWCLI6GgFzSYRTUIfZrL4hMIBfL4/Qr
 MXTw==
X-Gm-Message-State: APjAAAUIz83bWM/KWpYl46+SqLwDML/7DWIcZsSRI6dtvH0QlAD7C3F6
 kuXyfwg9LXdwAGDocGkosIcRwZcl7ew=
X-Google-Smtp-Source: APXvYqzjEdltQbYHG17yVPThxg1mKNjkZnUSaqwJBlTtMM1K4PJ6Mig7JnkcZx32Mue8gwsPvNsSHw==
X-Received: by 2002:ac8:3325:: with SMTP id t34mr92129396qta.172.1560799114780; 
 Mon, 17 Jun 2019 12:18:34 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id s35sm7754876qth.79.2019.06.17.12.18.33
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:18:34 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 097/459] drm/amdgpu/discovery: add ip discovery initial support
Date: Mon, 17 Jun 2019 14:10:58 -0500
Message-Id: <20190617191700.17899-86-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617191700.17899-1-alexander.deucher@amd.com>
References: <20190617191700.17899-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iWnwv1rsO+qvr2sPS7BlhW55DN/2SCAHeNoRuLW8WY8=;
 b=tPlPbsrFrHb+tFrLCjB6OrSB/8Pa41zG6tJKH6IIJovmn9tP3Y+5KiUAaMgx1/8goz
 xYcMevtW+FFMWzt1+5MBy1nzwdkAcT2+4sfC0NX4c0mr1ZSfSIZ8jK7q9sXVirt7ayiO
 9/pdRGzx728EDnxpvZLyRZv5Ig9YMDPg7A1vODqk4i5DBe566ErM9SMsSi7SpjCcjfiW
 4r3wV1N+L1EsVaoZHzHcYhFgyKeOHQImDgvgGvZKuUZPFPdRkIfYCyEQ7QpwESUtuvvw
 Y1nTt0zrTRaz57Z+eAu7PJoEAHCq3mN0W3WewwP4zuOaVyzEI0kOEdniPAMqvXiPxMa0
 Q8Ig==
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Xiaojie Yuan <xiaojie.yuan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogWGlhb2ppZSBZdWFuIDx4aWFvamllLnl1YW5AYW1kLmNvbT4KCnYyOiBwcmVmaXggc3Ry
dWN0IGFuZCBmdW5jdGlvbiBuYW1lcyB3aXRoICdhbWRncHUnCnYzOiByZWFkIHRhYmxlIGJpbmFy
eSBmcm9tIHZyYW0gdXNpbmcgbW1NTV9JTkRFWCBhbmQgbW1NTV9EQVRBCiAgICB1cGRhdGUgVEFC
TEVfQklOQVJZX01BWF9TSVpFIHRvIDY0a2IgKDEgVE1SKQogICAgYWRkICdpbnN0YW5jZV9udW1i
ZXInIGZpZWxkIHBlciBpcCBpbmZvCiAgICBjb25zaWRlciBlbmRpYW5uZXNzIGFuZCByZXBsYWNl
IHVpbnQ4LzE2LzMyX3Qgd2l0aCB1OC8xNi8zMgogICAgaW5pdGlhbGl6ZSByZWdpc3RlciBiYXNl
IGFkZHJlc3NlcwogICAgaW5pdGlhbGl6ZSBhZGV2LT5nZnguY29uZmlnIGFuZCBhZGV2LT5nZngu
Y3VfaW5mbyB0byByZXBsYWNlIGdwdSBpbmZvIGZ3CiAgICBnZXQgbWFqb3IgYW5kIG1pbm9yIHZl
cnNpb24gdXNpbmcgYSBzaW5nbGUgYXBpCiAgICBkb24ndCBleHBvc2UgaW50ZXJuYWwgZGF0YSBz
dHJ1Y3R1cmVzIGluIGFtZGdwdV9kaXNjb3ZlcnkuaAp2NDogUkNDX0NPTkZJR19NRU1TSVpFIGlz
IGluIE1CIHVuaXRzCiAgICBob2xkIG1taW9faWR4X2xvY2sgd2hpbGUgcmVhZGluZyBpcCBkaXNj
b3ZlcnkgYmluYXJ5CnY1OiBwaWNrIG91dCBkaXNjb3ZlcnkuaCBhcyBhIGNyb3NzLU9TIGhlYWRl
cgogICAgZG8gc3RydWN0dXJlIHBvaW50ZXIgY2FzdCBkaXJlY3RseQogICAgY29uc2lkZXIgZW5k
aWFubmVzcyB3aGlsZSB1c2luZyB0aGUgbWVtYmVyIG9mIHN0cnVjdHVyZQogICAgY29udmVydCBi
YXNlIGFkZHJlc3NlcyB0byBkd29yZAoKYXQgYm9vdCB1cCwgUFNQIEJMIGNvcGllcyBpcCBkaXNj
b3ZlcnkgYmluYXJ5IGZyb20gVkJJT1MoU1BJUk9NKSBpbWFnZSB0byB0aGUKdG9wIG9mIHRoZSBm
cmFtZSBidWZmZXIgKGp1c3QgYmVsb3cgdGhlIHJlc2VydmVkIHJlZ2lvbnMgZm9yIFBTUCAmIFNN
VSkuCgppcCBkaXNjb3ZlcnkgZGF0YSB0YWJsZSBpbmNsdWRlcyB0aGUgY29sbGVjdGlvbiBvZiBl
YWNoIGlwJ3MgaWRlbnRpZmljYXRpb24KbnVtYmVyLCBiYXNlIGFkZHJlc3NlcywgdmVyc2lvbiBu
dW1iZXIsIGFuZCBoYXJ2ZXN0IHNldHRpbmcgcGxhY2Vob2xkZXIuCgpnYyBkYXRhIHRhYmxlIGlu
Y2x1ZGVzIGdmeCBpbmZvIHN0cnVjdHVyZS4KClNpZ25lZC1vZmYtYnk6IFhpYW9qaWUgWXVhbiA8
eGlhb2ppZS55dWFuQGFtZC5jb20+ClJldmlld2VkLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRl
ci5kZXVjaGVyQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVy
LmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9NYWtlZmls
ZSAgICAgICAgICAgfCAgIDIgKy0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5o
ICAgICAgICAgICB8ICAgNCArCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGlz
Y292ZXJ5LmMgfCA0MDEgKysrKysrKysrKysrKysrKysrCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfZGlzY292ZXJ5LmggfCAgMzQgKysKIGRyaXZlcnMvZ3B1L2RybS9hbWQvaW5j
bHVkZS9kaXNjb3ZlcnkuaCAgICAgICB8IDE0NSArKysrKysrCiA1IGZpbGVzIGNoYW5nZWQsIDU4
NSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rpc2NvdmVyeS5jCiBjcmVhdGUgbW9kZSAxMDA2
NDQgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rpc2NvdmVyeS5oCiBjcmVhdGUg
bW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL2FtZC9pbmNsdWRlL2Rpc2NvdmVyeS5oCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvTWFrZWZpbGUgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9NYWtlZmlsZQppbmRleCBlNGFkM2ZmYjc0NmMuLmU2MmY3Y2RmODgy
MyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvTWFrZWZpbGUKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvTWFrZWZpbGUKQEAgLTU0LDcgKzU0LDcgQEAgYW1k
Z3B1LXkgKz0gYW1kZ3B1X2RldmljZS5vIGFtZGdwdV9rbXMubyBcCiAJYW1kZ3B1X2d0dF9tZ3Iu
byBhbWRncHVfdnJhbV9tZ3IubyBhbWRncHVfdmlydC5vIGFtZGdwdV9hdG9tZmlybXdhcmUubyBc
CiAJYW1kZ3B1X3ZmX2Vycm9yLm8gYW1kZ3B1X3NjaGVkLm8gYW1kZ3B1X2RlYnVnZnMubyBhbWRn
cHVfaWRzLm8gXAogCWFtZGdwdV9nbWMubyBhbWRncHVfeGdtaS5vIGFtZGdwdV9jc2EubyBhbWRn
cHVfcmFzLm8gYW1kZ3B1X3ZtX2NwdS5vIFwKLQlhbWRncHVfdm1fc2RtYS5vCisJYW1kZ3B1X3Zt
X3NkbWEubyBhbWRncHVfZGlzY292ZXJ5Lm8KIAogIyBhZGQgYXNpYyBzcGVjaWZpYyBibG9jawog
YW1kZ3B1LSQoQ09ORklHX0RSTV9BTURHUFVfQ0lLKSs9IGNpay5vIGNpa19paC5vIGt2X3NtYy5v
IGt2X2RwbS5vIFwKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dS5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1LmgKaW5kZXggZDQzODk4NjRj
NTFiLi4wMDBlZjJkZGRkN2UgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdS5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5oCkBAIC04
NCw2ICs4NCw3IEBACiAjaW5jbHVkZSAiYW1kZ3B1X2Rvb3JiZWxsLmgiCiAjaW5jbHVkZSAiYW1k
Z3B1X2FtZGtmZC5oIgogI2luY2x1ZGUgImFtZGdwdV9zbXUuaCIKKyNpbmNsdWRlICJhbWRncHVf
ZGlzY292ZXJ5LmgiCiAKICNkZWZpbmUgTUFYX0dQVV9JTlNUQU5DRQkJMTYKIApAQCAtOTE0LDYg
KzkxNSw5IEBAIHN0cnVjdCBhbWRncHVfZGV2aWNlIHsKIAkvKiBkaXNwbGF5IHJlbGF0ZWQgZnVu
Y3Rpb25hbGl0eSAqLwogCXN0cnVjdCBhbWRncHVfZGlzcGxheV9tYW5hZ2VyIGRtOwogCisJLyog
ZGlzY292ZXJ5ICovCisJdWludDhfdAkJCQkqZGlzY292ZXJ5OworCiAJc3RydWN0IGFtZGdwdV9p
cF9ibG9jayAgICAgICAgICBpcF9ibG9ja3NbQU1ER1BVX01BWF9JUF9OVU1dOwogCWludAkJCQlu
dW1faXBfYmxvY2tzOwogCXN0cnVjdCBtdXRleAltbl9sb2NrOwpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rpc2NvdmVyeS5jIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X2Rpc2NvdmVyeS5jCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4
IDAwMDAwMDAwMDAwMC4uN2I1ODI3M2UyZWQ1Ci0tLSAvZGV2L251bGwKKysrIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rpc2NvdmVyeS5jCkBAIC0wLDAgKzEsNDAxIEBACisv
KgorICogQ29weXJpZ2h0IDIwMTggQWR2YW5jZWQgTWljcm8gRGV2aWNlcywgSW5jLgorICoKKyAq
IFBlcm1pc3Npb24gaXMgaGVyZWJ5IGdyYW50ZWQsIGZyZWUgb2YgY2hhcmdlLCB0byBhbnkgcGVy
c29uIG9idGFpbmluZyBhCisgKiBjb3B5IG9mIHRoaXMgc29mdHdhcmUgYW5kIGFzc29jaWF0ZWQg
ZG9jdW1lbnRhdGlvbiBmaWxlcyAodGhlICJTb2Z0d2FyZSIpLAorICogdG8gZGVhbCBpbiB0aGUg
U29mdHdhcmUgd2l0aG91dCByZXN0cmljdGlvbiwgaW5jbHVkaW5nIHdpdGhvdXQgbGltaXRhdGlv
bgorICogdGhlIHJpZ2h0cyB0byB1c2UsIGNvcHksIG1vZGlmeSwgbWVyZ2UsIHB1Ymxpc2gsIGRp
c3RyaWJ1dGUsIHN1YmxpY2Vuc2UsCisgKiBhbmQvb3Igc2VsbCBjb3BpZXMgb2YgdGhlIFNvZnR3
YXJlLCBhbmQgdG8gcGVybWl0IHBlcnNvbnMgdG8gd2hvbSB0aGUKKyAqIFNvZnR3YXJlIGlzIGZ1
cm5pc2hlZCB0byBkbyBzbywgc3ViamVjdCB0byB0aGUgZm9sbG93aW5nIGNvbmRpdGlvbnM6Cisg
KgorICogVGhlIGFib3ZlIGNvcHlyaWdodCBub3RpY2UgYW5kIHRoaXMgcGVybWlzc2lvbiBub3Rp
Y2Ugc2hhbGwgYmUgaW5jbHVkZWQgaW4KKyAqIGFsbCBjb3BpZXMgb3Igc3Vic3RhbnRpYWwgcG9y
dGlvbnMgb2YgdGhlIFNvZnR3YXJlLgorICoKKyAqIFRIRSBTT0ZUV0FSRSBJUyBQUk9WSURFRCAi
QVMgSVMiLCBXSVRIT1VUIFdBUlJBTlRZIE9GIEFOWSBLSU5ELCBFWFBSRVNTIE9SCisgKiBJTVBM
SUVELCBJTkNMVURJTkcgQlVUIE5PVCBMSU1JVEVEIFRPIFRIRSBXQVJSQU5USUVTIE9GIE1FUkNI
QU5UQUJJTElUWSwKKyAqIEZJVE5FU1MgRk9SIEEgUEFSVElDVUxBUiBQVVJQT1NFIEFORCBOT05J
TkZSSU5HRU1FTlQuICBJTiBOTyBFVkVOVCBTSEFMTAorICogVEhFIENPUFlSSUdIVCBIT0xERVIo
UykgT1IgQVVUSE9SKFMpIEJFIExJQUJMRSBGT1IgQU5ZIENMQUlNLCBEQU1BR0VTIE9SCisgKiBP
VEhFUiBMSUFCSUxJVFksIFdIRVRIRVIgSU4gQU4gQUNUSU9OIE9GIENPTlRSQUNULCBUT1JUIE9S
IE9USEVSV0lTRSwKKyAqIEFSSVNJTkcgRlJPTSwgT1VUIE9GIE9SIElOIENPTk5FQ1RJT04gV0lU
SCBUSEUgU09GVFdBUkUgT1IgVEhFIFVTRSBPUgorICogT1RIRVIgREVBTElOR1MgSU4gVEhFIFNP
RlRXQVJFLgorICoKKyAqLworCisjaW5jbHVkZSAiYW1kZ3B1LmgiCisjaW5jbHVkZSAiYW1kZ3B1
X2Rpc2NvdmVyeS5oIgorI2luY2x1ZGUgInNvYzE1X2NvbW1vbi5oIgorI2luY2x1ZGUgInNvYzE1
X2h3X2lwLmgiCisjaW5jbHVkZSAibmJpby9uYmlvXzJfM19vZmZzZXQuaCIKKyNpbmNsdWRlICJk
aXNjb3ZlcnkuaCIKKworI2RlZmluZSBtbU1NX0lOREVYCTB4MAorI2RlZmluZSBtbU1NX0lOREVY
X0hJCTB4NgorI2RlZmluZSBtbU1NX0RBVEEJMHgxCisjZGVmaW5lIEhXX0lEX01BWAkzMDAKKwor
Y29uc3QgY2hhciAqaHdfaWRfbmFtZXNbSFdfSURfTUFYXSA9IHsKKwlbTVAxX0hXSURdCQk9ICJN
UDEiLAorCVtNUDJfSFdJRF0JCT0gIk1QMiIsCisJW1RITV9IV0lEXQkJPSAiVEhNIiwKKwlbU01V
SU9fSFdJRF0JCT0gIlNNVUlPIiwKKwlbRlVTRV9IV0lEXQkJPSAiRlVTRSIsCisJW0NMS0FfSFdJ
RF0JCT0gIkNMS0EiLAorCVtQV1JfSFdJRF0JCT0gIlBXUiIsCisJW0dDX0hXSURdCQk9ICJHQyIs
CisJW1VWRF9IV0lEXQkJPSAiVVZEIiwKKwlbQVVESU9fQVpfSFdJRF0JCT0gIkFVRElPX0FaIiwK
KwlbQUNQX0hXSURdCQk9ICJBQ1AiLAorCVtEQ0lfSFdJRF0JCT0gIkRDSSIsCisJW0RNVV9IV0lE
XQkJPSAiRE1VIiwKKwlbRENPX0hXSURdCQk9ICJEQ08iLAorCVtESU9fSFdJRF0JCT0gIkRJTyIs
CisJW1hETUFfSFdJRF0JCT0gIlhETUEiLAorCVtEQ0VBWl9IV0lEXQkJPSAiRENFQVoiLAorCVtE
QVpfSFdJRF0JCT0gIkRBWiIsCisJW1NEUE1VWF9IV0lEXQkJPSAiU0RQTVVYIiwKKwlbTlRCX0hX
SURdCQk9ICJOVEIiLAorCVtJT0hDX0hXSURdCQk9ICJJT0hDIiwKKwlbTDJJTVVfSFdJRF0JCT0g
IkwySU1VIiwKKwlbVkNFX0hXSURdCQk9ICJWQ0UiLAorCVtNTUhVQl9IV0lEXQkJPSAiTU1IVUIi
LAorCVtBVEhVQl9IV0lEXQkJPSAiQVRIVUIiLAorCVtEQkdVX05CSU9fSFdJRF0JPSAiREJHVV9O
QklPIiwKKwlbREZYX0hXSURdCQk9ICJERlgiLAorCVtEQkdVMF9IV0lEXQkJPSAiREJHVTAiLAor
CVtEQkdVMV9IV0lEXQkJPSAiREJHVTEiLAorCVtPU1NTWVNfSFdJRF0JCT0gIk9TU1NZUyIsCisJ
W0hEUF9IV0lEXQkJPSAiSERQIiwKKwlbU0RNQTBfSFdJRF0JCT0gIlNETUEwIiwKKwlbU0RNQTFf
SFdJRF0JCT0gIlNETUExIiwKKwlbSVNQX0hXSURdCQk9ICJJU1AiLAorCVtEQkdVX0lPX0hXSURd
CQk9ICJEQkdVX0lPIiwKKwlbREZfSFdJRF0JCT0gIkRGIiwKKwlbQ0xLQl9IV0lEXQkJPSAiQ0xL
QiIsCisJW0ZDSF9IV0lEXQkJPSAiRkNIIiwKKwlbREZYX0RBUF9IV0lEXQkJPSAiREZYX0RBUCIs
CisJW0wxSU1VX1BDSUVfSFdJRF0JPSAiTDFJTVVfUENJRSIsCisJW0wxSU1VX05CSUZfSFdJRF0J
PSAiTDFJTVVfTkJJRiIsCisJW0wxSU1VX0lPQUdSX0hXSURdCT0gIkwxSU1VX0lPQUdSIiwKKwlb
TDFJTVUzX0hXSURdCQk9ICJMMUlNVTMiLAorCVtMMUlNVTRfSFdJRF0JCT0gIkwxSU1VNCIsCisJ
W0wxSU1VNV9IV0lEXQkJPSAiTDFJTVU1IiwKKwlbTDFJTVU2X0hXSURdCQk9ICJMMUlNVTYiLAor
CVtMMUlNVTdfSFdJRF0JCT0gIkwxSU1VNyIsCisJW0wxSU1VOF9IV0lEXQkJPSAiTDFJTVU4IiwK
KwlbTDFJTVU5X0hXSURdCQk9ICJMMUlNVTkiLAorCVtMMUlNVTEwX0hXSURdCQk9ICJMMUlNVTEw
IiwKKwlbTDFJTVUxMV9IV0lEXQkJPSAiTDFJTVUxMSIsCisJW0wxSU1VMTJfSFdJRF0JCT0gIkwx
SU1VMTIiLAorCVtMMUlNVTEzX0hXSURdCQk9ICJMMUlNVTEzIiwKKwlbTDFJTVUxNF9IV0lEXQkJ
PSAiTDFJTVUxNCIsCisJW0wxSU1VMTVfSFdJRF0JCT0gIkwxSU1VMTUiLAorCVtXQUZMQ19IV0lE
XQkJPSAiV0FGTEMiLAorCVtGQ0hfVVNCX1BEX0hXSURdCT0gIkZDSF9VU0JfUEQiLAorCVtQQ0lF
X0hXSURdCQk9ICJQQ0lFIiwKKwlbUENTX0hXSURdCQk9ICJQQ1MiLAorCVtERENMX0hXSURdCQk9
ICJERENMIiwKKwlbU1NUX0hXSURdCQk9ICJTU1QiLAorCVtJT0FHUl9IV0lEXQkJPSAiSU9BR1Ii
LAorCVtOQklGX0hXSURdCQk9ICJOQklGIiwKKwlbSU9BUElDX0hXSURdCQk9ICJJT0FQSUMiLAor
CVtTWVNURU1IVUJfSFdJRF0JPSAiU1lTVEVNSFVCIiwKKwlbTlRCQ0NQX0hXSURdCQk9ICJOVEJD
Q1AiLAorCVtVTUNfSFdJRF0JCT0gIlVNQyIsCisJW1NBVEFfSFdJRF0JCT0gIlNBVEEiLAorCVtV
U0JfSFdJRF0JCT0gIlVTQiIsCisJW0NDWFNFQ19IV0lEXQkJPSAiQ0NYU0VDIiwKKwlbWEdNSV9I
V0lEXQkJPSAiWEdNSSIsCisJW1hHQkVfSFdJRF0JCT0gIlhHQkUiLAorCVtNUDBfSFdJRF0JCT0g
Ik1QMCIsCit9OworCitzdGF0aWMgaW50IGh3X2lkX21hcFtNQVhfSFdJUF0gPSB7CisJW0dDX0hX
SVBdCT0gR0NfSFdJRCwKKwlbSERQX0hXSVBdCT0gSERQX0hXSUQsCisJW1NETUEwX0hXSVBdCT0g
U0RNQTBfSFdJRCwKKwlbU0RNQTFfSFdJUF0JPSBTRE1BMV9IV0lELAorCVtNTUhVQl9IV0lQXQk9
IE1NSFVCX0hXSUQsCisJW0FUSFVCX0hXSVBdCT0gQVRIVUJfSFdJRCwKKwlbTkJJT19IV0lQXQk9
IERCR1VfTkJJT19IV0lELAorCVtNUDBfSFdJUF0JPSBNUDBfSFdJRCwKKwlbTVAxX0hXSVBdCT0g
TVAxX0hXSUQsCisJW1VWRF9IV0lQXQk9IFVWRF9IV0lELAorCVtWQ0VfSFdJUF0JPSBWQ0VfSFdJ
RCwKKwlbREZfSFdJUF0JPSBERl9IV0lELAorCVtEQ0VfSFdJUF0JPSBEQ0VBWl9IV0lELAorCVtP
U1NTWVNfSFdJUF0JPSBPU1NTWVNfSFdJRCwKKwlbU01VSU9fSFdJUF0JPSBTTVVJT19IV0lELAor
CVtQV1JfSFdJUF0JPSBQV1JfSFdJRCwKKwlbTkJJRl9IV0lQXQk9IE5CSUZfSFdJRCwKKwlbVEhN
X0hXSVBdCT0gVEhNX0hXSUQsCisJW0NMS19IV0lQXQk9IENMS0FfSFdJRCwKK307CisKK3N0YXRp
YyBpbnQgYW1kZ3B1X2Rpc2NvdmVyeV9yZWFkX2JpbmFyeShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAq
YWRldiwgdWludDhfdCAqYmluYXJ5KQoreworCXVpbnQzMl90ICpwID0gKHVpbnQzMl90ICopYmlu
YXJ5OworCXVpbnQ2NF90IHZyYW1fc2l6ZSA9IFJSRUczMl9TT0MxNShOQklPLCAwLAorCQkJbW1S
Q0NfREVWMF9FUEYwX1JDQ19DT05GSUdfTUVNU0laRSkgKiAxMDI0ICogMTAyNDsKKwl1aW50NjRf
dCBwb3MgPSB2cmFtX3NpemUgLSBCSU5BUllfTUFYX1NJWkU7CisJdW5zaWduZWQgbG9uZyBmbGFn
czsKKworCXdoaWxlIChwb3MgPCB2cmFtX3NpemUpIHsKKwkJc3Bpbl9sb2NrX2lycXNhdmUoJmFk
ZXYtPm1taW9faWR4X2xvY2ssIGZsYWdzKTsKKwkJV1JFRzMyX05PX0tJUShtbU1NX0lOREVYLCAo
KHVpbnQzMl90KXBvcykgfCAweDgwMDAwMDAwKTsKKwkJV1JFRzMyX05PX0tJUShtbU1NX0lOREVY
X0hJLCBwb3MgPj4gMzEpOworCQkqcCsrID0gUlJFRzMyX05PX0tJUShtbU1NX0RBVEEpOworCQlz
cGluX3VubG9ja19pcnFyZXN0b3JlKCZhZGV2LT5tbWlvX2lkeF9sb2NrLCBmbGFncyk7CisJCXBv
cyArPSA0OworCX0KKworCXJldHVybiAwOworfQorCitzdGF0aWMgdWludDE2X3QgYW1kZ3B1X2Rp
c2NvdmVyeV9jYWxjdWxhdGVfY2hlY2tzdW0odWludDhfdCAqZGF0YSwgdWludDMyX3Qgc2l6ZSkK
K3sKKwl1aW50MTZfdCBjaGVja3N1bSA9IDA7CisJaW50IGk7CisKKwlmb3IgKGkgPSAwOyBpIDwg
c2l6ZTsgaSsrKQorCQljaGVja3N1bSArPSBkYXRhW2ldOworCisJcmV0dXJuIGNoZWNrc3VtOwor
fQorCitzdGF0aWMgaW5saW5lIGJvb2wgYW1kZ3B1X2Rpc2NvdmVyeV92ZXJpZnlfY2hlY2tzdW0o
dWludDhfdCAqZGF0YSwgdWludDMyX3Qgc2l6ZSwKKwkJCQkJCSAgICB1aW50MTZfdCBleHBlY3Rl
ZCkKK3sKKwlyZXR1cm4gISEoYW1kZ3B1X2Rpc2NvdmVyeV9jYWxjdWxhdGVfY2hlY2tzdW0oZGF0
YSwgc2l6ZSkgPT0gZXhwZWN0ZWQpOworfQorCitpbnQgYW1kZ3B1X2Rpc2NvdmVyeV9pbml0KHN0
cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQoreworCXN0cnVjdCB0YWJsZV9pbmZvICppbmZvOwor
CXN0cnVjdCBiaW5hcnlfaGVhZGVyICpiaGRyOworCXN0cnVjdCBpcF9kaXNjb3ZlcnlfaGVhZGVy
ICppaGRyOworCXN0cnVjdCBncHVfaW5mb19oZWFkZXIgKmdoZHI7CisJdWludDE2X3Qgb2Zmc2V0
OworCXVpbnQxNl90IHNpemU7CisJdWludDE2X3QgY2hlY2tzdW07CisJaW50IHI7CisKKwlhZGV2
LT5kaXNjb3ZlcnkgPSBremFsbG9jKEJJTkFSWV9NQVhfU0laRSwgR0ZQX0tFUk5FTCk7CisJaWYg
KCFhZGV2LT5kaXNjb3ZlcnkpCisJCXJldHVybiAtRU5PTUVNOworCisJciA9IGFtZGdwdV9kaXNj
b3ZlcnlfcmVhZF9iaW5hcnkoYWRldiwgYWRldi0+ZGlzY292ZXJ5KTsKKwlpZiAocikgeworCQlE
Uk1fRVJST1IoImZhaWxlZCB0byByZWFkIGlwIGRpc2NvdmVyeSBiaW5hcnlcbiIpOworCQlnb3Rv
IG91dDsKKwl9CisKKwliaGRyID0gKHN0cnVjdCBiaW5hcnlfaGVhZGVyICopKGFkZXYtPmRpc2Nv
dmVyeSArIFBTUF9IRUFERVJfU0laRSk7CisKKwlpZiAobGUzMl90b19jcHUoYmhkci0+YmluYXJ5
X3NpZ25hdHVyZSkgIT0gQklOQVJZX1NJR05BVFVSRSkgeworCQlEUk1fRVJST1IoImludmFsaWQg
aXAgZGlzY292ZXJ5IGJpbmFyeSBzaWduYXR1cmVcbiIpOworCQlyID0gLUVJTlZBTDsKKwkJZ290
byBvdXQ7CisJfQorCisJb2Zmc2V0ID0gUFNQX0hFQURFUl9TSVpFICsKKwkJb2Zmc2V0b2Yoc3Ry
dWN0IGJpbmFyeV9oZWFkZXIsIGJpbmFyeV9jaGVja3N1bSkgKworCQlzaXplb2YoYmhkci0+Ymlu
YXJ5X2NoZWNrc3VtKTsKKwlzaXplID0gYmhkci0+YmluYXJ5X3NpemUgLSBvZmZzZXQ7CisJY2hl
Y2tzdW0gPSBiaGRyLT5iaW5hcnlfY2hlY2tzdW07CisKKwlpZiAoIWFtZGdwdV9kaXNjb3Zlcnlf
dmVyaWZ5X2NoZWNrc3VtKGFkZXYtPmRpc2NvdmVyeSArIG9mZnNldCwKKwkJCQkJICAgICAgc2l6
ZSwgY2hlY2tzdW0pKSB7CisJCURSTV9FUlJPUigiaW52YWxpZCBpcCBkaXNjb3ZlcnkgYmluYXJ5
IGNoZWNrc3VtXG4iKTsKKwkJciA9IC1FSU5WQUw7CisJCWdvdG8gb3V0OworCX0KKworCWluZm8g
PSAmYmhkci0+dGFibGVfbGlzdFtJUF9ESVNDT1ZFUlldOworCW9mZnNldCA9IGxlMTZfdG9fY3B1
KGluZm8tPm9mZnNldCk7CisJY2hlY2tzdW0gPSBsZTE2X3RvX2NwdShpbmZvLT5jaGVja3N1bSk7
CisJaWhkciA9IChzdHJ1Y3QgaXBfZGlzY292ZXJ5X2hlYWRlciAqKShhZGV2LT5kaXNjb3Zlcnkg
KyBvZmZzZXQpOworCisJaWYgKGxlMzJfdG9fY3B1KGloZHItPnNpZ25hdHVyZSkgIT0gRElTQ09W
RVJZX1RBQkxFX1NJR05BVFVSRSkgeworCQlEUk1fRVJST1IoImludmFsaWQgaXAgZGlzY292ZXJ5
IGRhdGEgdGFibGUgc2lnbmF0dXJlXG4iKTsKKwkJciA9IC1FSU5WQUw7CisJCWdvdG8gb3V0Owor
CX0KKworCWlmICghYW1kZ3B1X2Rpc2NvdmVyeV92ZXJpZnlfY2hlY2tzdW0oYWRldi0+ZGlzY292
ZXJ5ICsgb2Zmc2V0LAorCQkJCQkgICAgICBpaGRyLT5zaXplLCBjaGVja3N1bSkpIHsKKwkJRFJN
X0VSUk9SKCJpbnZhbGlkIGlwIGRpc2NvdmVyeSBkYXRhIHRhYmxlIGNoZWNrc3VtXG4iKTsKKwkJ
ciA9IC1FSU5WQUw7CisJCWdvdG8gb3V0OworCX0KKworCWluZm8gPSAmYmhkci0+dGFibGVfbGlz
dFtHQ107CisJb2Zmc2V0ID0gbGUxNl90b19jcHUoaW5mby0+b2Zmc2V0KTsKKwljaGVja3N1bSA9
IGxlMTZfdG9fY3B1KGluZm8tPmNoZWNrc3VtKTsKKwlnaGRyID0gKHN0cnVjdCBncHVfaW5mb19o
ZWFkZXIgKikoYWRldi0+ZGlzY292ZXJ5ICsgb2Zmc2V0KTsKKworCWlmICghYW1kZ3B1X2Rpc2Nv
dmVyeV92ZXJpZnlfY2hlY2tzdW0oYWRldi0+ZGlzY292ZXJ5ICsgb2Zmc2V0LAorCQkJCSAgICAg
ICAgICAgICAgZ2hkci0+c2l6ZSwgY2hlY2tzdW0pKSB7CisJCURSTV9FUlJPUigiaW52YWxpZCBn
YyBkYXRhIHRhYmxlIGNoZWNrc3VtXG4iKTsKKwkJciA9IC1FSU5WQUw7CisJCWdvdG8gb3V0Owor
CX0KKworCXJldHVybiAwOworCitvdXQ6CisJa2ZyZWUoYWRldi0+ZGlzY292ZXJ5KTsKKwlhZGV2
LT5kaXNjb3ZlcnkgPSBOVUxMOworCisJcmV0dXJuIHI7Cit9CisKK3ZvaWQgYW1kZ3B1X2Rpc2Nv
dmVyeV9maW5pKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQoreworCWtmcmVlKGFkZXYtPmRp
c2NvdmVyeSk7CisJYWRldi0+ZGlzY292ZXJ5ID0gTlVMTDsKK30KKworaW50IGFtZGdwdV9kaXNj
b3ZlcnlfcmVnX2Jhc2VfaW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKK3sKKwlzdHJ1
Y3QgYmluYXJ5X2hlYWRlciAqYmhkcjsKKwlzdHJ1Y3QgaXBfZGlzY292ZXJ5X2hlYWRlciAqaWhk
cjsKKwlzdHJ1Y3QgZGllX2hlYWRlciAqZGhkcjsKKwlzdHJ1Y3QgaXAgKmlwOworCXVpbnQxNl90
IGRpZV9vZmZzZXQ7CisJdWludDE2X3QgaXBfb2Zmc2V0OworCXVpbnQxNl90IG51bV9kaWVzOwor
CXVpbnQxNl90IG51bV9pcHM7CisJdWludDhfdCBudW1fYmFzZV9hZGRyZXNzOworCWludCBod19p
cDsKKwlpbnQgaHdfaWQ7CisJaW50IGksIGosIGs7CisKKwlpZiAoIWFkZXYtPmRpc2NvdmVyeSkg
eworCQlEUk1fRVJST1IoImlwIGRpc2NvdmVyeSB1bmluaXRpYWxpemVkXG4iKTsKKwkJcmV0dXJu
IC1FSU5WQUw7CisJfQorCisJYmhkciA9IChzdHJ1Y3QgYmluYXJ5X2hlYWRlciAqKShhZGV2LT5k
aXNjb3ZlcnkgKyBQU1BfSEVBREVSX1NJWkUpOworCWloZHIgPSAoc3RydWN0IGlwX2Rpc2NvdmVy
eV9oZWFkZXIgKikoYWRldi0+ZGlzY292ZXJ5ICsKKwkJCWxlMTZfdG9fY3B1KGJoZHItPnRhYmxl
X2xpc3RbSVBfRElTQ09WRVJZXS5vZmZzZXQpKTsKKwludW1fZGllcyA9IGxlMTZfdG9fY3B1KGlo
ZHItPm51bV9kaWVzKTsKKworCWZvciAoaHdfaXAgPSAwOyBod19pcCA8IE1BWF9IV0lQOyBod19p
cCsrKSB7CisJCWh3X2lkID0gaHdfaWRfbWFwW2h3X2lwXTsKKworCQlmb3IgKGkgPSAwOyBpIDwg
bnVtX2RpZXM7IGkrKykgeworCQkJZGllX29mZnNldCA9IGxlMTZfdG9fY3B1KGloZHItPmRpZV9p
bmZvW2ldLmRpZV9vZmZzZXQpOworCQkJZGhkciA9IChzdHJ1Y3QgZGllX2hlYWRlciAqKShhZGV2
LT5kaXNjb3ZlcnkgKyBkaWVfb2Zmc2V0KTsKKwkJCW51bV9pcHMgPSBsZTE2X3RvX2NwdShkaGRy
LT5udW1faXBzKTsKKwkJCWlwX29mZnNldCA9IGRpZV9vZmZzZXQgKyBzaXplb2YoKmRoZHIpOwor
CisJCQlmb3IgKGogPSAwOyBqIDwgbnVtX2lwczsgaisrKSB7CisJCQkJaXAgPSAoc3RydWN0IGlw
ICopKGFkZXYtPmRpc2NvdmVyeSArIGlwX29mZnNldCk7CisJCQkJbnVtX2Jhc2VfYWRkcmVzcyA9
IGlwLT5udW1fYmFzZV9hZGRyZXNzOworCisJCQkJaWYgKGxlMTZfdG9fY3B1KGlwLT5od19pZCkg
PT0gaHdfaWQpIHsKKwkJCQkJRFJNX0RFQlVHKCIlcyglZCkgdiVkLiVkLiVkOlxuIiwKKwkJCQkJ
CSAgaHdfaWRfbmFtZXNbaHdfaWRdLCBod19pZCwKKwkJCQkJCSAgaXAtPm1ham9yLCBpcC0+bWlu
b3IsCisJCQkJCQkgIGlwLT5yZXZpc2lvbik7CisKKwkJCQkJZm9yIChrID0gMDsgayA8IG51bV9i
YXNlX2FkZHJlc3M7IGsrKykgeworCQkJCQkJLyoKKwkJCQkJCSAqIGNvbnZlcnQgdGhlIGVuZGlh
bm5lc3MgYW5kIHVuaXQgKGluIGR3b3JkKSBvZiBiYXNlIGFkZHJlc3NlcyBpbiBwbGFjZSwKKwkJ
CQkJCSAqIHNvIHRoYXQgd2UgZG9uJ3QgbmVlZCB0byBjb252ZXJ0IHRoZW0gd2hlbiBhY2Nlc3Np
bmcgYWRldi0+cmVnX29mZnNldC4KKwkJCQkJCSAqLworCQkJCQkJaXAtPmJhc2VfYWRkcmVzc1tr
XSA9IGxlMzJfdG9fY3B1KGlwLT5iYXNlX2FkZHJlc3Nba10pID4+IDI7CisJCQkJCQlEUk1fREVC
VUcoIlx0MHglMDh4XG4iLCBpcC0+YmFzZV9hZGRyZXNzW2tdIDw8IDIpOworCQkJCQl9CisKKwkJ
CQkJYWRldi0+cmVnX29mZnNldFtod19pcF1baXAtPm51bWJlcl9pbnN0YW5jZV0gPQorCQkJCQkJ
aXAtPmJhc2VfYWRkcmVzczsKKwkJCQl9CisKKwkJCQlpcF9vZmZzZXQgKz0gc2l6ZW9mKCppcCkg
KyA0ICogKGlwLT5udW1fYmFzZV9hZGRyZXNzIC0gMSk7CisJCQl9CisJCX0KKwl9CisKKwlyZXR1
cm4gMDsKK30KKworaW50IGFtZGdwdV9kaXNjb3ZlcnlfZ2V0X2lwX3ZlcnNpb24oc3RydWN0IGFt
ZGdwdV9kZXZpY2UgKmFkZXYsIGludCBod19pZCwKKwkJCQkgICAgaW50ICptYWpvciwgaW50ICpt
aW5vcikKK3sKKwlzdHJ1Y3QgYmluYXJ5X2hlYWRlciAqYmhkcjsKKwlzdHJ1Y3QgaXBfZGlzY292
ZXJ5X2hlYWRlciAqaWhkcjsKKwlzdHJ1Y3QgZGllX2hlYWRlciAqZGhkcjsKKwlzdHJ1Y3QgaXAg
KmlwOworCXVpbnQxNl90IGRpZV9vZmZzZXQ7CisJdWludDE2X3QgaXBfb2Zmc2V0OworCXVpbnQx
Nl90IG51bV9kaWVzOworCXVpbnQxNl90IG51bV9pcHM7CisJaW50IGksIGo7CisKKwlpZiAoIWFk
ZXYtPmRpc2NvdmVyeSkgeworCQlEUk1fRVJST1IoImlwIGRpc2NvdmVyeSB1bmluaXRpYWxpemVk
XG4iKTsKKwkJcmV0dXJuIC1FSU5WQUw7CisJfQorCisJYmhkciA9IChzdHJ1Y3QgYmluYXJ5X2hl
YWRlciAqKShhZGV2LT5kaXNjb3ZlcnkgKyBQU1BfSEVBREVSX1NJWkUpOworCWloZHIgPSAoc3Ry
dWN0IGlwX2Rpc2NvdmVyeV9oZWFkZXIgKikoYWRldi0+ZGlzY292ZXJ5ICsKKwkJCWxlMTZfdG9f
Y3B1KGJoZHItPnRhYmxlX2xpc3RbSVBfRElTQ09WRVJZXS5vZmZzZXQpKTsKKwludW1fZGllcyA9
IGxlMTZfdG9fY3B1KGloZHItPm51bV9kaWVzKTsKKworCWZvciAoaSA9IDA7IGkgPCBudW1fZGll
czsgaSsrKSB7CisJCWRpZV9vZmZzZXQgPSBsZTE2X3RvX2NwdShpaGRyLT5kaWVfaW5mb1tpXS5k
aWVfb2Zmc2V0KTsKKwkJZGhkciA9IChzdHJ1Y3QgZGllX2hlYWRlciAqKShhZGV2LT5kaXNjb3Zl
cnkgKyBkaWVfb2Zmc2V0KTsKKwkJbnVtX2lwcyA9IGxlMTZfdG9fY3B1KGRoZHItPm51bV9pcHMp
OworCQlpcF9vZmZzZXQgPSBkaWVfb2Zmc2V0ICsgc2l6ZW9mKCpkaGRyKTsKKworCQlmb3IgKGog
PSAwOyBqIDwgbnVtX2lwczsgaisrKSB7CisJCQlpcCA9IChzdHJ1Y3QgaXAgKikoYWRldi0+ZGlz
Y292ZXJ5ICsgaXBfb2Zmc2V0KTsKKworCQkJaWYgKGxlMTZfdG9fY3B1KGlwLT5od19pZCkgPT0g
aHdfaWQpIHsKKwkJCQlpZiAobWFqb3IpCisJCQkJCSptYWpvciA9IGlwLT5tYWpvcjsKKwkJCQlp
ZiAobWlub3IpCisJCQkJCSptaW5vciA9IGlwLT5taW5vcjsKKwkJCQlyZXR1cm4gMDsKKwkJCX0K
KwkJCWlwX29mZnNldCArPSBzaXplb2YoKmlwKSArIDQgKiAoaXAtPm51bV9iYXNlX2FkZHJlc3Mg
LSAxKTsKKwkJfQorCX0KKworCXJldHVybiAtRUlOVkFMOworfQorCitpbnQgYW1kZ3B1X2Rpc2Nv
dmVyeV9nZXRfZ2Z4X2luZm8oc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCit7CisJc3RydWN0
IGJpbmFyeV9oZWFkZXIgKmJoZHI7CisJc3RydWN0IGdjX2luZm9fdjFfMCAqZ2NfaW5mbzsKKwor
CWlmICghYWRldi0+ZGlzY292ZXJ5KSB7CisJCURSTV9FUlJPUigiaXAgZGlzY292ZXJ5IHVuaW5p
dGlhbGl6ZWRcbiIpOworCQlyZXR1cm4gLUVJTlZBTDsKKwl9CisKKwliaGRyID0gKHN0cnVjdCBi
aW5hcnlfaGVhZGVyICopKGFkZXYtPmRpc2NvdmVyeSArIFBTUF9IRUFERVJfU0laRSk7CisJZ2Nf
aW5mbyA9IChzdHJ1Y3QgZ2NfaW5mb192MV8wICopKGFkZXYtPmRpc2NvdmVyeSArCisJCQlsZTE2
X3RvX2NwdShiaGRyLT50YWJsZV9saXN0W0dDXS5vZmZzZXQpKTsKKworCWFkZXYtPmdmeC5jb25m
aWcubWF4X3NoYWRlcl9lbmdpbmVzID0gbGUzMl90b19jcHUoZ2NfaW5mby0+Z2NfbnVtX3NlKTsK
KwlhZGV2LT5nZnguY29uZmlnLm1heF9jdV9wZXJfc2ggPSBsZTMyX3RvX2NwdShnY19pbmZvLT5n
Y19udW1fd2dwMF9wZXJfc2EpOworCWFkZXYtPmdmeC5jb25maWcubWF4X3NoX3Blcl9zZSA9IGxl
MzJfdG9fY3B1KGdjX2luZm8tPmdjX251bV93Z3AxX3Blcl9zYSk7CisJYWRldi0+Z2Z4LmNvbmZp
Zy5tYXhfYmFja2VuZHNfcGVyX3NlID0gbGUzMl90b19jcHUoZ2NfaW5mby0+Z2NfbnVtX3JiX3Bl
cl9zZSk7CisJYWRldi0+Z2Z4LmNvbmZpZy5tYXhfdGV4dHVyZV9jaGFubmVsX2NhY2hlcyA9IGxl
MzJfdG9fY3B1KGdjX2luZm8tPmdjX251bV9nbDJjKTsKKwlhZGV2LT5nZnguY29uZmlnLm1heF9n
cHJzID0gbGUzMl90b19jcHUoZ2NfaW5mby0+Z2NfbnVtX2dwcnMpOworCWFkZXYtPmdmeC5jb25m
aWcubWF4X2dzX3RocmVhZHMgPSBsZTMyX3RvX2NwdShnY19pbmZvLT5nY19udW1fbWF4X2dzX3Ro
ZHMpOworCWFkZXYtPmdmeC5jb25maWcuZ3Nfdmd0X3RhYmxlX2RlcHRoID0gbGUzMl90b19jcHUo
Z2NfaW5mby0+Z2NfZ3NfdGFibGVfZGVwdGgpOworCWFkZXYtPmdmeC5jb25maWcuZ3NfcHJpbV9i
dWZmZXJfZGVwdGggPSBsZTMyX3RvX2NwdShnY19pbmZvLT5nY19nc3ByaW1fYnVmZl9kZXB0aCk7
CisJYWRldi0+Z2Z4LmNvbmZpZy5kb3VibGVfb2ZmY2hpcF9sZHNfYnVmID0gbGUzMl90b19jcHUo
Z2NfaW5mby0+Z2NfZG91YmxlX29mZmNoaXBfbGRzX2J1ZmZlcik7CisJYWRldi0+Z2Z4LmN1X2lu
Zm8ud2F2ZV9mcm9udF9zaXplID0gbGUzMl90b19jcHUoZ2NfaW5mby0+Z2Nfd2F2ZV9zaXplKTsK
KwlhZGV2LT5nZnguY3VfaW5mby5tYXhfd2F2ZXNfcGVyX3NpbWQgPSBsZTMyX3RvX2NwdShnY19p
bmZvLT5nY19tYXhfd2F2ZXNfcGVyX3NpbWQpOworCWFkZXYtPmdmeC5jdV9pbmZvLm1heF9zY3Jh
dGNoX3Nsb3RzX3Blcl9jdSA9IGxlMzJfdG9fY3B1KGdjX2luZm8tPmdjX21heF9zY3JhdGNoX3Ns
b3RzX3Blcl9jdSk7CisJYWRldi0+Z2Z4LmN1X2luZm8ubGRzX3NpemUgPSBsZTMyX3RvX2NwdShn
Y19pbmZvLT5nY19sZHNfc2l6ZSk7CisJYWRldi0+Z2Z4LmNvbmZpZy5udW1fc2NfcGVyX3NoID0g
bGUzMl90b19jcHUoZ2NfaW5mby0+Z2NfbnVtX3NjX3Blcl9zZSk7CisJYWRldi0+Z2Z4LmNvbmZp
Zy5udW1fcGFja2VyX3Blcl9zYyA9IGxlMzJfdG9fY3B1KGdjX2luZm8tPmdjX251bV9zYV9wZXJf
c2UpOworCisJcmV0dXJuIDA7Cit9CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfZGlzY292ZXJ5LmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfZGlzY292ZXJ5LmgKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMDAwLi44
NWI4YzRkNGQ1NzYKLS0tIC9kZXYvbnVsbAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfZGlzY292ZXJ5LmgKQEAgLTAsMCArMSwzNCBAQAorLyoKKyAqIENvcHlyaWdodCAy
MDE4IEFkdmFuY2VkIE1pY3JvIERldmljZXMsIEluYy4KKyAqCisgKiBQZXJtaXNzaW9uIGlzIGhl
cmVieSBncmFudGVkLCBmcmVlIG9mIGNoYXJnZSwgdG8gYW55IHBlcnNvbiBvYnRhaW5pbmcgYQor
ICogY29weSBvZiB0aGlzIHNvZnR3YXJlIGFuZCBhc3NvY2lhdGVkIGRvY3VtZW50YXRpb24gZmls
ZXMgKHRoZSAiU29mdHdhcmUiKSwKKyAqIHRvIGRlYWwgaW4gdGhlIFNvZnR3YXJlIHdpdGhvdXQg
cmVzdHJpY3Rpb24sIGluY2x1ZGluZyB3aXRob3V0IGxpbWl0YXRpb24KKyAqIHRoZSByaWdodHMg
dG8gdXNlLCBjb3B5LCBtb2RpZnksIG1lcmdlLCBwdWJsaXNoLCBkaXN0cmlidXRlLCBzdWJsaWNl
bnNlLAorICogYW5kL29yIHNlbGwgY29waWVzIG9mIHRoZSBTb2Z0d2FyZSwgYW5kIHRvIHBlcm1p
dCBwZXJzb25zIHRvIHdob20gdGhlCisgKiBTb2Z0d2FyZSBpcyBmdXJuaXNoZWQgdG8gZG8gc28s
IHN1YmplY3QgdG8gdGhlIGZvbGxvd2luZyBjb25kaXRpb25zOgorICoKKyAqIFRoZSBhYm92ZSBj
b3B5cmlnaHQgbm90aWNlIGFuZCB0aGlzIHBlcm1pc3Npb24gbm90aWNlIHNoYWxsIGJlIGluY2x1
ZGVkIGluCisgKiBhbGwgY29waWVzIG9yIHN1YnN0YW50aWFsIHBvcnRpb25zIG9mIHRoZSBTb2Z0
d2FyZS4KKyAqCisgKiBUSEUgU09GVFdBUkUgSVMgUFJPVklERUQgIkFTIElTIiwgV0lUSE9VVCBX
QVJSQU5UWSBPRiBBTlkgS0lORCwgRVhQUkVTUyBPUgorICogSU1QTElFRCwgSU5DTFVESU5HIEJV
VCBOT1QgTElNSVRFRCBUTyBUSEUgV0FSUkFOVElFUyBPRiBNRVJDSEFOVEFCSUxJVFksCisgKiBG
SVRORVNTIEZPUiBBIFBBUlRJQ1VMQVIgUFVSUE9TRSBBTkQgTk9OSU5GUklOR0VNRU5ULiAgSU4g
Tk8gRVZFTlQgU0hBTEwKKyAqIFRIRSBDT1BZUklHSFQgSE9MREVSKFMpIE9SIEFVVEhPUihTKSBC
RSBMSUFCTEUgRk9SIEFOWSBDTEFJTSwgREFNQUdFUyBPUgorICogT1RIRVIgTElBQklMSVRZLCBX
SEVUSEVSIElOIEFOIEFDVElPTiBPRiBDT05UUkFDVCwgVE9SVCBPUiBPVEhFUldJU0UsCisgKiBB
UklTSU5HIEZST00sIE9VVCBPRiBPUiBJTiBDT05ORUNUSU9OIFdJVEggVEhFIFNPRlRXQVJFIE9S
IFRIRSBVU0UgT1IKKyAqIE9USEVSIERFQUxJTkdTIElOIFRIRSBTT0ZUV0FSRS4KKyAqCisgKi8K
KworI2lmbmRlZiBfX0FNREdQVV9ESVNDT1ZFUllfXworI2RlZmluZSBfX0FNREdQVV9ESVNDT1ZF
UllfXworCitpbnQgYW1kZ3B1X2Rpc2NvdmVyeV9pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICph
ZGV2KTsKK3ZvaWQgYW1kZ3B1X2Rpc2NvdmVyeV9maW5pKHN0cnVjdCBhbWRncHVfZGV2aWNlICph
ZGV2KTsKK2ludCBhbWRncHVfZGlzY292ZXJ5X3JlZ19iYXNlX2luaXQoc3RydWN0IGFtZGdwdV9k
ZXZpY2UgKmFkZXYpOworaW50IGFtZGdwdV9kaXNjb3ZlcnlfZ2V0X2lwX3ZlcnNpb24oc3RydWN0
IGFtZGdwdV9kZXZpY2UgKmFkZXYsIGludCBod19pZCwKKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGludCAqbWFqb3IsIGludCAqbWlub3IpOworaW50IGFtZGdwdV9kaXNjb3Zl
cnlfZ2V0X2dmeF9pbmZvKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KTsKKworI2VuZGlmIC8q
IF9fQU1ER1BVX0RJU0NPVkVSWV9fICovCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2luY2x1ZGUvZGlzY292ZXJ5LmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2luY2x1ZGUvZGlzY292
ZXJ5LmgKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMDAwLi43Y2M5MjFhMjhm
NTEKLS0tIC9kZXYvbnVsbAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2luY2x1ZGUvZGlzY292
ZXJ5LmgKQEAgLTAsMCArMSwxNDUgQEAKKy8qCisgKiBDb3B5cmlnaHQgMjAxOCBBZHZhbmNlZCBN
aWNybyBEZXZpY2VzLCBJbmMuCisgKgorICogUGVybWlzc2lvbiBpcyBoZXJlYnkgZ3JhbnRlZCwg
ZnJlZSBvZiBjaGFyZ2UsIHRvIGFueSBwZXJzb24gb2J0YWluaW5nIGEKKyAqIGNvcHkgb2YgdGhp
cyBzb2Z0d2FyZSBhbmQgYXNzb2NpYXRlZCBkb2N1bWVudGF0aW9uIGZpbGVzICh0aGUgIlNvZnR3
YXJlIiksCisgKiB0byBkZWFsIGluIHRoZSBTb2Z0d2FyZSB3aXRob3V0IHJlc3RyaWN0aW9uLCBp
bmNsdWRpbmcgd2l0aG91dCBsaW1pdGF0aW9uCisgKiB0aGUgcmlnaHRzIHRvIHVzZSwgY29weSwg
bW9kaWZ5LCBtZXJnZSwgcHVibGlzaCwgZGlzdHJpYnV0ZSwgc3VibGljZW5zZSwKKyAqIGFuZC9v
ciBzZWxsIGNvcGllcyBvZiB0aGUgU29mdHdhcmUsIGFuZCB0byBwZXJtaXQgcGVyc29ucyB0byB3
aG9tIHRoZQorICogU29mdHdhcmUgaXMgZnVybmlzaGVkIHRvIGRvIHNvLCBzdWJqZWN0IHRvIHRo
ZSBmb2xsb3dpbmcgY29uZGl0aW9uczoKKyAqCisgKiBUaGUgYWJvdmUgY29weXJpZ2h0IG5vdGlj
ZSBhbmQgdGhpcyBwZXJtaXNzaW9uIG5vdGljZSBzaGFsbCBiZSBpbmNsdWRlZCBpbgorICogYWxs
IGNvcGllcyBvciBzdWJzdGFudGlhbCBwb3J0aW9ucyBvZiB0aGUgU29mdHdhcmUuCisgKgorICog
VEhFIFNPRlRXQVJFIElTIFBST1ZJREVEICJBUyBJUyIsIFdJVEhPVVQgV0FSUkFOVFkgT0YgQU5Z
IEtJTkQsIEVYUFJFU1MgT1IKKyAqIElNUExJRUQsIElOQ0xVRElORyBCVVQgTk9UIExJTUlURUQg
VE8gVEhFIFdBUlJBTlRJRVMgT0YgTUVSQ0hBTlRBQklMSVRZLAorICogRklUTkVTUyBGT1IgQSBQ
QVJUSUNVTEFSIFBVUlBPU0UgQU5EIE5PTklORlJJTkdFTUVOVC4gIElOIE5PIEVWRU5UIFNIQUxM
CisgKiBUSEUgQ09QWVJJR0hUIEhPTERFUihTKSBPUiBBVVRIT1IoUykgQkUgTElBQkxFIEZPUiBB
TlkgQ0xBSU0sIERBTUFHRVMgT1IKKyAqIE9USEVSIExJQUJJTElUWSwgV0hFVEhFUiBJTiBBTiBB
Q1RJT04gT0YgQ09OVFJBQ1QsIFRPUlQgT1IgT1RIRVJXSVNFLAorICogQVJJU0lORyBGUk9NLCBP
VVQgT0YgT1IgSU4gQ09OTkVDVElPTiBXSVRIIFRIRSBTT0ZUV0FSRSBPUiBUSEUgVVNFIE9SCisg
KiBPVEhFUiBERUFMSU5HUyBJTiBUSEUgU09GVFdBUkUuCisgKgorICovCisKKyNpZm5kZWYgX0RJ
U0NPVkVSWV9IXworI2RlZmluZSBfRElTQ09WRVJZX0hfCisKKyNkZWZpbmUgUFNQX0hFQURFUl9T
SVpFICAgICAgICAgICAgICAgICAyNTYKKyNkZWZpbmUgQklOQVJZX01BWF9TSVpFICAgICAgICAg
ICAgICAgICAoNjQgPDwgMTApCisjZGVmaW5lIEJJTkFSWV9TSUdOQVRVUkUgICAgICAgICAgICAg
ICAgMHgyODIxMTQwNworI2RlZmluZSBESVNDT1ZFUllfVEFCTEVfU0lHTkFUVVJFICAgICAgIDB4
NTM0NDUwNDkKKwordHlwZWRlZiBlbnVtCit7CisJSVBfRElTQ09WRVJZID0gMCwKKwlHQywKKwlU
QUJMRV8zLAorCVRBQkxFXzQsCisJUkVTRVJWRURfMSwKKwlSRVNFUlZFRF8yLAorCVRPVEFMX1RB
QkxFUyA9IDYKK30gdGFibGU7CisKKyNwcmFnbWEgcGFjaygxKQorCit0eXBlZGVmIHN0cnVjdCB0
YWJsZV9pbmZvCit7CisJdWludDE2X3Qgb2Zmc2V0OyAgIC8qIEJ5dGUgb2Zmc2V0ICovCisJdWlu
dDE2X3QgY2hlY2tzdW07IC8qIEJ5dGUgc3VtIG9mIHRoZSB0YWJsZSAqLworfSB0YWJsZV9pbmZv
OworCit0eXBlZGVmIHN0cnVjdCBiaW5hcnlfaGVhZGVyCit7CisJLyogcHNwIHN0cnVjdHVyZSBz
aG91bGQgZ28gYXQgdGhlIHRvcCBvZiB0aGlzIHN0cnVjdHVyZSAqLworCXVpbnQzMl90IGJpbmFy
eV9zaWduYXR1cmU7IC8qIDB4NywgMHgxNCwgMHgyMSwgMHgyOCAqLworCXVpbnQxNl90IGJpbmFy
eV9jaGVja3N1bTsgIC8qIEJ5dGUgc3VtIG9mIHRoZSBiaW5hcnkgYWZ0ZXIgdGhpcyBmaWVsZCAq
LworCXVpbnQxNl90IGJpbmFyeV9zaXplOyAgICAgIC8qIEJpbmFyeSBTaXplKi8KKwl0YWJsZV9p
bmZvIHRhYmxlX2xpc3RbVE9UQUxfVEFCTEVTXTsKK30gYmluYXJ5X2hlYWRlcjsKKwordHlwZWRl
ZiBzdHJ1Y3QgZGllX2luZm8KK3sKKwl1aW50MTZfdCBkaWVfaWQ7CisJdWludDE2X3QgZGllX29m
ZnNldDsgLyogUG9pbnRzIHRvIHRoZSBjb3JyZXNwb25kaW5nIGRpZV9oZWFkZXIgc3RydWN0dXJl
ICovCit9IGRpZV9pbmZvOworCisKK3R5cGVkZWYgc3RydWN0IGlwX2Rpc2NvdmVyeV9oZWFkZXIK
K3sKKwl1aW50MzJfdCBzaWduYXR1cmU7ICAgIC8qIFRhYmxlIFNpZ25hdHVyZSAqLworCXVpbnQx
Nl90IHZlcnNpb247ICAgICAgLyogVGFibGUgVmVyc2lvbiAqLworCXVpbnQxNl90IHNpemU7ICAg
ICAgICAgLyogVGFibGUgU2l6ZSAqLworCXVpbnQzMl90IGlkOyAgICAgICAgICAgLyogVGFibGUg
SUQgKi8KKwl1aW50MTZfdCBudW1fZGllczsgICAgIC8qIE51bWJlciBvZiBEaWVzICovCisJZGll
X2luZm8gZGllX2luZm9bMTZdOyAvKiBsaXN0IGRpZSBpbmZvcm1hdGlvbiBmb3IgdXAgdG8gMTYg
ZGllcyAqLworCXVpbnQxNl90IHBhZGRpbmdbMV07ICAgLyogcGFkZGluZyAqLworfSBpcF9kaXNj
b3ZlcnlfaGVhZGVyOworCit0eXBlZGVmIHN0cnVjdCBpcAoreworCXVpbnQxNl90IGh3X2lkOyAg
ICAgICAgICAgLyogSGFyZHdhcmUgSUQgKi8KKwl1aW50OF90IG51bWJlcl9pbnN0YW5jZTsgIC8q
IGluc3RhbmNlIG9mIHRoZSBJUCAqLworCXVpbnQ4X3QgbnVtX2Jhc2VfYWRkcmVzczsgLyogTnVt
YmVyIG9mIEJhc2UgQWRkcmVzc2VzICovCisJdWludDhfdCBtYWpvcjsgICAgICAgICAgICAvKiBI
Q0lEIE1ham9yICovCisJdWludDhfdCBtaW5vcjsgICAgICAgICAgICAvKiBIQ0lEIE1pbm9yICov
CisJdWludDhfdCByZXZpc2lvbjsgICAgICAgICAvKiBIQ0lEIFJldmlzaW9uICovCisjaWYgZGVm
aW5lZChfX0JJR19FTkRJQU4pCisJdWludDhfdCByZXNlcnZlZCA6IDQ7ICAgICAvKiBQbGFjZWhv
bGRlciBmaWVsZCAqLworCXVpbnQ4X3QgaGFydmVzdCA6IDQ7ICAgICAgLyogSGFydmVzdCAqLwor
I2Vsc2UKKwl1aW50OF90IGhhcnZlc3QgOiA0OyAgICAgIC8qIEhhcnZlc3QgKi8KKwl1aW50OF90
IHJlc2VydmVkIDogNDsgICAgIC8qIFBsYWNlaG9sZGVyIGZpZWxkICovCisjZW5kaWYKKwl1aW50
MzJfdCBiYXNlX2FkZHJlc3NbMV07IC8qIHZhcmlhYmxlIG51bWJlciBvZiBBZGRyZXNzZXMgKi8K
K30gaXA7CisKK3R5cGVkZWYgc3RydWN0IGRpZV9oZWFkZXIKK3sKKwl1aW50MzJfdCBkaWVfaWQ7
CisJdWludDMyX3QgbnVtX2lwczsKK30gZGllX2hlYWRlcjsKKwordHlwZWRlZiBzdHJ1Y3QgaXBf
c3RydWN0dXJlCit7CisJaXBfZGlzY292ZXJ5X2hlYWRlciogaGVhZGVyOworCXN0cnVjdCBkaWUK
Kwl7CisJCWRpZV9oZWFkZXIgKmRpZV9oZWFkZXI7CisJCWlwICppcF9saXN0OworCX0gZGllOwor
fSBpcF9zdHJ1Y3R1cmU7CisKK3N0cnVjdCBncHVfaW5mb19oZWFkZXIgeworCXVpbnQzMl90IHRh
YmxlX2lkOyAgICAgIC8qIHRhYmxlIElEICovCisJdWludDE2X3QgdmVyc2lvbl9tYWpvcjsgLyog
dGFibGUgdmVyc2lvbiAqLworCXVpbnQxNl90IHZlcnNpb25fbWlub3I7IC8qIHRhYmxlIHZlcnNp
b24gKi8KKwl1aW50MzJfdCBzaXplOyAgICAgICAgICAvKiBzaXplIG9mIHRoZSBlbnRpcmUgaGVh
ZGVyK2RhdGEgaW4gYnl0ZXMgKi8KK307CisKK3N0cnVjdCBnY19pbmZvX3YxXzAgeworCXN0cnVj
dCBncHVfaW5mb19oZWFkZXIgaGVhZGVyOworCisJdWludDMyX3QgZ2NfbnVtX3NlOworCXVpbnQz
Ml90IGdjX251bV93Z3AwX3Blcl9zYTsKKwl1aW50MzJfdCBnY19udW1fd2dwMV9wZXJfc2E7CisJ
dWludDMyX3QgZ2NfbnVtX3JiX3Blcl9zZTsKKwl1aW50MzJfdCBnY19udW1fZ2wyYzsKKwl1aW50
MzJfdCBnY19udW1fZ3ByczsKKwl1aW50MzJfdCBnY19udW1fbWF4X2dzX3RoZHM7CisJdWludDMy
X3QgZ2NfZ3NfdGFibGVfZGVwdGg7CisJdWludDMyX3QgZ2NfZ3NwcmltX2J1ZmZfZGVwdGg7CisJ
dWludDMyX3QgZ2NfcGFyYW1ldGVyX2NhY2hlX2RlcHRoOworCXVpbnQzMl90IGdjX2RvdWJsZV9v
ZmZjaGlwX2xkc19idWZmZXI7CisJdWludDMyX3QgZ2Nfd2F2ZV9zaXplOworCXVpbnQzMl90IGdj
X21heF93YXZlc19wZXJfc2ltZDsKKwl1aW50MzJfdCBnY19tYXhfc2NyYXRjaF9zbG90c19wZXJf
Y3U7CisJdWludDMyX3QgZ2NfbGRzX3NpemU7CisJdWludDMyX3QgZ2NfbnVtX3NjX3Blcl9zZTsK
Kwl1aW50MzJfdCBnY19udW1fc2FfcGVyX3NlOworCXVpbnQzMl90IGdjX251bV9wYWNrZXJfcGVy
X3NjOworCXVpbnQzMl90IGdjX251bV9nbDJhOworfTsKKworI3ByYWdtYSBwYWNrKCkKKworI2Vu
ZGlmCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
