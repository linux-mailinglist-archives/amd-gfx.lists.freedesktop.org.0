Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3E1D3740
	for <lists+amd-gfx@lfdr.de>; Fri, 11 Oct 2019 03:45:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D68AD6E3F4;
	Fri, 11 Oct 2019 01:45:48 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2668889FDD
 for <amd-gfx@lists.freedesktop.org>; Fri, 11 Oct 2019 01:45:46 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id h126so7457782qke.10
 for <amd-gfx@lists.freedesktop.org>; Thu, 10 Oct 2019 18:45:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xfHVEqwwZjaE1f7oH9R0ZiegO6cnKBC7kllNvz5oekQ=;
 b=JOk1Rrg+hBimqgY4rHKXdi8JbJyOYyMTusHCbIT3wEfyarDZSuieI/tSpo8iEEqKs3
 6IkkbvX8ap5/vMIhQFa9FBXuswM033bWWZLqD/LnRnk0TzpN7onHGLswcgoXFJ+2Z0rL
 S9VWvS3JUqmcEaq1UGgKTGr15eDDp4Ehk8AT83zjrStGPQ3H2pI/SiBb7hsnK92t/RVi
 IcOmwc79d66NeFlyNGcEIW4vcRDVZzKOwEDt1ARO6CaUYMIA1YYw4ijXyVUlz5ZrPq+C
 +lIbMiuLhAIZU2663HUQcfLObhbPFlccEGlf6uwouGs3rdMw5IqZkCGR84OBJIBcO5PP
 mi/w==
X-Gm-Message-State: APjAAAUkn4r0fW6jrpZishQr+Z1k91EU2Y4PkpogS6MRcHBcAwpTt1h7
 eEx7sJO87hrD+IQKELDu2LVQOUhV
X-Google-Smtp-Source: APXvYqwlk5YYGvAIze3Vj/C1JKm9Te0ZY1LvH5yGo3cbAI6uLxzESSgPpgKUo1ZN+MhUfwhFk629Hw==
X-Received: by 2002:a05:620a:1592:: with SMTP id
 d18mr12861743qkk.282.1570758344877; 
 Thu, 10 Oct 2019 18:45:44 -0700 (PDT)
Received: from localhost.localdomain ([71.51.171.205])
 by smtp.gmail.com with ESMTPSA id s23sm3612945qte.72.2019.10.10.18.45.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Oct 2019 18:45:44 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org,
	tiwai@suse.de,
	lukas@wunner.de
Subject: [PATCH 00/19] Enable BACO for power savings
Date: Thu, 10 Oct 2019 20:45:17 -0500
Message-Id: <20191011014536.10869-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xfHVEqwwZjaE1f7oH9R0ZiegO6cnKBC7kllNvz5oekQ=;
 b=e/Xw34tIruiYAYnarw29z57YDMZfKvCEJb+i3YcgOllndRpLb7UoRHIzHFNgMaXa9j
 s6fiSAXwQMTuhCSq/HwDUREUooXPOcWsN4XxKXhHQIfE9BPpssxIeBieND0IHwyfRpTP
 hz3pz2devRWHIu8SXcc4lmaFv8rK/PyQcRNERVumclNHRmQYHZT9BzUzCt8MW1jT1nI2
 1rw2IyXTPnm5nKIuShAxNRd2qwR3dRI6t++hcasFZ4RQZy2NwWLE2Bf1FP606x87fPe4
 q8yNonLMhbaX0K0iWgBl/xosHIB/27MlsEmJt6dPDlt8UwZRzWJQEDcl5GluEZHLWK9F
 tbgg==
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

VGhpcyBwYXRjaCBzZXQgZW5hYmxlcyBCQUNPIChCdXMgQWN0aXZlIENoaXAgT2ZmKSBmb3IKcG93
ZXIgc2F2aW5ncyBvbiBWSSsgYXNpY3MuICBTaW1pbGFyIHRvIFBvd2VyWHByZXNzCmFuZCBIeWJy
aWQgR3JhcGhpY3MgKFBYL0hHKSBsYXB0b3BzLCB3ZSBjYW4gZGlzYWJsZSBHUFVzCmF0IHJ1bnRp
bWUgd2hlbiB0aGV5IGFyZSBub3QgaW4gdXNlIGlzIHRoZXkgc3VwcG9ydApCQUNPLiAgVGhlIHJ1
bnRpbWUgcG0gY29kZSBpbiBhbWRncHUgd2FzIG9yaWdpbmFsbHkKZGV2ZWxvcGVkIGZvciBQWC9I
RyBsYXB0b3BzLCBzbyBpdCB3YXMgcHJldHR5IGVudGFuZ2xlZAp3aXRoIHRoZSB2Z2Ffc3dpdGNo
ZXJvbyBhbmQgQUNQSSBjb2RlLiAgU2luY2UgdGhlIEdQVQpjb250YWlucyBhbiBhdWRpbyBjb2Rl
YyBmb3IgSERNSS9EUCwgdGhlcmUgaXMgc29tZQppbnRlcmFjdGlvbiB3aXRoIHRoZSBoZGEgZHJp
dmVyLiAgSSBhbSBieSBubyBtZWFucyBhbgpleHBlcnQgb24gYWxzYSwgc28gYW55IGFkdmljZSBv
biB0aG9zZSBwYXRjaGVzIGlzIG11Y2gKYXBwcmVjaWF0ZWQuICBJIGhhZCB0byBlbmFibGUgcnVu
dGltZSBwbSBvbiB0aGUgaGRhCmRldmljZSB0byBhbGxvdyB0aGUgR1BVIHRvIGVudGVyIHJ1bnRp
bWUgcG0gYmVjYXVzZQp0aGV5IGFyZSBsaW5rZWQuCgpUaGVzZSBwYXRjaGVzIGRlcGVuZCBvbiB0
aGUgY2xlYW4gcGF0Y2hlcyBhbmQgQ0kvVkkKQkFDTyBwYXRjaGVzIEkgc2VudCBvdXQgZWFybGll
ciB0b2RheS4KClRoZSBmdWxsIHRyZWUgY2FuIGJlIGZvdW5kIGhlcmU6Cmh0dHBzOi8vY2dpdC5m
cmVlZGVza3RvcC5vcmcvfmFnZDVmL2xpbnV4L2xvZy8/aD1iYWNvCgpUT0RPOgotIFR1cm4gb2Zm
IHJ1bnRpbWUgcG0gd2hlbiBLRkQgaXMgYWN0aXZlCi0gTWFrZSBzdXJlIGF1ZGlvIHN0aWxsIHdv
cmtzCi0gTWFrZSBzdXJlIFBYL0hHIHN0aWxsIHdvcmtzCgpBbGV4IERldWNoZXIgKDE5KToKICBk
cm0vYW1kZ3B1OiBhZGQgYXNpYyBjYWxsYmFjayBmb3IgQkFDTyBzdXBwb3J0CiAgZHJtL2FtZGdw
dTogYWRkIHN1cHBvcnRzX2JhY28gY2FsbGJhY2sgZm9yIHNvYzE1IGFzaWNzLgogIGRybS9hbWRn
cHU6IGFkZCBzdXBwb3J0c19iYWNvIGNhbGxiYWNrIGZvciBTSSBhc2ljcy4KICBkcm0vYW1kZ3B1
OiBhZGQgc3VwcG9ydHNfYmFjbyBjYWxsYmFjayBmb3IgQ0lLIGFzaWNzLgogIGRybS9hbWRncHU6
IGFkZCBzdXBwb3J0c19iYWNvIGNhbGxiYWNrIGZvciBWSSBhc2ljcy4KICBkcm0vYW1kZ3B1OiBh
ZGQgc3VwcG9ydHNfYmFjbyBjYWxsYmFjayBmb3IgTlYgYXNpY3MuCiAgZHJtL2FtZGdwdTogYWRk
IGEgYW1kZ3B1X2RldmljZV9zdXBwb3J0c19iYWNvIGhlbHBlcgogIGRybS9hbWRncHU6IHJlbmFt
ZSBhbWRncHVfZGV2aWNlX2lzX3B4IHRvIGFtZGdwdV9kZXZpY2Vfc3VwcG9ydHNfYm9jbwogIGRy
bS9hbWRncHU6IGFkZCBhZGRpdGlvbmFsIGJvY28gY2hlY2tzIHRvIHJ1bnRpbWUgc3VzcGVuZC9y
ZXN1bWUKICBkcm0vYW1kZ3B1OiBzcGxpdCBzd1NNVSBiYWNvX3Jlc2V0IGludG8gZW50ZXIgYW5k
IGV4aXQKICBkcm0vYW1kZ3B1OiBhZGQgaGVscGVycyBmb3IgYmFjbyBlbnRyeSBhbmQgZXhpdAog
IGRybS9hbWRncHU6IGFkZCBiYWNvIHN1cHBvcnQgdG8gcnVudGltZSBzdXNwZW5kL3Jlc3VtZQog
IGRybS9hbWRncHU6IHN0YXJ0IHRvIGRpc2VudGFuZ2xlIGJvY28gZnJvbSBydW50aW1lIHBtCiAg
ZHJtL2FtZGdwdTogZGlzZW50YW5nbGUgcnVudGltZSBwbSBhbmQgdmdhX3N3aXRjaGVyb28KICBk
cm0vYW1kZ3B1OiBlbmFibGUgcnVudGltZSBwbSBvbiBCQUNPIGNhcGFibGUgYm9hcmRzIGlmIHJ1
bnBtPTEKICBkcm0vYW1kZ3B1L3J1bnBtOiBlbmFibGUgcnVucG0gb24gYmFjbyBjYXBhYmxlIFZJ
KyBhc2ljcwogIEFMU0E6IGhkYS9oZG1pIC0gZml4IHZnYXN3aXRjaGVyb28gZGV0ZWN0aW9uIGZv
ciBBTUQKICBBTFNBOiBoZGEvaGRtaSAtIGVuYWJsZSBydW50aW1lIHBtIGZvciBuZXdlciBBTUQg
ZGlzcGxheSBhdWRpbwogIEFMU0E6IGhkYS9oZG1pIC0gZW5hYmxlIGF1dG9tYXRpYyBydW50aW1l
IHBtIGZvciBBTUQgSERNSSBjb2RlY3MgYnkKICAgIGRlZmF1bHQKCiBkcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHUuaCAgICAgICAgICAgfCAgMTIgKy0KIGRyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYyAgICB8IDEwNiArKysrKysrKysrKysrKysrLS0KIGRy
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYyAgICAgICB8ICA2NCArKysrKyst
LS0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2ttcy5jICAgICAgIHwgIDIw
ICsrKy0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Npay5jICAgICAgICAgICAgICB8ICAx
OCArKysKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L252LmMgICAgICAgICAgICAgICB8ICAx
OCArKy0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NpLmMgICAgICAgICAgICAgICB8ICAg
NiArCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zb2MxNS5jICAgICAgICAgICAgfCAgMzcg
KysrKystCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92aS5jICAgICAgICAgICAgICAgfCAg
MjIgKysrKwogLi4uL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvYW1kZ3B1X3NtdS5oICAgIHwg
ICA5ICstCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVfdjExXzAuYyAgICAgfCAg
MTIgKy0KIHNvdW5kL3BjaS9oZGEvaGRhX2ludGVsLmMgICAgICAgICAgICAgICAgICAgICB8ICA3
NCArKysrKysrKysrKy0KIHNvdW5kL3BjaS9oZGEvcGF0Y2hfaGRtaS5jICAgICAgICAgICAgICAg
ICAgICB8ICAgMSArCiAxMyBmaWxlcyBjaGFuZ2VkLCAzNDMgaW5zZXJ0aW9ucygrKSwgNTYgZGVs
ZXRpb25zKC0pCgotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ft
ZC1nZng=
