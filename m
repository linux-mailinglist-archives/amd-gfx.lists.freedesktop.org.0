Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B1CF9B23
	for <lists+amd-gfx@lfdr.de>; Tue, 12 Nov 2019 21:46:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17BE86EBD7;
	Tue, 12 Nov 2019 20:46:44 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qv1-xf44.google.com (mail-qv1-xf44.google.com
 [IPv6:2607:f8b0:4864:20::f44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F6C46EBDD
 for <amd-gfx@lists.freedesktop.org>; Tue, 12 Nov 2019 20:22:54 +0000 (UTC)
Received: by mail-qv1-xf44.google.com with SMTP id i3so6765742qvv.7
 for <amd-gfx@lists.freedesktop.org>; Tue, 12 Nov 2019 12:22:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PZrtIQ1CqQ3aV6eDiT4AIT6dNu/ovkVG0MAXXUVRQPA=;
 b=gnvKnW/x+SG0PAs2z96Z+aXOrjulYMLjKVv0lTLnSU8Pf7WOLOaUNS8VJxnuL2+zrO
 nObX0PvFh0K6TGTmHX3WOi1H0Wl60Z/IiSMXSIIKLMOaFFLmcyaPw8TLdHXleourpBE8
 /WULITv1w1Y9dgPaQMZ2FpbHxXqDE9gqn5bkkic8MDHjp8dcYOSFPNk6JiPbOOpA7VIg
 kwJo4Xa2xeia1Z4tXDTcj+wvcifBXbR3q8jss1Mn7K4Q4/S7GvZ8hRSsa4dOEbnDjUbR
 0F7Mi+8XNW6I+OSbQ3FC6zloIVeVOVSbPKpm8njzKu77kDR0Of1YRSECCYWKx5xFHWgt
 154Q==
X-Gm-Message-State: APjAAAVoPzGt812AEdsK28GeFShTbCaY0f1lcf19ZOdhTV2v+WVkDbuO
 MUWIWWPqSk//AJhjZnIz3aE8dQ==
X-Google-Smtp-Source: APXvYqwjHVASiImpnLd/ILwe5StdJi3zozsyC3ebdiRQZc5AWQDBgQKjG4QUL+HhygmNxsbKFK0SMQ==
X-Received: by 2002:ad4:53ab:: with SMTP id j11mr5278002qvv.47.1573590173518; 
 Tue, 12 Nov 2019 12:22:53 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-162-113-180.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.113.180])
 by smtp.gmail.com with ESMTPSA id y33sm14091065qta.18.2019.11.12.12.22.48
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 12 Nov 2019 12:22:48 -0800 (PST)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1iUcgZ-0003kZ-Kj; Tue, 12 Nov 2019 16:22:47 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: linux-mm@kvack.org, Jerome Glisse <jglisse@redhat.com>,
 Ralph Campbell <rcampbell@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 Felix.Kuehling@amd.com
Subject: [PATCH v3 11/14] drm/amdgpu: Use mmu_interval_insert instead of
 hmm_mirror
Date: Tue, 12 Nov 2019 16:22:28 -0400
Message-Id: <20191112202231.3856-12-jgg@ziepe.ca>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191112202231.3856-1-jgg@ziepe.ca>
References: <20191112202231.3856-1-jgg@ziepe.ca>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 12 Nov 2019 20:46:43 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PZrtIQ1CqQ3aV6eDiT4AIT6dNu/ovkVG0MAXXUVRQPA=;
 b=N5sdBv6BsoyFRqhiisu/umdYUbVy9Q0vhIpmeXK0k1Z2n976NtwEGSe4f6xaVeM9aI
 0iie8PeQxU6Pzl7PaExiv5wXSdCmcakfQQYqtL301GS/N6tmsTuOCxyh5Z4J2Bx5LI9m
 hZ4ACJgY65YwCw1ca0bak+o9en98SxP+zjmcbIJZPCTLYUFbr1VHsequPzlbRw2PEpUT
 2Ckc1P6jvX312NS5kcr5DuEEPeQLvwDvBBXNW4q4UHyiDRaRhTqT9pCJpwlIbkJ6jBE4
 8jvzjAPKLI0LwepsLvXIgFWuCUpUgBzKcRXeCAmU8vxboEVzSYCAKwi2mLcjpWBsqfMs
 WaVw==
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
Cc: Juergen Gross <jgross@suse.com>, David Zhou <David1.Zhou@amd.com>,
 Mike Marciniszyn <mike.marciniszyn@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Philip Yang <Philip.Yang@amd.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 linux-rdma@vger.kernel.org, nouveau@lists.freedesktop.org,
 Dennis Dalessandro <dennis.dalessandro@intel.com>,
 amd-gfx@lists.freedesktop.org, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@mellanox.com>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Petr Cvek <petrcvekcz@gmail.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgoKUmVtb3ZlIHRoZSBpbnRl
cnZhbCB0cmVlIGluIHRoZSBkcml2ZXIgYW5kIHJlbHkgb24gdGhlIHRyZWUgbWFpbnRhaW5lZCBi
eQp0aGUgbW11X25vdGlmaWVyIGZvciBkZWxpdmVyaW5nIG1tdV9ub3RpZmllciBpbnZhbGlkYXRp
b24gY2FsbGJhY2tzLgoKRm9yIHNvbWUgcmVhc29uIGFtZGdwdSBoYXMgYSB2ZXJ5IGNvbXBsaWNh
dGVkIGFycmFuZ2VtZW50IHdoZXJlIGl0IHRyaWVzCnRvIHByZXZlbnQgZHVwbGljYXRlIGVudHJp
ZXMgaW4gdGhlIGludGVydmFsX3RyZWUsIHRoaXMgaXMgbm90IG5lY2Vzc2FyeSwKZWFjaCBhbWRn
cHVfYm8gY2FuIGJlIGl0cyBvd24gc3RhbmQgYWxvbmUgZW50cnkuIGludGVydmFsX3RyZWUgYWxy
ZWFkeQphbGxvd3MgZHVwbGljYXRlcyBhbmQgb3ZlcmxhcHMgaW4gdGhlIHRyZWUuCgpBbHNvLCB0
aGVyZSBpcyBubyBuZWVkIHRvIHJlbW92ZSBlbnRyaWVzIHVwb24gYSByZWxlYXNlIGNhbGxiYWNr
LCB0aGUKbW11X2ludGVydmFsIEFQSSBzYWZlbHkgYWxsb3dzIG9iamVjdHMgdG8gcmVtYWluIHJl
Z2lzdGVyZWQgYmV5b25kIHRoZQpsaWZldGltZSBvZiB0aGUgbW0uIFRoZSBkcml2ZXIgb25seSBo
YXMgdG8gc3RvcCB0b3VjaGluZyB0aGUgcGFnZXMgZHVyaW5nCnJlbGVhc2UuCgpSZXZpZXdlZC1i
eTogUGhpbGlwIFlhbmcgPFBoaWxpcC5ZYW5nQGFtZC5jb20+ClRlc3RlZC1ieTogUGhpbGlwIFlh
bmcgPFBoaWxpcC5ZYW5nQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEphc29uIEd1bnRob3JwZSA8
amdnQG1lbGxhbm94LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHUu
aCAgICAgICAgICAgfCAgIDIgKwogLi4uL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2Zk
X2dwdXZtLmMgIHwgICA1ICstCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2
aWNlLmMgICAgfCAgIDEgKwogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X21uLmMg
ICAgICAgIHwgMzMzICsrKystLS0tLS0tLS0tLS0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X21uLmggICAgICAgIHwgICA0IC0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9vYmplY3QuaCAgICB8ICAxMyArLQogNiBmaWxlcyBjaGFuZ2VkLCA3NyBpbnNlcnRp
b25zKCspLCAyODEgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1LmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHUuaApp
bmRleCBiZDM3ZGY1ZGQ2ZDA0OC4uNjA1OTFhNWQ0MjAwMjEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdS5oCkBAIC0xMDA2LDYgKzEwMDYsOCBAQCBzdHJ1Y3QgYW1kZ3B1X2RldmljZSB7
CiAJc3RydWN0IG11dGV4ICBsb2NrX3Jlc2V0OwogCXN0cnVjdCBhbWRncHVfZG9vcmJlbGxfaW5k
ZXggZG9vcmJlbGxfaW5kZXg7CiAKKwlzdHJ1Y3QgbXV0ZXgJCQlub3RpZmllcl9sb2NrOworCiAJ
aW50IGFzaWNfcmVzZXRfcmVzOwogCXN0cnVjdCB3b3JrX3N0cnVjdAkJeGdtaV9yZXNldF93b3Jr
OwogCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2Zk
X2dwdXZtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkX2dwdXZt
LmMKaW5kZXggNmQwMjFlY2M4ZDU5OGYuLjQ3NzAwMzAyYTA4YjdmIDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkX2dwdXZtLmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZF9ncHV2bS5jCkBAIC00ODEsOCArNDgx
LDcgQEAgc3RhdGljIHZvaWQgcmVtb3ZlX2tnZF9tZW1fZnJvbV9rZmRfYm9fbGlzdChzdHJ1Y3Qg
a2dkX21lbSAqbWVtLAogICoKICAqIFJldHVybnMgMCBmb3Igc3VjY2VzcywgbmVnYXRpdmUgZXJy
bm8gZm9yIGVycm9ycy4KICAqLwotc3RhdGljIGludCBpbml0X3VzZXJfcGFnZXMoc3RydWN0IGtn
ZF9tZW0gKm1lbSwgc3RydWN0IG1tX3N0cnVjdCAqbW0sCi0JCQkgICB1aW50NjRfdCB1c2VyX2Fk
ZHIpCitzdGF0aWMgaW50IGluaXRfdXNlcl9wYWdlcyhzdHJ1Y3Qga2dkX21lbSAqbWVtLCB1aW50
NjRfdCB1c2VyX2FkZHIpCiB7CiAJc3RydWN0IGFtZGtmZF9wcm9jZXNzX2luZm8gKnByb2Nlc3Nf
aW5mbyA9IG1lbS0+cHJvY2Vzc19pbmZvOwogCXN0cnVjdCBhbWRncHVfYm8gKmJvID0gbWVtLT5i
bzsKQEAgLTExOTUsNyArMTE5NCw3IEBAIGludCBhbWRncHVfYW1ka2ZkX2dwdXZtX2FsbG9jX21l
bW9yeV9vZl9ncHUoCiAJYWRkX2tnZF9tZW1fdG9fa2ZkX2JvX2xpc3QoKm1lbSwgYXZtLT5wcm9j
ZXNzX2luZm8sIHVzZXJfYWRkcik7CiAKIAlpZiAodXNlcl9hZGRyKSB7Ci0JCXJldCA9IGluaXRf
dXNlcl9wYWdlcygqbWVtLCBjdXJyZW50LT5tbSwgdXNlcl9hZGRyKTsKKwkJcmV0ID0gaW5pdF91
c2VyX3BhZ2VzKCptZW0sIHVzZXJfYWRkcik7CiAJCWlmIChyZXQpCiAJCQlnb3RvIGFsbG9jYXRl
X2luaXRfdXNlcl9wYWdlc19mYWlsZWQ7CiAJfQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X2RldmljZS5jCmluZGV4IDVhMTkzOWRiZDRlM2U2Li4zOGY5Nzk5OGFhZGRiMiAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYwpAQCAtMjYzMyw2ICsy
NjMzLDcgQEAgaW50IGFtZGdwdV9kZXZpY2VfaW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRl
diwKIAltdXRleF9pbml0KCZhZGV2LT52aXJ0LnZmX2Vycm9ycy5sb2NrKTsKIAloYXNoX2luaXQo
YWRldi0+bW5faGFzaCk7CiAJbXV0ZXhfaW5pdCgmYWRldi0+bG9ja19yZXNldCk7CisJbXV0ZXhf
aW5pdCgmYWRldi0+bm90aWZpZXJfbG9jayk7CiAJbXV0ZXhfaW5pdCgmYWRldi0+dmlydC5kcG1f
bXV0ZXgpOwogCW11dGV4X2luaXQoJmFkZXYtPnBzcC5tdXRleCk7CiAKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9tbi5jIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X21uLmMKaW5kZXggMzFkNGRlYjVkMjk0ODQuLjlmZTFjMzFjZTE3YTMw
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfbW4uYworKysg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfbW4uYwpAQCAtNTAsNjYgKzUwLDYg
QEAKICNpbmNsdWRlICJhbWRncHUuaCIKICNpbmNsdWRlICJhbWRncHVfYW1ka2ZkLmgiCiAKLS8q
KgotICogc3RydWN0IGFtZGdwdV9tbl9ub2RlCi0gKgotICogQGl0OiBpbnRlcnZhbCBub2RlIGRl
ZmluaW5nIHN0YXJ0LWxhc3Qgb2YgdGhlIGFmZmVjdGVkIGFkZHJlc3MgcmFuZ2UKLSAqIEBib3M6
IGxpc3Qgb2YgYWxsIEJPcyBpbiB0aGUgYWZmZWN0ZWQgYWRkcmVzcyByYW5nZQotICoKLSAqIE1h
bmFnZXMgYWxsIEJPcyB3aGljaCBhcmUgYWZmZWN0ZWQgb2YgYSBjZXJ0YWluIHJhbmdlIG9mIGFk
ZHJlc3Mgc3BhY2UuCi0gKi8KLXN0cnVjdCBhbWRncHVfbW5fbm9kZSB7Ci0Jc3RydWN0IGludGVy
dmFsX3RyZWVfbm9kZQlpdDsKLQlzdHJ1Y3QgbGlzdF9oZWFkCQlib3M7Ci19OwotCi0vKioKLSAq
IGFtZGdwdV9tbl9kZXN0cm95IC0gZGVzdHJveSB0aGUgSE1NIG1pcnJvcgotICoKLSAqIEB3b3Jr
OiBwcmV2aW91c2x5IHNoZWR1bGVkIHdvcmsgaXRlbQotICoKLSAqIExhenkgZGVzdHJveXMgdGhl
IG5vdGlmaWVyIGZyb20gYSB3b3JrIGl0ZW0KLSAqLwotc3RhdGljIHZvaWQgYW1kZ3B1X21uX2Rl
c3Ryb3koc3RydWN0IHdvcmtfc3RydWN0ICp3b3JrKQotewotCXN0cnVjdCBhbWRncHVfbW4gKmFt
biA9IGNvbnRhaW5lcl9vZih3b3JrLCBzdHJ1Y3QgYW1kZ3B1X21uLCB3b3JrKTsKLQlzdHJ1Y3Qg
YW1kZ3B1X2RldmljZSAqYWRldiA9IGFtbi0+YWRldjsKLQlzdHJ1Y3QgYW1kZ3B1X21uX25vZGUg
Km5vZGUsICpuZXh0X25vZGU7Ci0Jc3RydWN0IGFtZGdwdV9ibyAqYm8sICpuZXh0X2JvOwotCi0J
bXV0ZXhfbG9jaygmYWRldi0+bW5fbG9jayk7Ci0JZG93bl93cml0ZSgmYW1uLT5sb2NrKTsKLQlo
YXNoX2RlbCgmYW1uLT5ub2RlKTsKLQlyYnRyZWVfcG9zdG9yZGVyX2Zvcl9lYWNoX2VudHJ5X3Nh
ZmUobm9kZSwgbmV4dF9ub2RlLAotCQkJCQkgICAgICZhbW4tPm9iamVjdHMucmJfcm9vdCwgaXQu
cmIpIHsKLQkJbGlzdF9mb3JfZWFjaF9lbnRyeV9zYWZlKGJvLCBuZXh0X2JvLCAmbm9kZS0+Ym9z
LCBtbl9saXN0KSB7Ci0JCQliby0+bW4gPSBOVUxMOwotCQkJbGlzdF9kZWxfaW5pdCgmYm8tPm1u
X2xpc3QpOwotCQl9Ci0JCWtmcmVlKG5vZGUpOwotCX0KLQl1cF93cml0ZSgmYW1uLT5sb2NrKTsK
LQltdXRleF91bmxvY2soJmFkZXYtPm1uX2xvY2spOwotCi0JaG1tX21pcnJvcl91bnJlZ2lzdGVy
KCZhbW4tPm1pcnJvcik7Ci0Ja2ZyZWUoYW1uKTsKLX0KLQotLyoqCi0gKiBhbWRncHVfaG1tX21p
cnJvcl9yZWxlYXNlIC0gY2FsbGJhY2sgdG8gbm90aWZ5IGFib3V0IG1tIGRlc3RydWN0aW9uCi0g
KgotICogQG1pcnJvcjogdGhlIEhNTSBtaXJyb3IgKG1tKSB0aGlzIGNhbGxiYWNrIGlzIGFib3V0
Ci0gKgotICogU2hlZHVsZSBhIHdvcmsgaXRlbSB0byBsYXp5IGRlc3Ryb3kgSE1NIG1pcnJvci4K
LSAqLwotc3RhdGljIHZvaWQgYW1kZ3B1X2htbV9taXJyb3JfcmVsZWFzZShzdHJ1Y3QgaG1tX21p
cnJvciAqbWlycm9yKQotewotCXN0cnVjdCBhbWRncHVfbW4gKmFtbiA9IGNvbnRhaW5lcl9vZiht
aXJyb3IsIHN0cnVjdCBhbWRncHVfbW4sIG1pcnJvcik7Ci0KLQlJTklUX1dPUksoJmFtbi0+d29y
aywgYW1kZ3B1X21uX2Rlc3Ryb3kpOwotCXNjaGVkdWxlX3dvcmsoJmFtbi0+d29yayk7Ci19Ci0K
IC8qKgogICogYW1kZ3B1X21uX2xvY2sgLSB0YWtlIHRoZSB3cml0ZSBzaWRlIGxvY2sgZm9yIHRo
aXMgbm90aWZpZXIKICAqCkBAIC0xMzMsMTU3ICs3Myw4MCBAQCB2b2lkIGFtZGdwdV9tbl91bmxv
Y2soc3RydWN0IGFtZGdwdV9tbiAqbW4pCiB9CiAKIC8qKgotICogYW1kZ3B1X21uX3JlYWRfbG9j
ayAtIHRha2UgdGhlIHJlYWQgc2lkZSBsb2NrIGZvciB0aGlzIG5vdGlmaWVyCi0gKgotICogQGFt
bjogb3VyIG5vdGlmaWVyCi0gKi8KLXN0YXRpYyBpbnQgYW1kZ3B1X21uX3JlYWRfbG9jayhzdHJ1
Y3QgYW1kZ3B1X21uICphbW4sIGJvb2wgYmxvY2thYmxlKQotewotCWlmIChibG9ja2FibGUpCi0J
CWRvd25fcmVhZCgmYW1uLT5sb2NrKTsKLQllbHNlIGlmICghZG93bl9yZWFkX3RyeWxvY2soJmFt
bi0+bG9jaykpCi0JCXJldHVybiAtRUFHQUlOOwotCi0JcmV0dXJuIDA7Ci19Ci0KLS8qKgotICog
YW1kZ3B1X21uX3JlYWRfdW5sb2NrIC0gZHJvcCB0aGUgcmVhZCBzaWRlIGxvY2sgZm9yIHRoaXMg
bm90aWZpZXIKLSAqCi0gKiBAYW1uOiBvdXIgbm90aWZpZXIKLSAqLwotc3RhdGljIHZvaWQgYW1k
Z3B1X21uX3JlYWRfdW5sb2NrKHN0cnVjdCBhbWRncHVfbW4gKmFtbikKLXsKLQl1cF9yZWFkKCZh
bW4tPmxvY2spOwotfQotCi0vKioKLSAqIGFtZGdwdV9tbl9pbnZhbGlkYXRlX25vZGUgLSB1bm1h
cCBhbGwgQk9zIG9mIGEgbm9kZQorICogYW1kZ3B1X21uX2ludmFsaWRhdGVfZ2Z4IC0gY2FsbGJh
Y2sgdG8gbm90aWZ5IGFib3V0IG1tIGNoYW5nZQogICoKLSAqIEBub2RlOiB0aGUgbm9kZSB3aXRo
IHRoZSBCT3MgdG8gdW5tYXAKLSAqIEBzdGFydDogc3RhcnQgb2YgYWRkcmVzcyByYW5nZSBhZmZl
Y3RlZAotICogQGVuZDogZW5kIG9mIGFkZHJlc3MgcmFuZ2UgYWZmZWN0ZWQKKyAqIEBtbmk6IHRo
ZSByYW5nZSAobW0pIGlzIGFib3V0IHRvIHVwZGF0ZQorICogQHJhbmdlOiBkZXRhaWxzIG9uIHRo
ZSBpbnZhbGlkYXRpb24KKyAqIEBjdXJfc2VxOiBWYWx1ZSB0byBwYXNzIHRvIG1tdV9pbnRlcnZh
bF9zZXRfc2VxKCkKICAqCiAgKiBCbG9jayBmb3Igb3BlcmF0aW9ucyBvbiBCT3MgdG8gZmluaXNo
IGFuZCBtYXJrIHBhZ2VzIGFzIGFjY2Vzc2VkIGFuZAogICogcG90ZW50aWFsbHkgZGlydHkuCiAg
Ki8KLXN0YXRpYyB2b2lkIGFtZGdwdV9tbl9pbnZhbGlkYXRlX25vZGUoc3RydWN0IGFtZGdwdV9t
bl9ub2RlICpub2RlLAotCQkJCSAgICAgIHVuc2lnbmVkIGxvbmcgc3RhcnQsCi0JCQkJICAgICAg
dW5zaWduZWQgbG9uZyBlbmQpCitzdGF0aWMgYm9vbCBhbWRncHVfbW5faW52YWxpZGF0ZV9nZngo
c3RydWN0IG1tdV9pbnRlcnZhbF9ub3RpZmllciAqbW5pLAorCQkJCSAgICAgY29uc3Qgc3RydWN0
IG1tdV9ub3RpZmllcl9yYW5nZSAqcmFuZ2UsCisJCQkJICAgICB1bnNpZ25lZCBsb25nIGN1cl9z
ZXEpCiB7Ci0Jc3RydWN0IGFtZGdwdV9ibyAqYm87CisJc3RydWN0IGFtZGdwdV9ibyAqYm8gPSBj
b250YWluZXJfb2YobW5pLCBzdHJ1Y3QgYW1kZ3B1X2JvLCBub3RpZmllcik7CisJc3RydWN0IGFt
ZGdwdV9kZXZpY2UgKmFkZXYgPSBhbWRncHVfdHRtX2FkZXYoYm8tPnRiby5iZGV2KTsKIAlsb25n
IHI7CiAKLQlsaXN0X2Zvcl9lYWNoX2VudHJ5KGJvLCAmbm9kZS0+Ym9zLCBtbl9saXN0KSB7Ci0K
LQkJaWYgKCFhbWRncHVfdHRtX3R0X2FmZmVjdF91c2VycHRyKGJvLT50Ym8udHRtLCBzdGFydCwg
ZW5kKSkKLQkJCWNvbnRpbnVlOworCWlmICghbW11X25vdGlmaWVyX3JhbmdlX2Jsb2NrYWJsZShy
YW5nZSkpCisJCXJldHVybiBmYWxzZTsKIAotCQlyID0gZG1hX3Jlc3Zfd2FpdF90aW1lb3V0X3Jj
dShiby0+dGJvLmJhc2UucmVzdiwKLQkJCXRydWUsIGZhbHNlLCBNQVhfU0NIRURVTEVfVElNRU9V
VCk7Ci0JCWlmIChyIDw9IDApCi0JCQlEUk1fRVJST1IoIiglbGQpIGZhaWxlZCB0byB3YWl0IGZv
ciB1c2VyIGJvXG4iLCByKTsKLQl9CisJbXV0ZXhfbG9jaygmYWRldi0+bm90aWZpZXJfbG9jayk7
CisJciA9IGRtYV9yZXN2X3dhaXRfdGltZW91dF9yY3UoYm8tPnRiby5iYXNlLnJlc3YsIHRydWUs
IGZhbHNlLAorCQkJCSAgICAgIE1BWF9TQ0hFRFVMRV9USU1FT1VUKTsKKwltdXRleF91bmxvY2so
JmFkZXYtPm5vdGlmaWVyX2xvY2spOworCWlmIChyIDw9IDApCisJCURSTV9FUlJPUigiKCVsZCkg
ZmFpbGVkIHRvIHdhaXQgZm9yIHVzZXIgYm9cbiIsIHIpOworCXJldHVybiB0cnVlOwogfQogCitz
dGF0aWMgY29uc3Qgc3RydWN0IG1tdV9pbnRlcnZhbF9ub3RpZmllcl9vcHMgYW1kZ3B1X21uX2dm
eF9vcHMgPSB7CisJLmludmFsaWRhdGUgPSBhbWRncHVfbW5faW52YWxpZGF0ZV9nZngsCit9Owor
CiAvKioKLSAqIGFtZGdwdV9tbl9zeW5jX3BhZ2V0YWJsZXNfZ2Z4IC0gY2FsbGJhY2sgdG8gbm90
aWZ5IGFib3V0IG1tIGNoYW5nZQorICogYW1kZ3B1X21uX2ludmFsaWRhdGVfaHNhIC0gY2FsbGJh
Y2sgdG8gbm90aWZ5IGFib3V0IG1tIGNoYW5nZQogICoKLSAqIEBtaXJyb3I6IHRoZSBobW1fbWly
cm9yIChtbSkgaXMgYWJvdXQgdG8gdXBkYXRlCi0gKiBAdXBkYXRlOiB0aGUgdXBkYXRlIHN0YXJ0
LCBlbmQgYWRkcmVzcworICogQG1uaTogdGhlIHJhbmdlIChtbSkgaXMgYWJvdXQgdG8gdXBkYXRl
CisgKiBAcmFuZ2U6IGRldGFpbHMgb24gdGhlIGludmFsaWRhdGlvbgorICogQGN1cl9zZXE6IFZh
bHVlIHRvIHBhc3MgdG8gbW11X2ludGVydmFsX3NldF9zZXEoKQogICoKLSAqIEJsb2NrIGZvciBv
cGVyYXRpb25zIG9uIEJPcyB0byBmaW5pc2ggYW5kIG1hcmsgcGFnZXMgYXMgYWNjZXNzZWQgYW5k
Ci0gKiBwb3RlbnRpYWxseSBkaXJ0eS4KKyAqIFdlIHRlbXBvcmFyaWx5IGV2aWN0IHRoZSBCTyBh
dHRhY2hlZCB0byB0aGlzIHJhbmdlLiBUaGlzIG5lY2Vzc2l0YXRlcworICogZXZpY3RpbmcgYWxs
IHVzZXItbW9kZSBxdWV1ZXMgb2YgdGhlIHByb2Nlc3MuCiAgKi8KLXN0YXRpYyBpbnQKLWFtZGdw
dV9tbl9zeW5jX3BhZ2V0YWJsZXNfZ2Z4KHN0cnVjdCBobW1fbWlycm9yICptaXJyb3IsCi0JCQkg
ICAgICBjb25zdCBzdHJ1Y3QgbW11X25vdGlmaWVyX3JhbmdlICp1cGRhdGUpCitzdGF0aWMgYm9v
bCBhbWRncHVfbW5faW52YWxpZGF0ZV9oc2Eoc3RydWN0IG1tdV9pbnRlcnZhbF9ub3RpZmllciAq
bW5pLAorCQkJCSAgICAgY29uc3Qgc3RydWN0IG1tdV9ub3RpZmllcl9yYW5nZSAqcmFuZ2UsCisJ
CQkJICAgICB1bnNpZ25lZCBsb25nIGN1cl9zZXEpCiB7Ci0Jc3RydWN0IGFtZGdwdV9tbiAqYW1u
ID0gY29udGFpbmVyX29mKG1pcnJvciwgc3RydWN0IGFtZGdwdV9tbiwgbWlycm9yKTsKLQl1bnNp
Z25lZCBsb25nIHN0YXJ0ID0gdXBkYXRlLT5zdGFydDsKLQl1bnNpZ25lZCBsb25nIGVuZCA9IHVw
ZGF0ZS0+ZW5kOwotCWJvb2wgYmxvY2thYmxlID0gbW11X25vdGlmaWVyX3JhbmdlX2Jsb2NrYWJs
ZSh1cGRhdGUpOwotCXN0cnVjdCBpbnRlcnZhbF90cmVlX25vZGUgKml0OwotCi0JLyogbm90aWZp
Y2F0aW9uIGlzIGV4Y2x1c2l2ZSwgYnV0IGludGVydmFsIGlzIGluY2x1c2l2ZSAqLwotCWVuZCAt
PSAxOwotCi0JLyogVE9ETyB3ZSBzaG91bGQgYmUgYWJsZSB0byBzcGxpdCBsb2NraW5nIGZvciBp
bnRlcnZhbCB0cmVlIGFuZAotCSAqIGFtZGdwdV9tbl9pbnZhbGlkYXRlX25vZGUKLQkgKi8KLQlp
ZiAoYW1kZ3B1X21uX3JlYWRfbG9jayhhbW4sIGJsb2NrYWJsZSkpCi0JCXJldHVybiAtRUFHQUlO
OwotCi0JaXQgPSBpbnRlcnZhbF90cmVlX2l0ZXJfZmlyc3QoJmFtbi0+b2JqZWN0cywgc3RhcnQs
IGVuZCk7Ci0Jd2hpbGUgKGl0KSB7Ci0JCXN0cnVjdCBhbWRncHVfbW5fbm9kZSAqbm9kZTsKLQot
CQlpZiAoIWJsb2NrYWJsZSkgewotCQkJYW1kZ3B1X21uX3JlYWRfdW5sb2NrKGFtbik7Ci0JCQly
ZXR1cm4gLUVBR0FJTjsKLQkJfQotCi0JCW5vZGUgPSBjb250YWluZXJfb2YoaXQsIHN0cnVjdCBh
bWRncHVfbW5fbm9kZSwgaXQpOwotCQlpdCA9IGludGVydmFsX3RyZWVfaXRlcl9uZXh0KGl0LCBz
dGFydCwgZW5kKTsKKwlzdHJ1Y3QgYW1kZ3B1X2JvICpibyA9IGNvbnRhaW5lcl9vZihtbmksIHN0
cnVjdCBhbWRncHVfYm8sIG5vdGlmaWVyKTsKKwlzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiA9
IGFtZGdwdV90dG1fYWRldihiby0+dGJvLmJkZXYpOwogCi0JCWFtZGdwdV9tbl9pbnZhbGlkYXRl
X25vZGUobm9kZSwgc3RhcnQsIGVuZCk7Ci0JfQorCWlmICghbW11X25vdGlmaWVyX3JhbmdlX2Js
b2NrYWJsZShyYW5nZSkpCisJCXJldHVybiBmYWxzZTsKIAotCWFtZGdwdV9tbl9yZWFkX3VubG9j
ayhhbW4pOworCW11dGV4X2xvY2soJmFkZXYtPm5vdGlmaWVyX2xvY2spOworCWFtZGdwdV9hbWRr
ZmRfZXZpY3RfdXNlcnB0cihiby0+a2ZkX2JvLCBiby0+bm90aWZpZXIubW0pOworCW11dGV4X3Vu
bG9jaygmYWRldi0+bm90aWZpZXJfbG9jayk7CiAKLQlyZXR1cm4gMDsKKwlyZXR1cm4gdHJ1ZTsK
IH0KIAotLyoqCi0gKiBhbWRncHVfbW5fc3luY19wYWdldGFibGVzX2hzYSAtIGNhbGxiYWNrIHRv
IG5vdGlmeSBhYm91dCBtbSBjaGFuZ2UKLSAqCi0gKiBAbWlycm9yOiB0aGUgaG1tX21pcnJvciAo
bW0pIGlzIGFib3V0IHRvIHVwZGF0ZQotICogQHVwZGF0ZTogdGhlIHVwZGF0ZSBzdGFydCwgZW5k
IGFkZHJlc3MKLSAqCi0gKiBXZSB0ZW1wb3JhcmlseSBldmljdCBhbGwgQk9zIGJldHdlZW4gc3Rh
cnQgYW5kIGVuZC4gVGhpcwotICogbmVjZXNzaXRhdGVzIGV2aWN0aW5nIGFsbCB1c2VyLW1vZGUg
cXVldWVzIG9mIHRoZSBwcm9jZXNzLiBUaGUgQk9zCi0gKiBhcmUgcmVzdG9ydGVkIGluIGFtZGdw
dV9tbl9pbnZhbGlkYXRlX3JhbmdlX2VuZF9oc2EuCi0gKi8KLXN0YXRpYyBpbnQKLWFtZGdwdV9t
bl9zeW5jX3BhZ2V0YWJsZXNfaHNhKHN0cnVjdCBobW1fbWlycm9yICptaXJyb3IsCi0JCQkgICAg
ICBjb25zdCBzdHJ1Y3QgbW11X25vdGlmaWVyX3JhbmdlICp1cGRhdGUpCitzdGF0aWMgY29uc3Qg
c3RydWN0IG1tdV9pbnRlcnZhbF9ub3RpZmllcl9vcHMgYW1kZ3B1X21uX2hzYV9vcHMgPSB7CisJ
LmludmFsaWRhdGUgPSBhbWRncHVfbW5faW52YWxpZGF0ZV9oc2EsCit9OworCitzdGF0aWMgaW50
IGFtZGdwdV9tbl9zeW5jX3BhZ2V0YWJsZXMoc3RydWN0IGhtbV9taXJyb3IgKm1pcnJvciwKKwkJ
CQkgICAgIGNvbnN0IHN0cnVjdCBtbXVfbm90aWZpZXJfcmFuZ2UgKnVwZGF0ZSkKIHsKIAlzdHJ1
Y3QgYW1kZ3B1X21uICphbW4gPSBjb250YWluZXJfb2YobWlycm9yLCBzdHJ1Y3QgYW1kZ3B1X21u
LCBtaXJyb3IpOwotCXVuc2lnbmVkIGxvbmcgc3RhcnQgPSB1cGRhdGUtPnN0YXJ0OwotCXVuc2ln
bmVkIGxvbmcgZW5kID0gdXBkYXRlLT5lbmQ7Ci0JYm9vbCBibG9ja2FibGUgPSBtbXVfbm90aWZp
ZXJfcmFuZ2VfYmxvY2thYmxlKHVwZGF0ZSk7Ci0Jc3RydWN0IGludGVydmFsX3RyZWVfbm9kZSAq
aXQ7CiAKLQkvKiBub3RpZmljYXRpb24gaXMgZXhjbHVzaXZlLCBidXQgaW50ZXJ2YWwgaXMgaW5j
bHVzaXZlICovCi0JZW5kIC09IDE7Ci0KLQlpZiAoYW1kZ3B1X21uX3JlYWRfbG9jayhhbW4sIGJs
b2NrYWJsZSkpCisJaWYgKCFtbXVfbm90aWZpZXJfcmFuZ2VfYmxvY2thYmxlKHVwZGF0ZSkpCiAJ
CXJldHVybiAtRUFHQUlOOwogCi0JaXQgPSBpbnRlcnZhbF90cmVlX2l0ZXJfZmlyc3QoJmFtbi0+
b2JqZWN0cywgc3RhcnQsIGVuZCk7Ci0Jd2hpbGUgKGl0KSB7Ci0JCXN0cnVjdCBhbWRncHVfbW5f
bm9kZSAqbm9kZTsKLQkJc3RydWN0IGFtZGdwdV9ibyAqYm87Ci0KLQkJaWYgKCFibG9ja2FibGUp
IHsKLQkJCWFtZGdwdV9tbl9yZWFkX3VubG9jayhhbW4pOwotCQkJcmV0dXJuIC1FQUdBSU47Ci0J
CX0KLQotCQlub2RlID0gY29udGFpbmVyX29mKGl0LCBzdHJ1Y3QgYW1kZ3B1X21uX25vZGUsIGl0
KTsKLQkJaXQgPSBpbnRlcnZhbF90cmVlX2l0ZXJfbmV4dChpdCwgc3RhcnQsIGVuZCk7Ci0KLQkJ
bGlzdF9mb3JfZWFjaF9lbnRyeShibywgJm5vZGUtPmJvcywgbW5fbGlzdCkgewotCQkJc3RydWN0
IGtnZF9tZW0gKm1lbSA9IGJvLT5rZmRfYm87Ci0KLQkJCWlmIChhbWRncHVfdHRtX3R0X2FmZmVj
dF91c2VycHRyKGJvLT50Ym8udHRtLAotCQkJCQkJCSBzdGFydCwgZW5kKSkKLQkJCQlhbWRncHVf
YW1ka2ZkX2V2aWN0X3VzZXJwdHIobWVtLCBhbW4tPm1tKTsKLQkJfQotCX0KLQotCWFtZGdwdV9t
bl9yZWFkX3VubG9jayhhbW4pOwotCisJZG93bl9yZWFkKCZhbW4tPmxvY2spOworCXVwX3JlYWQo
JmFtbi0+bG9jayk7CiAJcmV0dXJuIDA7CiB9CiAKQEAgLTI5NSwxMiArMTU4LDEwIEBAIGFtZGdw
dV9tbl9zeW5jX3BhZ2V0YWJsZXNfaHNhKHN0cnVjdCBobW1fbWlycm9yICptaXJyb3IsCiAKIHN0
YXRpYyBzdHJ1Y3QgaG1tX21pcnJvcl9vcHMgYW1kZ3B1X2htbV9taXJyb3Jfb3BzW10gPSB7CiAJ
W0FNREdQVV9NTl9UWVBFX0dGWF0gPSB7Ci0JCS5zeW5jX2NwdV9kZXZpY2VfcGFnZXRhYmxlcyA9
IGFtZGdwdV9tbl9zeW5jX3BhZ2V0YWJsZXNfZ2Z4LAotCQkucmVsZWFzZSA9IGFtZGdwdV9obW1f
bWlycm9yX3JlbGVhc2UKKwkJLnN5bmNfY3B1X2RldmljZV9wYWdldGFibGVzID0gYW1kZ3B1X21u
X3N5bmNfcGFnZXRhYmxlcywKIAl9LAogCVtBTURHUFVfTU5fVFlQRV9IU0FdID0gewotCQkuc3lu
Y19jcHVfZGV2aWNlX3BhZ2V0YWJsZXMgPSBhbWRncHVfbW5fc3luY19wYWdldGFibGVzX2hzYSwK
LQkJLnJlbGVhc2UgPSBhbWRncHVfaG1tX21pcnJvcl9yZWxlYXNlCisJCS5zeW5jX2NwdV9kZXZp
Y2VfcGFnZXRhYmxlcyA9IGFtZGdwdV9tbl9zeW5jX3BhZ2V0YWJsZXMsCiAJfSwKIH07CiAKQEAg
LTMyNyw3ICsxODgsOCBAQCBzdHJ1Y3QgYW1kZ3B1X21uICphbWRncHVfbW5fZ2V0KHN0cnVjdCBh
bWRncHVfZGV2aWNlICphZGV2LAogCX0KIAogCWhhc2hfZm9yX2VhY2hfcG9zc2libGUoYWRldi0+
bW5faGFzaCwgYW1uLCBub2RlLCBrZXkpCi0JCWlmIChBTURHUFVfTU5fS0VZKGFtbi0+bW0sIGFt
bi0+dHlwZSkgPT0ga2V5KQorCQlpZiAoQU1ER1BVX01OX0tFWShhbW4tPm1pcnJvci5obW0tPm1t
dV9ub3RpZmllci5tbSwKKwkJCQkgIGFtbi0+dHlwZSkgPT0ga2V5KQogCQkJZ290byByZWxlYXNl
X2xvY2tzOwogCiAJYW1uID0ga3phbGxvYyhzaXplb2YoKmFtbiksIEdGUF9LRVJORUwpOwpAQCAt
MzM3LDEwICsxOTksOCBAQCBzdHJ1Y3QgYW1kZ3B1X21uICphbWRncHVfbW5fZ2V0KHN0cnVjdCBh
bWRncHVfZGV2aWNlICphZGV2LAogCX0KIAogCWFtbi0+YWRldiA9IGFkZXY7Ci0JYW1uLT5tbSA9
IG1tOwogCWluaXRfcndzZW0oJmFtbi0+bG9jayk7CiAJYW1uLT50eXBlID0gdHlwZTsKLQlhbW4t
Pm9iamVjdHMgPSBSQl9ST09UX0NBQ0hFRDsKIAogCWFtbi0+bWlycm9yLm9wcyA9ICZhbWRncHVf
aG1tX21pcnJvcl9vcHNbdHlwZV07CiAJciA9IGhtbV9taXJyb3JfcmVnaXN0ZXIoJmFtbi0+bWly
cm9yLCBtbSk7CkBAIC0zNjksMTAwICsyMjksMzMgQEAgc3RydWN0IGFtZGdwdV9tbiAqYW1kZ3B1
X21uX2dldChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKICAqIEBibzogYW1kZ3B1IGJ1ZmZl
ciBvYmplY3QKICAqIEBhZGRyOiB1c2VycHRyIGFkZHIgd2Ugc2hvdWxkIG1vbml0b3IKICAqCi0g
KiBSZWdpc3RlcnMgYW4gSE1NIG1pcnJvciBmb3IgdGhlIGdpdmVuIEJPIGF0IHRoZSBzcGVjaWZp
ZWQgYWRkcmVzcy4KKyAqIFJlZ2lzdGVycyBhIG1tdV9ub3RpZmllciBmb3IgdGhlIGdpdmVuIEJP
IGF0IHRoZSBzcGVjaWZpZWQgYWRkcmVzcy4KICAqIFJldHVybnMgMCBvbiBzdWNjZXNzLCAtRVJS
Tk8gaWYgYW55dGhpbmcgZ29lcyB3cm9uZy4KICAqLwogaW50IGFtZGdwdV9tbl9yZWdpc3Rlcihz
dHJ1Y3QgYW1kZ3B1X2JvICpibywgdW5zaWduZWQgbG9uZyBhZGRyKQogewotCXVuc2lnbmVkIGxv
bmcgZW5kID0gYWRkciArIGFtZGdwdV9ib19zaXplKGJvKSAtIDE7Ci0Jc3RydWN0IGFtZGdwdV9k
ZXZpY2UgKmFkZXYgPSBhbWRncHVfdHRtX2FkZXYoYm8tPnRiby5iZGV2KTsKLQllbnVtIGFtZGdw
dV9tbl90eXBlIHR5cGUgPQotCQliby0+a2ZkX2JvID8gQU1ER1BVX01OX1RZUEVfSFNBIDogQU1E
R1BVX01OX1RZUEVfR0ZYOwotCXN0cnVjdCBhbWRncHVfbW4gKmFtbjsKLQlzdHJ1Y3QgYW1kZ3B1
X21uX25vZGUgKm5vZGUgPSBOVUxMLCAqbmV3X25vZGU7Ci0Jc3RydWN0IGxpc3RfaGVhZCBib3M7
Ci0Jc3RydWN0IGludGVydmFsX3RyZWVfbm9kZSAqaXQ7Ci0KLQlhbW4gPSBhbWRncHVfbW5fZ2V0
KGFkZXYsIHR5cGUpOwotCWlmIChJU19FUlIoYW1uKSkKLQkJcmV0dXJuIFBUUl9FUlIoYW1uKTsK
LQotCW5ld19ub2RlID0ga21hbGxvYyhzaXplb2YoKm5ld19ub2RlKSwgR0ZQX0tFUk5FTCk7Ci0J
aWYgKCFuZXdfbm9kZSkKLQkJcmV0dXJuIC1FTk9NRU07Ci0KLQlJTklUX0xJU1RfSEVBRCgmYm9z
KTsKLQotCWRvd25fd3JpdGUoJmFtbi0+bG9jayk7Ci0KLQl3aGlsZSAoKGl0ID0gaW50ZXJ2YWxf
dHJlZV9pdGVyX2ZpcnN0KCZhbW4tPm9iamVjdHMsIGFkZHIsIGVuZCkpKSB7Ci0JCWtmcmVlKG5v
ZGUpOwotCQlub2RlID0gY29udGFpbmVyX29mKGl0LCBzdHJ1Y3QgYW1kZ3B1X21uX25vZGUsIGl0
KTsKLQkJaW50ZXJ2YWxfdHJlZV9yZW1vdmUoJm5vZGUtPml0LCAmYW1uLT5vYmplY3RzKTsKLQkJ
YWRkciA9IG1pbihpdC0+c3RhcnQsIGFkZHIpOwotCQllbmQgPSBtYXgoaXQtPmxhc3QsIGVuZCk7
Ci0JCWxpc3Rfc3BsaWNlKCZub2RlLT5ib3MsICZib3MpOwotCX0KLQotCWlmICghbm9kZSkKLQkJ
bm9kZSA9IG5ld19ub2RlOworCWlmIChiby0+a2ZkX2JvKQorCQliby0+bm90aWZpZXIub3BzID0g
JmFtZGdwdV9tbl9oc2Ffb3BzOwogCWVsc2UKLQkJa2ZyZWUobmV3X25vZGUpOwotCi0JYm8tPm1u
ID0gYW1uOwotCi0Jbm9kZS0+aXQuc3RhcnQgPSBhZGRyOwotCW5vZGUtPml0Lmxhc3QgPSBlbmQ7
Ci0JSU5JVF9MSVNUX0hFQUQoJm5vZGUtPmJvcyk7Ci0JbGlzdF9zcGxpY2UoJmJvcywgJm5vZGUt
PmJvcyk7Ci0JbGlzdF9hZGQoJmJvLT5tbl9saXN0LCAmbm9kZS0+Ym9zKTsKKwkJYm8tPm5vdGlm
aWVyLm9wcyA9ICZhbWRncHVfbW5fZ2Z4X29wczsKIAotCWludGVydmFsX3RyZWVfaW5zZXJ0KCZu
b2RlLT5pdCwgJmFtbi0+b2JqZWN0cyk7Ci0KLQl1cF93cml0ZSgmYW1uLT5sb2NrKTsKLQotCXJl
dHVybiAwOworCXJldHVybiBtbXVfaW50ZXJ2YWxfbm90aWZpZXJfaW5zZXJ0KCZiby0+bm90aWZp
ZXIsIGFkZHIsCisJCQkJCSAgICBhbWRncHVfYm9fc2l6ZShibyksIGN1cnJlbnQtPm1tKTsKIH0K
IAogLyoqCi0gKiBhbWRncHVfbW5fdW5yZWdpc3RlciAtIHVucmVnaXN0ZXIgYSBCTyBmb3IgSE1N
IG1pcnJvciB1cGRhdGVzCisgKiBhbWRncHVfbW5fdW5yZWdpc3RlciAtIHVucmVnaXN0ZXIgYSBC
TyBmb3Igbm90aWZpZXIgdXBkYXRlcwogICoKICAqIEBibzogYW1kZ3B1IGJ1ZmZlciBvYmplY3QK
ICAqCi0gKiBSZW1vdmUgYW55IHJlZ2lzdHJhdGlvbiBvZiBITU0gbWlycm9yIHVwZGF0ZXMgZnJv
bSB0aGUgYnVmZmVyIG9iamVjdC4KKyAqIFJlbW92ZSBhbnkgcmVnaXN0cmF0aW9uIG9mIG1tdSBu
b3RpZmllciB1cGRhdGVzIGZyb20gdGhlIGJ1ZmZlciBvYmplY3QuCiAgKi8KIHZvaWQgYW1kZ3B1
X21uX3VucmVnaXN0ZXIoc3RydWN0IGFtZGdwdV9ibyAqYm8pCiB7Ci0Jc3RydWN0IGFtZGdwdV9k
ZXZpY2UgKmFkZXYgPSBhbWRncHVfdHRtX2FkZXYoYm8tPnRiby5iZGV2KTsKLQlzdHJ1Y3QgYW1k
Z3B1X21uICphbW47Ci0Jc3RydWN0IGxpc3RfaGVhZCAqaGVhZDsKLQotCW11dGV4X2xvY2soJmFk
ZXYtPm1uX2xvY2spOwotCi0JYW1uID0gYm8tPm1uOwotCWlmIChhbW4gPT0gTlVMTCkgewotCQlt
dXRleF91bmxvY2soJmFkZXYtPm1uX2xvY2spOworCWlmICghYm8tPm5vdGlmaWVyLm1tKQogCQly
ZXR1cm47Ci0JfQotCi0JZG93bl93cml0ZSgmYW1uLT5sb2NrKTsKLQotCS8qIHNhdmUgdGhlIG5l
eHQgbGlzdCBlbnRyeSBmb3IgbGF0ZXIgKi8KLQloZWFkID0gYm8tPm1uX2xpc3QubmV4dDsKLQot
CWJvLT5tbiA9IE5VTEw7Ci0JbGlzdF9kZWxfaW5pdCgmYm8tPm1uX2xpc3QpOwotCi0JaWYgKGxp
c3RfZW1wdHkoaGVhZCkpIHsKLQkJc3RydWN0IGFtZGdwdV9tbl9ub2RlICpub2RlOwotCi0JCW5v
ZGUgPSBjb250YWluZXJfb2YoaGVhZCwgc3RydWN0IGFtZGdwdV9tbl9ub2RlLCBib3MpOwotCQlp
bnRlcnZhbF90cmVlX3JlbW92ZSgmbm9kZS0+aXQsICZhbW4tPm9iamVjdHMpOwotCQlrZnJlZShu
b2RlKTsKLQl9Ci0KLQl1cF93cml0ZSgmYW1uLT5sb2NrKTsKLQltdXRleF91bmxvY2soJmFkZXYt
Pm1uX2xvY2spOworCW1tdV9pbnRlcnZhbF9ub3RpZmllcl9yZW1vdmUoJmJvLT5ub3RpZmllcik7
CisJYm8tPm5vdGlmaWVyLm1tID0gTlVMTDsKIH0KIAogLyogZmxhZ3MgdXNlZCBieSBITU0gaW50
ZXJuYWwsIG5vdCByZWxhdGVkIHRvIENQVS9HUFUgUFRFIGZsYWdzICovCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfbW4uaCBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9tbi5oCmluZGV4IGI4ZWQ2ODk0MzYyNWMyLi5kNzNhYjI5NDdiMjJi
MiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X21uLmgKKysr
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X21uLmgKQEAgLTM5LDEyICszOSwx
MCBAQCBlbnVtIGFtZGdwdV9tbl90eXBlIHsKICAqIHN0cnVjdCBhbWRncHVfbW4KICAqCiAgKiBA
YWRldjogYW1kZ3B1IGRldmljZSBwb2ludGVyCi0gKiBAbW06IHByb2Nlc3MgYWRkcmVzcyBzcGFj
ZQogICogQHR5cGU6IHR5cGUgb2YgTU1VIG5vdGlmaWVyCiAgKiBAd29yazogZGVzdHJ1Y3Rpb24g
d29yayBpdGVtCiAgKiBAbm9kZTogaGFzaCB0YWJsZSBub2RlIHRvIGZpbmQgc3RydWN0dXJlIGJ5
IGFkZXYgYW5kIG1uCiAgKiBAbG9jazogcncgc2VtYXBob3JlIHByb3RlY3RpbmcgdGhlIG5vdGlm
aWVyIG5vZGVzCi0gKiBAb2JqZWN0czogaW50ZXJ2YWwgdHJlZSBjb250YWluaW5nIGFtZGdwdV9t
bl9ub2RlcwogICogQG1pcnJvcjogSE1NIG1pcnJvciBmdW5jdGlvbiBzdXBwb3J0CiAgKgogICog
RGF0YSBmb3IgZWFjaCBhbWRncHUgZGV2aWNlIGFuZCBwcm9jZXNzIGFkZHJlc3Mgc3BhY2UuCkBA
IC01Miw3ICs1MCw2IEBAIGVudW0gYW1kZ3B1X21uX3R5cGUgewogc3RydWN0IGFtZGdwdV9tbiB7
CiAJLyogY29uc3RhbnQgYWZ0ZXIgaW5pdGlhbGlzYXRpb24gKi8KIAlzdHJ1Y3QgYW1kZ3B1X2Rl
dmljZQkqYWRldjsKLQlzdHJ1Y3QgbW1fc3RydWN0CSptbTsKIAllbnVtIGFtZGdwdV9tbl90eXBl
CXR5cGU7CiAKIAkvKiBvbmx5IHVzZWQgb24gZGVzdHJ1Y3Rpb24gKi8KQEAgLTYzLDcgKzYwLDYg
QEAgc3RydWN0IGFtZGdwdV9tbiB7CiAKIAkvKiBvYmplY3RzIHByb3RlY3RlZCBieSBsb2NrICov
CiAJc3RydWN0IHJ3X3NlbWFwaG9yZQlsb2NrOwotCXN0cnVjdCByYl9yb290X2NhY2hlZAlvYmpl
Y3RzOwogCiAjaWZkZWYgQ09ORklHX0hNTV9NSVJST1IKIAkvKiBITU0gbWlycm9yICovCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfb2JqZWN0LmggYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfb2JqZWN0LmgKaW5kZXggNjU4ZjRjOTc3OWI3
MDQuLjI3OTJjNWM3MGZkMTBkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfb2JqZWN0LmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X29iamVjdC5oCkBAIC0zMCw2ICszMCw5IEBACiAKICNpbmNsdWRlIDxkcm0vYW1kZ3B1X2RybS5o
PgogI2luY2x1ZGUgImFtZGdwdS5oIgorI2lmZGVmIENPTkZJR19NTVVfTk9USUZJRVIKKyNpbmNs
dWRlIDxsaW51eC9tbXVfbm90aWZpZXIuaD4KKyNlbmRpZgogCiAjZGVmaW5lIEFNREdQVV9CT19J
TlZBTElEX09GRlNFVAlMT05HX01BWAogI2RlZmluZSBBTURHUFVfQk9fTUFYX1BMQUNFTUVOVFMJ
MwpAQCAtMTAwLDEwICsxMDMsMTIgQEAgc3RydWN0IGFtZGdwdV9ibyB7CiAJc3RydWN0IHR0bV9i
b19rbWFwX29iagkJZG1hX2J1Zl92bWFwOwogCXN0cnVjdCBhbWRncHVfbW4JCSptbjsKIAotCXVu
aW9uIHsKLQkJc3RydWN0IGxpc3RfaGVhZAltbl9saXN0OwotCQlzdHJ1Y3QgbGlzdF9oZWFkCXNo
YWRvd19saXN0OwotCX07CisKKyNpZmRlZiBDT05GSUdfTU1VX05PVElGSUVSCisJc3RydWN0IG1t
dV9pbnRlcnZhbF9ub3RpZmllcglub3RpZmllcjsKKyNlbmRpZgorCisJc3RydWN0IGxpc3RfaGVh
ZAkJc2hhZG93X2xpc3Q7CiAKIAlzdHJ1Y3Qga2dkX21lbSAgICAgICAgICAgICAgICAgICprZmRf
Ym87CiB9OwotLSAKMi4yNC4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1n
Zng=
