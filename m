Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4184284251
	for <lists+amd-gfx@lfdr.de>; Wed,  7 Aug 2019 04:16:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C6DB6E5D5;
	Wed,  7 Aug 2019 02:16:25 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC19F6E584;
 Wed,  7 Aug 2019 01:34:45 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id i18so42544942pgl.11;
 Tue, 06 Aug 2019 18:34:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=30MQZ7ywyXKAPoZ0MqYExKYsjkeLdKEHUByfnmRZCb0=;
 b=cGkqw+Vp1wgXJiXI3xEpIj+K6Bp5pc4/KAcAJHpmmeux+DLXVXOc8UPyKgypHO9WFV
 C7S1paA5TCJv04U7Pe2wz1BIlpwPQOuzkKBorlAXGjYw4worwHNuadTWdvFXp69SzPBT
 s+lJ6frPtq9K6XqgC+Q93fH5crhcNMd6c2rUvqFErxGn1o7Mat2C2WYWWJAq2Was7Cx4
 8aWFrfNfqL9pY9eCpeZuVCKZIpbhEoiRax00MJpJ1HPf5QgnOTJ7QWvRkI7/0JqMIGqF
 E8Yo6X5ICDfwzYVgrqpe67QsXRrFdjWxLHRSP9l6zx+sgVFNWjODPhWn1aZvPAo72Om7
 oaTg==
X-Gm-Message-State: APjAAAWWaWFEEww01YpDAhTOxOXGUqhZ8ps5b9z3YneJbjdX1MfcjDJK
 goLlkv4wFJFezCKw/ecIjyQ=
X-Google-Smtp-Source: APXvYqw4IyvxT+a447mG7S7T32nq/0vx/OylsLzm55tU7UOjf2NCx+Dmal9oDg9eNuXVr0J1x2ZUyQ==
X-Received: by 2002:a63:36cc:: with SMTP id d195mr5452828pga.157.1565141685421; 
 Tue, 06 Aug 2019 18:34:45 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 u69sm111740800pgu.77.2019.08.06.18.34.43
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 06 Aug 2019 18:34:44 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v3 38/41] powerpc: convert put_page() to put_user_page*()
Date: Tue,  6 Aug 2019 18:33:37 -0700
Message-Id: <20190807013340.9706-39-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190807013340.9706-1-jhubbard@nvidia.com>
References: <20190807013340.9706-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
X-Mailman-Approved-At: Wed, 07 Aug 2019 02:16:12 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=30MQZ7ywyXKAPoZ0MqYExKYsjkeLdKEHUByfnmRZCb0=;
 b=g67RvuXxl/7UgwJ5Nsn5m7mCWAd1eJK19OdXPfHISavNg0/hlxqTRWRiZsiObbIxd1
 z7nTlGaqHPYV4ywgcbsmss6gPc+YHifTLpOQY0K91PQUhyOYukJschqLsfaVLze8bLh+
 aV53NaTAotE5e+jR4GjhaqKTLNaydraqrAumktndCtlF4SiNrqRjpIehSehjFa47DX/L
 ADmdLxhsKJt3PHVHlUoQeH6o3x8T/NrnTA5b/OM8c9NkahQxV1Hajc7XXSthUzvuQiX4
 tXYs8SD3Ckew9oHpIJy9DZatkhmnngs/Je/q+s3mKD0DprEGB/SuCd9kYNKpjjLfUk8q
 m4IA==
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
Cc: linux-fbdev@vger.kernel.org, Jan Kara <jack@suse.cz>, kvm@vger.kernel.org,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 sparclinux@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
 ceph-devel@vger.kernel.org, devel@driverdev.osuosl.org,
 rds-devel@oss.oracle.com, linux-rdma@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>, x86@kernel.org,
 amd-gfx@lists.freedesktop.org, Christoph Hellwig <hch@lst.de>,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 xen-devel@lists.xenproject.org, devel@lists.orangefs.org,
 linux-media@vger.kernel.org, John Hubbard <jhubbard@nvidia.com>,
 intel-gfx@lists.freedesktop.org, linux-block@vger.kernel.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 linux-rpi-kernel@lists.infradead.org, Dan Williams <dan.j.williams@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-xfs@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgoKRm9yIHBhZ2VzIHRoYXQg
d2VyZSByZXRhaW5lZCB2aWEgZ2V0X3VzZXJfcGFnZXMqKCksIHJlbGVhc2UgdGhvc2UgcGFnZXMK
dmlhIHRoZSBuZXcgcHV0X3VzZXJfcGFnZSooKSByb3V0aW5lcywgaW5zdGVhZCBvZiB2aWEgcHV0
X3BhZ2UoKSBvcgpyZWxlYXNlX3BhZ2VzKCkuCgpUaGlzIGlzIHBhcnQgYSB0cmVlLXdpZGUgY29u
dmVyc2lvbiwgYXMgZGVzY3JpYmVkIGluIGNvbW1pdCBmYzFkOGU3Y2NhMmQKKCJtbTogaW50cm9k
dWNlIHB1dF91c2VyX3BhZ2UqKCksIHBsYWNlaG9sZGVyIHZlcnNpb25zIikuCgpOb3RlIHRoYXQg
dGhpcyBlZmZlY3RpdmVseSBjaGFuZ2VzIHRoZSBjb2RlJ3MgYmVoYXZpb3IgaW4KbW1faW9tbXVf
dW5waW4oKTogaXQgbm93IHVsdGltYXRlbHkgY2FsbHMgc2V0X3BhZ2VfZGlydHlfbG9jaygpLApp
bnN0ZWFkIG9mIHNldF9wYWdlX2RpcnR5KCkuIFRoaXMgaXMgcHJvYmFibHkgbW9yZSBhY2N1cmF0
ZS4KCkFzIENocmlzdG9waCBIZWxsd2lnIHB1dCBpdCwgInNldF9wYWdlX2RpcnR5KCkgaXMgb25s
eSBzYWZlIGlmIHdlIGFyZQpkZWFsaW5nIHdpdGggYSBmaWxlIGJhY2tlZCBwYWdlIHdoZXJlIHdl
IGhhdmUgcmVmZXJlbmNlIG9uIHRoZSBpbm9kZSBpdApoYW5ncyBvZmYuIiBbMV0KClsxXSBodHRw
czovL2xvcmUua2VybmVsLm9yZy9yLzIwMTkwNzIzMTUzNjQwLkdCNzIwQGxzdC5kZQoKQ2M6IEJl
bmphbWluIEhlcnJlbnNjaG1pZHQgPGJlbmhAa2VybmVsLmNyYXNoaW5nLm9yZz4KQ2M6IENocmlz
dG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgpDYzogTWljaGFlbCBFbGxlcm1hbiA8bXBlQGVsbGVy
bWFuLmlkLmF1PgpDYzogbGludXhwcGMtZGV2QGxpc3RzLm96bGFicy5vcmcKU2lnbmVkLW9mZi1i
eTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgotLS0KIGFyY2gvcG93ZXJwYy9r
dm0vYm9vazNzXzY0X21tdV9odi5jICAgIHwgIDQgKystLQogYXJjaC9wb3dlcnBjL2t2bS9ib29r
M3NfNjRfbW11X3JhZGl4LmMgfCAxOSArKysrKysrKysrKysrKy0tLS0tCiBhcmNoL3Bvd2VycGMv
a3ZtL2U1MDBfbW11LmMgICAgICAgICAgICB8ICAzICstLQogYXJjaC9wb3dlcnBjL21tL2Jvb2sz
czY0L2lvbW11X2FwaS5jICAgfCAxMSArKysrKy0tLS0tLQogNCBmaWxlcyBjaGFuZ2VkLCAyMiBp
bnNlcnRpb25zKCspLCAxNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMv
a3ZtL2Jvb2szc182NF9tbXVfaHYuYyBiL2FyY2gvcG93ZXJwYy9rdm0vYm9vazNzXzY0X21tdV9o
di5jCmluZGV4IDlhNzVmMGUxOTMzYi4uMTg2NDZiNzM4Y2UxIDEwMDY0NAotLS0gYS9hcmNoL3Bv
d2VycGMva3ZtL2Jvb2szc182NF9tbXVfaHYuYworKysgYi9hcmNoL3Bvd2VycGMva3ZtL2Jvb2sz
c182NF9tbXVfaHYuYwpAQCAtNzMxLDcgKzczMSw3IEBAIGludCBrdm1wcGNfYm9vazNzX2h2X3Bh
Z2VfZmF1bHQoc3RydWN0IGt2bV9ydW4gKnJ1biwgc3RydWN0IGt2bV92Y3B1ICp2Y3B1LAogCQkg
KiB3ZSBoYXZlIHRvIGRyb3AgdGhlIHJlZmVyZW5jZSBvbiB0aGUgY29ycmVjdCB0YWlsCiAJCSAq
IHBhZ2UgdG8gbWF0Y2ggdGhlIGdldCBpbnNpZGUgZ3VwKCkKIAkJICovCi0JCXB1dF9wYWdlKHBh
Z2VzWzBdKTsKKwkJcHV0X3VzZXJfcGFnZShwYWdlc1swXSk7CiAJfQogCXJldHVybiByZXQ7CiAK
QEAgLTEyMDYsNyArMTIwNiw3IEBAIHZvaWQga3ZtcHBjX3VucGluX2d1ZXN0X3BhZ2Uoc3RydWN0
IGt2bSAqa3ZtLCB2b2lkICp2YSwgdW5zaWduZWQgbG9uZyBncGEsCiAJdW5zaWduZWQgbG9uZyBn
Zm47CiAJaW50IHNyY3VfaWR4OwogCi0JcHV0X3BhZ2UocGFnZSk7CisJcHV0X3VzZXJfcGFnZShw
YWdlKTsKIAogCWlmICghZGlydHkpCiAJCXJldHVybjsKZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJw
Yy9rdm0vYm9vazNzXzY0X21tdV9yYWRpeC5jIGIvYXJjaC9wb3dlcnBjL2t2bS9ib29rM3NfNjRf
bW11X3JhZGl4LmMKaW5kZXggMmQ0MTVjMzZhNjFkLi5mNTMyNzNmYmZhMmQgMTAwNjQ0Ci0tLSBh
L2FyY2gvcG93ZXJwYy9rdm0vYm9vazNzXzY0X21tdV9yYWRpeC5jCisrKyBiL2FyY2gvcG93ZXJw
Yy9rdm0vYm9vazNzXzY0X21tdV9yYWRpeC5jCkBAIC04MjEsOCArODIxLDEyIEBAIGludCBrdm1w
cGNfYm9vazNzX2luc3RhbnRpYXRlX3BhZ2Uoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LAogCSAqLwog
CWlmICghcHRlcCkgewogCQlsb2NhbF9pcnFfZW5hYmxlKCk7Ci0JCWlmIChwYWdlKQotCQkJcHV0
X3BhZ2UocGFnZSk7CisJCWlmIChwYWdlKSB7CisJCQlpZiAodXBncmFkZV93cml0ZSkKKwkJCQlw
dXRfdXNlcl9wYWdlKHBhZ2UpOworCQkJZWxzZQorCQkJCXB1dF9wYWdlKHBhZ2UpOworCQl9CiAJ
CXJldHVybiBSRVNVTUVfR1VFU1Q7CiAJfQogCXB0ZSA9ICpwdGVwOwpAQCAtODcwLDkgKzg3NCwx
NCBAQCBpbnQga3ZtcHBjX2Jvb2szc19pbnN0YW50aWF0ZV9wYWdlKHN0cnVjdCBrdm1fdmNwdSAq
dmNwdSwKIAkJKmxldmVscCA9IGxldmVsOwogCiAJaWYgKHBhZ2UpIHsKLQkJaWYgKCFyZXQgJiYg
KHB0ZV92YWwocHRlKSAmIF9QQUdFX1dSSVRFKSkKLQkJCXNldF9wYWdlX2RpcnR5X2xvY2socGFn
ZSk7Ci0JCXB1dF9wYWdlKHBhZ2UpOworCQlib29sIGRpcnR5ID0gIXJldCAmJiAocHRlX3ZhbChw
dGUpICYgX1BBR0VfV1JJVEUpOworCQlpZiAodXBncmFkZV93cml0ZSkKKwkJCXB1dF91c2VyX3Bh
Z2VzX2RpcnR5X2xvY2soJnBhZ2UsIDEsIGRpcnR5KTsKKwkJZWxzZSB7CisJCQlpZiAoZGlydHkp
CisJCQkJc2V0X3BhZ2VfZGlydHlfbG9jayhwYWdlKTsKKwkJCXB1dF9wYWdlKHBhZ2UpOworCQl9
CiAJfQogCiAJLyogSW5jcmVtZW50IG51bWJlciBvZiBsYXJnZSBwYWdlcyBpZiB3ZSAoc3VjY2Vz
c2Z1bGx5KSBpbnNlcnRlZCBvbmUgKi8KZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9rdm0vZTUw
MF9tbXUuYyBiL2FyY2gvcG93ZXJwYy9rdm0vZTUwMF9tbXUuYwppbmRleCAyZDkxMGI4N2U0NDEu
LjY3YmI4ZDU5ZDRiMSAxMDA2NDQKLS0tIGEvYXJjaC9wb3dlcnBjL2t2bS9lNTAwX21tdS5jCisr
KyBiL2FyY2gvcG93ZXJwYy9rdm0vZTUwMF9tbXUuYwpAQCAtODUwLDggKzg1MCw3IEBAIGludCBr
dm1fdmNwdV9pb2N0bF9jb25maWdfdGxiKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwKICBmcmVlX3By
aXZzX2ZpcnN0OgogCWtmcmVlKHByaXZzWzBdKTsKICBwdXRfcGFnZXM6Ci0JZm9yIChpID0gMDsg
aSA8IG51bV9wYWdlczsgaSsrKQotCQlwdXRfcGFnZShwYWdlc1tpXSk7CisJcHV0X3VzZXJfcGFn
ZXMocGFnZXMsIG51bV9wYWdlcyk7CiAgZnJlZV9wYWdlczoKIAlrZnJlZShwYWdlcyk7CiAJcmV0
dXJuIHJldDsKZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9tbS9ib29rM3M2NC9pb21tdV9hcGku
YyBiL2FyY2gvcG93ZXJwYy9tbS9ib29rM3M2NC9pb21tdV9hcGkuYwppbmRleCBiMDU2Y2FlMzM4
OGIuLmUxMjYxOTNiYTI5NSAxMDA2NDQKLS0tIGEvYXJjaC9wb3dlcnBjL21tL2Jvb2szczY0L2lv
bW11X2FwaS5jCisrKyBiL2FyY2gvcG93ZXJwYy9tbS9ib29rM3M2NC9pb21tdV9hcGkuYwpAQCAt
MTcwLDkgKzE3MCw4IEBAIHN0YXRpYyBsb25nIG1tX2lvbW11X2RvX2FsbG9jKHN0cnVjdCBtbV9z
dHJ1Y3QgKm1tLCB1bnNpZ25lZCBsb25nIHVhLAogCXJldHVybiAwOwogCiBmcmVlX2V4aXQ6Ci0J
LyogZnJlZSB0aGUgcmVmZXJlbmNlIHRha2VuICovCi0JZm9yIChpID0gMDsgaSA8IHBpbm5lZDsg
aSsrKQotCQlwdXRfcGFnZShtZW0tPmhwYWdlc1tpXSk7CisJLyogZnJlZSB0aGUgcmVmZXJlbmNl
cyB0YWtlbiAqLworCXB1dF91c2VyX3BhZ2VzKG1lbS0+aHBhZ2VzLCBwaW5uZWQpOwogCiAJdmZy
ZWUobWVtLT5ocGFzKTsKIAlrZnJlZShtZW0pOwpAQCAtMjAzLDYgKzIwMiw3IEBAIHN0YXRpYyB2
b2lkIG1tX2lvbW11X3VucGluKHN0cnVjdCBtbV9pb21tdV90YWJsZV9ncm91cF9tZW1fdCAqbWVt
KQogewogCWxvbmcgaTsKIAlzdHJ1Y3QgcGFnZSAqcGFnZSA9IE5VTEw7CisJYm9vbCBkaXJ0eSA9
IGZhbHNlOwogCiAJaWYgKCFtZW0tPmhwYXMpCiAJCXJldHVybjsKQEAgLTIxNSwxMCArMjE1LDkg
QEAgc3RhdGljIHZvaWQgbW1faW9tbXVfdW5waW4oc3RydWN0IG1tX2lvbW11X3RhYmxlX2dyb3Vw
X21lbV90ICptZW0pCiAJCWlmICghcGFnZSkKIAkJCWNvbnRpbnVlOwogCi0JCWlmIChtZW0tPmhw
YXNbaV0gJiBNTV9JT01NVV9UQUJMRV9HUk9VUF9QQUdFX0RJUlRZKQotCQkJU2V0UGFnZURpcnR5
KHBhZ2UpOworCQlkaXJ0eSA9IG1lbS0+aHBhc1tpXSAmIE1NX0lPTU1VX1RBQkxFX0dST1VQX1BB
R0VfRElSVFk7CiAKLQkJcHV0X3BhZ2UocGFnZSk7CisJCXB1dF91c2VyX3BhZ2VzX2RpcnR5X2xv
Y2soJnBhZ2UsIDEsIGRpcnR5KTsKIAkJbWVtLT5ocGFzW2ldID0gMDsKIAl9CiB9Ci0tIAoyLjIy
LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1n
ZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
