Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A4F2B50B2
	for <lists+amd-gfx@lfdr.de>; Mon, 16 Nov 2020 20:18:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B793A6EA27;
	Mon, 16 Nov 2020 19:18:17 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC53289F77
 for <amd-gfx@lists.freedesktop.org>; Mon, 16 Nov 2020 17:30:10 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id 10so7510wml.2
 for <amd-gfx@lists.freedesktop.org>; Mon, 16 Nov 2020 09:30:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Va1cLVfZBuyh4JlQmULv5m72tMTELkHXMhBCanEGiFk=;
 b=kg89kpisOiiPWxBFPajM/LFhfdS+b0tsKznbVRE04wvACLChQ59pOp1AjNbVLxhE+p
 6MIE9UZlVKaFKE/qg1wR8fP2VQRkjxcFawUGpOYwA/J7O73TVuSzm8VYlA/K/jYPPcv7
 Gngzh3CfRJEMyALQ8GiuxgrVYN+aEMNN2xLMw4Qea6kGwmI8LNgE/n1qfwQ6PgiRiTjL
 R7FCgnTRKAgWqLsFDvcwsGwEFY0SPMp9e3hWK69NOFQsrELylOnnjtKLfV8VRJaOZqYD
 6SCPoxeIiLsbcwLPrzuHmpO0f3LmqvFdyS1zQZv9ZpcVIavTnqwdxHwnXmhjaMHkKH7+
 6yfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Va1cLVfZBuyh4JlQmULv5m72tMTELkHXMhBCanEGiFk=;
 b=lRyGHEtPclicf8F1lUqM2UaUvKZ6eKb+feOc9Nehp2flUNXkcdjCip+I+/z5vCh/1+
 xkCH2ccIFuvtiliX+mU+NTE8r8GX//O2dywXE0b4mLbbOF+G0HV7QlnbI38zdVJjqT7e
 V+4ygSe6WNpcIatPthkbUftWcn15pt8bwY3vR3DaOnbSSqstfqhaP7Rqs//y3OdKndF2
 AtRs7qPQXZ/zL3dQz22amCSoQ2G3kQF2VpK8/66ROhHMdgB7PBbCVyvDylc6NpLAtGkv
 KXmlVJfXF8z1mssyw2ZSKDMQUr1yJzll4oD+djBZjG/OoeFGLQJ56pYz37mfLNvwH9OK
 fO4Q==
X-Gm-Message-State: AOAM5306OTVKbBFQCPw0hnVk4rGJAuCefjl4E0lrFdOxP+9Agr89rPAS
 D2KnsErE7Y4RCNBOBlAjxKzi5A==
X-Google-Smtp-Source: ABdhPJzptdguR/7fiycWek3WAWaq9nJPjqjO31kcsOiAaXL5iD2olUi13t74DUfyOCXZJLVlt52Mzw==
X-Received: by 2002:a1c:c203:: with SMTP id s3mr16920694wmf.77.1605547809291; 
 Mon, 16 Nov 2020 09:30:09 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id f23sm20054854wmb.43.2020.11.16.09.30.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 09:30:08 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [RESEND 00/43] Rid W=1 warnings from GPU 
Date: Mon, 16 Nov 2020 17:29:22 +0000
Message-Id: <20201116173005.1825880-1-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 16 Nov 2020 19:18:12 +0000
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
Cc: Gareth Hughes <gareth@valinux.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Slava Grigorev <slava.grigorev@amd.com>, linaro-mm-sig@lists.linaro.org,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhpcyBzZXQgY29udGFpbnMgZml4ZXMgZm9yIHNvbWUgIndvdWxkbid0IGl0IGJlIG5pY2UgaWYi
IGlzc3VlcywKaG93ZXZlciBtb3N0IG9mIHRoZSBwYXRjaGVzIHNlZW4gaGVyZSBoYXZlIGJlZW4g
b24gdGhlIE1McywgYnV0CndlcmUgbGVmdCB1bnJldmlld2VkLgoKTGVlIEpvbmVzICg0Myk6CiAg
ZHJtL3JhZGVvbi9hdG9tYmlvc19lbmNvZGVyczogTW92ZSAncmFkZW9uX2F0b21fZ2V0X3R2X3Rp
bWluZ3MoKSdzCiAgICBwcm90b3R5cGUgaW50byBzaGFyZWQgbG9jYXRpb24KICBkcm0vcmFkZW9u
L3JhZGVvbjogTW92ZSBwcm90b3R5cGUgaW50byBzaGFyZWQgaGVhZGVyCiAgZHJtL3JhZGVvbi9y
YWRlb25fa21zOiBNb3ZlICdyYWRlb25fKl9rbXMnIHByb3RvdHlwZXMgdG8gc2hhcmVkIGhlYWRl
cgogIGRybS9yYWRlb24vcmFkZW9uX2ttczogRml4IG1pc25hbWluZyBvZiAncmFkZW9uX2luZm9f
aW9jdGwncyBkZXYgcGFyYW0KICBkcm0vcmFkZW9uOiBNb3ZlIHJhZGVvbl90dG17aW5pdCxmaW5p
fSB0byBzaGFyZWQgbG9jYXRpb24KICBkcm0vcmFkZW9uL3JhZGVvbl9sZWdhY3lfZW5jb2RlcnM6
IE1vdmUgJ3JhZGVvbl9hZGRfbGVnYWN5X2VuY29kZXInCiAgICBwcm90b3R5cGUgdG8gc2hhcmVk
IGhlYWRlcgogIGRybS9yYWRlb24vcmFkZW9uX2xlZ2FjeV9lbmNvZGVyczogTW92ZSAncmFkZW9u
X2FkZF9sZWdhY3lfZW5jb2RlcidzCiAgICBwcm90b3R5cGUgdG8gc2hhcmVkIGxvY2F0aW9uCiAg
ZHJtL3JhZGVvbi9yYWRlb25faXJxX2ttczogRGVtb3RlIG5vbi1jb25mb3JtYW50IGtlcm5lbC1k
b2MgZml4CiAgICBhbm90aGVyCiAgZHJtL3JhZGVvbi9ydjc3MDogTW92ZSAncnY3NzBfc2V0X2Ns
a19ieXBhc3NfbW9kZScgcHJvdG90eXBlIHRvIHNoYXJlZAogICAgbG9jYXRpb24KICBkcm0vcmFk
ZW9uL3JhZGVvbl9wbTogTW92ZSAncmFkZW9uX3BtX2FjcGlfZXZlbnRfaGFuZGxlcicgcHJvdG90
eXBlCiAgICBpbnRvIHNoYXJlZCBoZWFkZXIKICBkcm0vcmFkZW9uL3JhZGVvbl9hdWRpbzogTW92
ZSAnZGNlM18yXyonIHByb3RvdHlwZXMgdG8gc2hhcmVkIGxvY2F0aW9uCiAgZHJtL3JhZGVvbi9l
dmVyZ3JlZW46IE1vdmUgJ2V2ZXJncmVlbl8qJyBhbmQgJ3N1bW9fKicgcHJvdG90eXBlcyBvdXQK
ICAgIHRvIHNoYXJlZCBsb2NhdGlvbgogIGRybS9yYWRlb24vcmFkZW9uX2RydjogTW92ZSAncmFk
ZW9uX21tYXAoKSdzIHByb3RvdHlwZSB0byBzaGFyZWQKICAgIGhlYWRlcgogIGRybS9yYWRlb24v
cmFkZW9uX2RydjogTW92ZSAncmFkZW9uX2RyaXZlcl9pcnFfaGFuZGxlcl9rbXMncyBwcm90b3R5
cGUKICAgIGludG8gc2hhcmVkIGhlYWRlcgogIGRybS9yYWRlb24vYXRvbTogTW92ZSAncmFkZW9u
X2F0b21faHdfaTJjXyooKSdzIHByb3RvdHlwZXMgaW50byBzaGFyZWQKICAgIGhlYWRlcgogIGRy
bS9yYWRlb24vcmFkZW9uX2dlbTogTW92ZSAncmFkZW9uX2dlbV9wcmltZV8qKCkncyBwcm90b3R5
cGVzIHRvCiAgICBzaGFyZWQgaGVhZGVyCiAgZHJtL3JhZGVvbi9ldmVyZ3JlZW5faGRtaTogTW92
ZSAnZXZlcmdyZWVuXyooKScgYW5kICdkY2U0XyooKScgSERNSQogICAgcHJvdG90eXBlcyB0byBz
aGFyZWQgaGVhZGVyCiAgZHJtL3JhZGVvbi9ydjc3MDogTW92ZSAncnY3NzBfZ2V0XyooKSdzIHBy
b3RvdHlwZXMgdG8gc2hhcmVkIGhlYWRlcgogIGRybS9yYWRlb24vbmlfZHBtOiBNb3ZlICduaV9n
ZXRfe3BpLHBzfSgpJ3MgaW50byBzaGFyZWQgaGVhZGVyCiAgZHJtL3JhZGVvbi9ldmVyZ3JlZW46
IE1vdmUgJ2NheW1hbl8qKCkncyBwcm90b3R5cGVzIHRvIHNoYXJlZCBoZWFkZXIKICBkcm0vcmFk
ZW9uL3I2MDBfZG1hOiBNb3ZlICdyNjAwX2dwdV9jaGVja19zb2Z0X3Jlc2V0KCkncyBwcm90b3R5
cGUgdG8KICAgIHNoYXJlZCBsb2NhdGlvbgogIGRybS9yYWRlb24vY2lrOiBNb3ZlICdyNjAwX2lo
X3Jpbmdfe2FsbG9jLGZpbml9KCkncyBwcm90b3R5cGVzIHRvCiAgICBzaGFyZWQgaGVhZGVyCiAg
ZHJtL3JhZGVvbi9ldmVyZ3JlZW5fZG1hOiBNb3ZlICdldmVyZ3JlZW5fZ3B1X2NoZWNrX3NvZnRf
cmVzZXQoKSdzCiAgICBwcm90b3R5cGUgdG8gc2hhcmVkIGhlYWRlcgogIGRybS9yYWRlb24vcjYw
MDogTW92ZSAnZXZlcmdyZWVuX3JsY19yZXN1bWUoKSdzIHByb3RvdHlwZSB0byBzaGFyZWQKICAg
IGhlYWRlcgogIGRybS9yYWRlb24vbmlfZG1hOiBNb3ZlICdjYXltYW5fZ3B1X2NoZWNrX3NvZnRf
cmVzZXQoKSdzIHByb3RvdHlwZSB0bwogICAgc2hhcmVkIGhlYWRlcgogIGRybS9yYWRlb24vcmFk
ZW9uX2F0b21iaW9zOiBNb3ZlICdyYWRlb25fYWRkX2F0b21fZW5jb2RlcigpJ3MKICAgIHByb3Rv
dHlwZSB0byBzaGFyZWQgaGVhZGVyCiAgZHJtL3JhZGVvbi9yYWRlb25fZW5jb2RlcnM6IE1vdmUg
J3JhZGVvbl9hdG9tX2JhY2tsaWdodF9pbml0J3MKICAgIHByb3RvdHlwZSB0byBzaGFyZWQgaGVh
ZGVyCiAgZHJtL3JhZGVvbi9jaV9kcG06IE1vdmUgJ2NpXyooKSdzIHByb3RvdHlwZXMgdG8gc2hh
cmVkIGhlYWRlcgogIGRybS9yYWRlb24vc2lfZHBtOiBNb3ZlICdzaV9tY19sb2FkX21pY3JvY29k
ZSgpJ3MgcHJvdG90eXBlIHRvIHNoYXJlZAogICAgaGVhZGVyCiAgZHJtL3JhZGVvbi9zaV9kbWE6
IE1vdmUgJ3NpX2dwdV9jaGVja19zb2Z0X3Jlc2V0KCkncyBwcm90b3R5cGUgdG8KICAgIHNoYXJl
ZCBoZWFkZXIKICBkcm0vcmFkZW9uL2NpazogTW92ZSAnc2lfKigpJ3MgcHJvdG90eXBlcyB0byBz
aGFyZWQgaGVhZGVyCiAgZHJtL3JhZGVvbi9idGNfZHBtOiBNb3ZlICdldmVyZ3JlZW5fZ2V0X3Bp
J3MgcHJvdG90eXBlIHRvIHNoYXJlZAogICAgaGVhZGVyCiAgZHJtL3JhZGVvbi9yYWRlb25fYXVk
aW86IE1vdmUgJ2RjZTZfKigpJ3MgcHJvdG90eXBlcyB0byBzaGFyZWQgaGVhZGVyCiAgZHJtL3Jh
ZGVvbi9ldmVyZ3JlZW46IE1vdmUgJ3NpX2dldF9jc2JfKigpJ3MgcHJvdG90eXBlcyB0byBzaGFy
ZWQKICAgIGhlYWRlcgogIGRybS9yYWRlb24vY2lrX3NkbWE6IE1vdmUgJ2FtZGdwdV9jaWtfZ3B1
X2NoZWNrX3NvZnRfcmVzZXQoKSdzCiAgICBwcm90b3R5cGUgdG8gc2hhcmVkIGhlYWRlcgogIGRy
bS9yYWRlb24vZXZlcmdyZWVuOiBNb3ZlICdjaWtfKigpJ3MgcHJvdG90eXBlcyB0byBzaGFyZWQg
aGVhZGVyCiAgZHJtL3JhZGVvbi9jaV9kcG06IE1vdmUgJ3NpXyooKSdzIHByb3RvdHlwZXMgdG8g
c2hhcmVkIGhlYWRlcgogIGRybS9yYWRlb24vY2lrOiBNb3ZlICdNb3ZlICdjaWtfc2RtYV8qKCkn
cyBwcm90b3R5cGVzIHRvIHNoYXJlZCBoZWFkZXIKICBkcm0vcmFkZW9uL3NpX2RwbTogTW92ZSAn
dmNlX3YxXzBfZW5hYmxlX21nY2coKSdzIHByb3RvdHlwZSB0byBzaGFyZWQKICAgIGhlYWRlcgog
IGRybS9yYWRlb24vY2lrOiBNb3ZlICd2Y2VfdjJfMF9lbmFibGVfbWdjZygpJ3MgcHJvdG90eXBl
IHRvIHNoYXJlZAogICAgaGVhZGVyCiAgZHJtL3JhZGVvbi9ldmVyZ3JlZW5fY3M6IE1vdmUgJ3I2
MDBfZG1hX2NzX25leHRfcmVsb2MoKSdzIHByb3RvdHlwZSB0bwogICAgc2hhcmVkIGhlYWRlcgog
IGRybS9yYWRlb24vcmFkZW9uX2F1ZGlvOiBNb3ZlICdyNjAwXyonIHByb3RvdHlwZXMgaW50byBz
aGFyZWQgaGVhZGVyCiAgZHJtL3JhZGVvbi9yYWRlb25fZHJ2OiBNb3ZlICdyYWRlb25fZ2VtX3By
aW1lX2ltcG9ydF9zZ190YWJsZSgpJ3MKICAgIHByb3RvdHlwZSB0byBzaGFyZWQgaGVhZGVyCgog
ZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9hdG9tLmggICAgICAgICAgICAgICAgIHwgIDcgKysKIGRy
aXZlcnMvZ3B1L2RybS9yYWRlb24vYXRvbWJpb3NfZW5jb2RlcnMuYyAgICB8ICA1ICstCiBkcml2
ZXJzL2dwdS9kcm0vcmFkZW9uL2J0Y19kcG0uYyAgICAgICAgICAgICAgfCAgNiArLQogZHJpdmVy
cy9ncHUvZHJtL3JhZGVvbi9jaV9kcG0uYyAgICAgICAgICAgICAgIHwgMTMgKy0tLQogZHJpdmVy
cy9ncHUvZHJtL3JhZGVvbi9jaWsuYyAgICAgICAgICAgICAgICAgIHwgMTkgKystLS0KIGRyaXZl
cnMvZ3B1L2RybS9yYWRlb24vY2lrLmggICAgICAgICAgICAgICAgICB8IDQwICsrKysrKysrKysr
CiBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL2Npa19zZG1hLmMgICAgICAgICAgICAgfCAgMyArLQog
ZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9jeXByZXNzX2RwbS5jICAgICAgICAgIHwgIDYgKy0KIGRy
aXZlcnMvZ3B1L2RybS9yYWRlb24vZGNlNl9hZm10LmMgICAgICAgICAgICB8ICAxICsKIGRyaXZl
cnMvZ3B1L2RybS9yYWRlb24vZGNlNl9hZm10LmggICAgICAgICAgICB8IDUyICsrKysrKysrKysr
KysrCiBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL2V2ZXJncmVlbi5jICAgICAgICAgICAgfCAxNiAr
Ky0tLQogZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9ldmVyZ3JlZW4uaCAgICAgICAgICAgIHwgNTUg
KysrKysrKysrKysrKysrCiBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL2V2ZXJncmVlbl9jcy5jICAg
ICAgICAgfCAgMyArLQogZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9ldmVyZ3JlZW5fZG1hLmMgICAg
ICAgIHwgIDMgKy0KIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vZXZlcmdyZWVuX2hkbWkuYyAgICAg
ICB8ICAxICsKIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vZXZlcmdyZWVuX2hkbWkuaCAgICAgICB8
IDY5ICsrKysrKysrKysrKysrKysrKysKIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vbmkuYyAgICAg
ICAgICAgICAgICAgICB8IDE3ICstLS0tCiBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL25pLmggICAg
ICAgICAgICAgICAgICAgfCAzOSArKysrKysrKysrKwogZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9u
aV9kbWEuYyAgICAgICAgICAgICAgIHwgIDMgKy0KIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vbmlf
ZHBtLmMgICAgICAgICAgICAgICB8ICA1ICstCiBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL25pX2Rw
bS5oICAgICAgICAgICAgICAgfCAgMyArCiBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3I2MDAuYyAg
ICAgICAgICAgICAgICAgfCAgNSArLQogZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yNjAwLmggICAg
ICAgICAgICAgICAgIHwgNTggKysrKysrKysrKysrKysrKwogZHJpdmVycy9ncHUvZHJtL3JhZGVv
bi9yNjAwX2NzLmMgICAgICAgICAgICAgIHwgIDEgKwogZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9y
NjAwX2RtYS5jICAgICAgICAgICAgIHwgIDMgKy0KIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcjYw
MF9oZG1pLmMgICAgICAgICAgICB8ICAxICsKIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9u
X2FjcGkuYyAgICAgICAgICB8ICAzICstCiBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9h
dG9tYmlvcy5jICAgICAgfCAxMSArLS0KIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2F0
b21iaW9zLmggICAgICB8IDQ1ICsrKysrKysrKysrKwogZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9y
YWRlb25fYXVkaW8uYyAgICAgICAgIHwgNjggKy0tLS0tLS0tLS0tLS0tLS0tCiBkcml2ZXJzL2dw
dS9kcm0vcmFkZW9uL3JhZGVvbl9hdWRpby5oICAgICAgICAgfCAxMiArKysrCiBkcml2ZXJzL2dw
dS9kcm0vcmFkZW9uL3JhZGVvbl9jb21iaW9zLmMgICAgICAgfCAgNiArLQogZHJpdmVycy9ncHUv
ZHJtL3JhZGVvbi9yYWRlb25fZGV2aWNlLmMgICAgICAgIHwgIDEgKwogZHJpdmVycy9ncHUvZHJt
L3JhZGVvbi9yYWRlb25fZGV2aWNlLmggICAgICAgIHwgMzIgKysrKysrKysrCiBkcml2ZXJzL2dw
dS9kcm0vcmFkZW9uL3JhZGVvbl9kaXNwbGF5LmMgICAgICAgfCAgMSArCiBkcml2ZXJzL2dwdS9k
cm0vcmFkZW9uL3JhZGVvbl9kcnYuYyAgICAgICAgICAgfCAxNCArKy0tCiBkcml2ZXJzL2dwdS9k
cm0vcmFkZW9uL3JhZGVvbl9lbmNvZGVycy5jICAgICAgfCAxMCArLS0KIGRyaXZlcnMvZ3B1L2Ry
bS9yYWRlb24vcmFkZW9uX2dlbS5jICAgICAgICAgICB8ICAxICsKIGRyaXZlcnMvZ3B1L2RybS9y
YWRlb24vcmFkZW9uX2kyYy5jICAgICAgICAgICB8ICA0IC0tCiBkcml2ZXJzL2dwdS9kcm0vcmFk
ZW9uL3JhZGVvbl9pcnFfa21zLmMgICAgICAgfCAgOSArKy0KIGRyaXZlcnMvZ3B1L2RybS9yYWRl
b24vcmFkZW9uX2ttcy5jICAgICAgICAgICB8ICAzICstCiBkcml2ZXJzL2dwdS9kcm0vcmFkZW9u
L3JhZGVvbl9rbXMuaCAgICAgICAgICAgfCA0MCArKysrKysrKysrKwogLi4uL2dwdS9kcm0vcmFk
ZW9uL3JhZGVvbl9sZWdhY3lfZW5jb2RlcnMuYyAgIHwgIDEgKwogLi4uL2dwdS9kcm0vcmFkZW9u
L3JhZGVvbl9sZWdhY3lfZW5jb2RlcnMuaCAgIHwgMzYgKysrKysrKysrKwogZHJpdmVycy9ncHUv
ZHJtL3JhZGVvbi9yYWRlb25fb2JqZWN0LmMgICAgICAgIHwgIDMgKy0KIGRyaXZlcnMvZ3B1L2Ry
bS9yYWRlb24vcmFkZW9uX3BtLmMgICAgICAgICAgICB8ICAxICsKIGRyaXZlcnMvZ3B1L2RybS9y
YWRlb24vcmFkZW9uX3BtLmggICAgICAgICAgICB8IDMzICsrKysrKysrKwogZHJpdmVycy9ncHUv
ZHJtL3JhZGVvbi9yYWRlb25fcHJpbWUuYyAgICAgICAgIHwgIDEgKwogZHJpdmVycy9ncHUvZHJt
L3JhZGVvbi9yYWRlb25fcHJpbWUuaCAgICAgICAgIHwgNDIgKysrKysrKysrKysKIGRyaXZlcnMv
Z3B1L2RybS9yYWRlb24vcmFkZW9uX3R0bS5jICAgICAgICAgICB8ICAxICsKIGRyaXZlcnMvZ3B1
L2RybS9yYWRlb24vcmFkZW9uX3R0bS5oICAgICAgICAgICB8IDM3ICsrKysrKysrKysKIGRyaXZl
cnMvZ3B1L2RybS9yYWRlb24vcnY3MzBfZHBtLmMgICAgICAgICAgICB8ICA0ICstCiBkcml2ZXJz
L2dwdS9kcm0vcmFkZW9uL3J2NzQwX2RwbS5jICAgICAgICAgICAgfCAgMyArLQogZHJpdmVycy9n
cHUvZHJtL3JhZGVvbi9ydjc3MC5jICAgICAgICAgICAgICAgIHwgIDEgKwogZHJpdmVycy9ncHUv
ZHJtL3JhZGVvbi9ydjc3MC5oICAgICAgICAgICAgICAgIHwgMzkgKysrKysrKysrKysKIGRyaXZl
cnMvZ3B1L2RybS9yYWRlb24vcnY3NzBfZHBtLmMgICAgICAgICAgICB8ICAyICsKIGRyaXZlcnMv
Z3B1L2RybS9yYWRlb24vc2kuYyAgICAgICAgICAgICAgICAgICB8IDExICstLQogZHJpdmVycy9n
cHUvZHJtL3JhZGVvbi9zaS5oICAgICAgICAgICAgICAgICAgIHwgMzggKysrKysrKysrKwogZHJp
dmVycy9ncHUvZHJtL3JhZGVvbi9zaV9kbWEuYyAgICAgICAgICAgICAgIHwgIDMgKy0KIGRyaXZl
cnMvZ3B1L2RybS9yYWRlb24vc2lfZHBtLmMgICAgICAgICAgICAgICB8IDEzICsrLS0KIGRyaXZl
cnMvZ3B1L2RybS9yYWRlb24vc2lfZHBtLmggICAgICAgICAgICAgICB8ICA1ICsrCiBkcml2ZXJz
L2dwdS9kcm0vcmFkZW9uL3RyaW5pdHlfZHBtLmMgICAgICAgICAgfCAgMiArLQogZHJpdmVycy9n
cHUvZHJtL3JhZGVvbi92Y2UuaCAgICAgICAgICAgICAgICAgIHwgMzUgKysrKysrKysrKwogZHJp
dmVycy9ncHUvZHJtL3JhZGVvbi92Y2VfdjFfMC5jICAgICAgICAgICAgIHwgIDEgKwogZHJpdmVy
cy9ncHUvZHJtL3JhZGVvbi92Y2VfdjJfMC5jICAgICAgICAgICAgIHwgIDEgKwogNjUgZmlsZXMg
Y2hhbmdlZCwgNzk0IGluc2VydGlvbnMoKyksIDIxMyBkZWxldGlvbnMoLSkKIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL2Npay5oCiBjcmVhdGUgbW9kZSAxMDA2NDQg
ZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9kY2U2X2FmbXQuaAogY3JlYXRlIG1vZGUgMTAwNjQ0IGRy
aXZlcnMvZ3B1L2RybS9yYWRlb24vZXZlcmdyZWVuLmgKIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2
ZXJzL2dwdS9kcm0vcmFkZW9uL2V2ZXJncmVlbl9oZG1pLmgKIGNyZWF0ZSBtb2RlIDEwMDY0NCBk
cml2ZXJzL2dwdS9kcm0vcmFkZW9uL25pLmgKIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dw
dS9kcm0vcmFkZW9uL3I2MDAuaAogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9y
YWRlb24vcmFkZW9uX2F0b21iaW9zLmgKIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9k
cm0vcmFkZW9uL3JhZGVvbl9kZXZpY2UuaAogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1
L2RybS9yYWRlb24vcmFkZW9uX2ttcy5oCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUv
ZHJtL3JhZGVvbi9yYWRlb25fbGVnYWN5X2VuY29kZXJzLmgKIGNyZWF0ZSBtb2RlIDEwMDY0NCBk
cml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9wbS5oCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJp
dmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fcHJpbWUuaAogY3JlYXRlIG1vZGUgMTAwNjQ0IGRy
aXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX3R0bS5oCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJp
dmVycy9ncHUvZHJtL3JhZGVvbi9ydjc3MC5oCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9n
cHUvZHJtL3JhZGVvbi9zaS5oCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL3Jh
ZGVvbi92Y2UuaAoKQ2M6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4K
Q2M6IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCkNjOiAiQ2hyaXN0aWFuIEvDtm5pZyIg
PGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZnds
bC5jaD4KQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6IGRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKQ2M6IEV2YW4gUXVhbiA8ZXZhbi5xdWFuQGFtZC5jb20+CkNj
OiBHYXJldGggSHVnaGVzIDxnYXJldGhAdmFsaW51eC5jb20+CkNjOiBsaW5hcm8tbW0tc2lnQGxp
c3RzLmxpbmFyby5vcmcKQ2M6IGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZwpDYzogU2xhdmEg
R3JpZ29yZXYgPHNsYXZhLmdyaWdvcmV2QGFtZC5jb20+CkNjOiBTdW1pdCBTZW13YWwgPHN1bWl0
LnNlbXdhbEBsaW5hcm8ub3JnPgotLSAKMi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2FtZC1nZngK
