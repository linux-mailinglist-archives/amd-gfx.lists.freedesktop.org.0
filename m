Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E68A84235
	for <lists+amd-gfx@lfdr.de>; Wed,  7 Aug 2019 04:16:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 407376E5C0;
	Wed,  7 Aug 2019 02:16:22 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCA786E584;
 Wed,  7 Aug 2019 01:33:46 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id n9so36320572pgc.1;
 Tue, 06 Aug 2019 18:33:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4akykUxH2KxKuvwfnCStCJj6GMSMvpgFOQ+wq4ARE7Y=;
 b=FkF8mzv2Bua6wemGm/DZzblSPtptjHbjkPXvCtDW2uNCMvwxdbxado3xHrPq2zOYwe
 XpIN81J36/Hdq7yw6MfYLNxls2VcT1EpLPJ5s/Yj0lESCL13fyyUuAd4lJ5J9tBkYKmd
 uuOHVO16rmbWSafwjGUpb055c3mPHqQ2Wtydk5tRBbWIUzOMbKTpzvV/VvDsY4PgN4ah
 6gW31Q7wkuP8Vb2+t/tyVl6vFVHJeA+oYzdjTsUUawMRO6dxy8ZGLqlfEzvbSY/4C485
 ceGkNrrom54AYUkwHvAmEB5whD3GtJ2ue/uzoWdJ8HsrUBL5xcFqvYWjoMJ/YGv0LbRA
 /pZw==
X-Gm-Message-State: APjAAAVz9Vm1hhcY6xK9mdRgIRYs4GxWuF2Xfa5+jn2C3z1lWuauPsmA
 2Vv6TsPeF3yJmb8vtFxTKj8=
X-Google-Smtp-Source: APXvYqwVsJZOQSwIml6vLhbn090EKpXVgy2KmUBFZJGaeJKod8dBYbI9B77G5XovazwgI3IANAmVew==
X-Received: by 2002:a17:90a:e38f:: with SMTP id
 b15mr6126996pjz.85.1565141626401; 
 Tue, 06 Aug 2019 18:33:46 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 u69sm111740800pgu.77.2019.08.06.18.33.44
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 06 Aug 2019 18:33:45 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v3 01/41] mm/gup: add make_dirty arg to
 put_user_pages_dirty_lock()
Date: Tue,  6 Aug 2019 18:33:00 -0700
Message-Id: <20190807013340.9706-2-jhubbard@nvidia.com>
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
 bh=4akykUxH2KxKuvwfnCStCJj6GMSMvpgFOQ+wq4ARE7Y=;
 b=BTuTOhHSALyHLiJJfJrgxYVdEdRj89X+n2AhI5pRVlo4ueNU/tMLNAP+URjW32r6b8
 x4wB6jHXYTUs7EDYZOBU5HBi4pwi3S1VWA7Wcj7tqnMBPBIFb7mcOnVVcb2houoWoU6W
 3slEK52fIhg8Uj+zaiV/BNmacr2qelkUW51yKRkkDF/epktcDrFW6YlPml6XZi1BqLcK
 ENzpL7YRF4dGdmgStUF+D1iFpLn5tkpJ1tFedkGf0iMmyC5BHvDJYkjVkK/CaiwGWX7g
 LaicxKNPbvd4JZae6EE+9VOhEPgTUP/EaZi95PE5gVrggdEIbbzTN1RmHnxFA+oS3Md8
 dUpg==
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
 Dave Hansen <dave.hansen@linux.intel.com>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Matthew Wilcox <willy@infradead.org>, sparclinux@vger.kernel.org,
 Ira Weiny <ira.weiny@intel.com>, ceph-devel@vger.kernel.org,
 devel@driverdev.osuosl.org, rds-devel@oss.oracle.com,
 linux-rdma@vger.kernel.org, x86@kernel.org, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@lst.de>, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, xen-devel@lists.xenproject.org,
 devel@lists.orangefs.org, linux-media@vger.kernel.org,
 John Hubbard <jhubbard@nvidia.com>, intel-gfx@lists.freedesktop.org,
 linux-block@vger.kernel.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 linux-rpi-kernel@lists.infradead.org, Dan Williams <dan.j.williams@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-xfs@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgoKUHJvdmlkZSBhIG1vcmUg
Y2FwYWJsZSB2YXJpYXRpb24gb2YgcHV0X3VzZXJfcGFnZXNfZGlydHlfbG9jaygpLAphbmQgZGVs
ZXRlIHB1dF91c2VyX3BhZ2VzX2RpcnR5KCkuIFRoaXMgaXMgYmFzZWQgb24gdGhlCmZvbGxvd2lu
ZzoKCjEuIExvdHMgb2YgY2FsbCBzaXRlcyBiZWNvbWUgc2ltcGxlciBpZiBhIGJvb2wgaXMgcGFz
c2VkCmludG8gcHV0X3VzZXJfcGFnZSooKSwgaW5zdGVhZCBvZiBtYWtpbmcgdGhlIGNhbGwgc2l0
ZQpjaG9vc2Ugd2hpY2ggcHV0X3VzZXJfcGFnZSooKSB2YXJpYW50IHRvIGNhbGwuCgoyLiBDaHJp
c3RvcGggSGVsbHdpZydzIG9ic2VydmF0aW9uIHRoYXQgc2V0X3BhZ2VfZGlydHlfbG9jaygpCmlz
IHVzdWFsbHkgY29ycmVjdCwgYW5kIHNldF9wYWdlX2RpcnR5KCkgaXMgdXN1YWxseSBhCmJ1Zywg
b3IgYXQgbGVhc3QgcXVlc3Rpb25hYmxlLCB3aXRoaW4gYSBwdXRfdXNlcl9wYWdlKigpCmNhbGxp
bmcgY2hhaW4uCgpUaGlzIGxlYWRzIHRvIHRoZSBmb2xsb3dpbmcgQVBJIGNob2ljZXM6CgogICAg
KiBwdXRfdXNlcl9wYWdlc19kaXJ0eV9sb2NrKHBhZ2UsIG5wYWdlcywgbWFrZV9kaXJ0eSkKCiAg
ICAqIFRoZXJlIGlzIG5vIHB1dF91c2VyX3BhZ2VzX2RpcnR5KCkuIFlvdSBoYXZlIHRvCiAgICAg
IGhhbmQgY29kZSB0aGF0LCBpbiB0aGUgcmFyZSBjYXNlIHRoYXQgaXQncwogICAgICByZXF1aXJl
ZC4KClJldmlld2VkLWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4KUmV2aWV3ZWQt
Ynk6IElyYSBXZWlueSA8aXJhLndlaW55QGludGVsLmNvbT4KCkNjOiBNYXR0aGV3IFdpbGNveCA8
d2lsbHlAaW5mcmFkZWFkLm9yZz4KQ2M6IEphbiBLYXJhIDxqYWNrQHN1c2UuY3o+CkNjOiBJcmEg
V2VpbnkgPGlyYS53ZWlueUBpbnRlbC5jb20+CkNjOiBKYXNvbiBHdW50aG9ycGUgPGpnZ0B6aWVw
ZS5jYT4KU2lnbmVkLW9mZi1ieTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgot
LS0KIGRyaXZlcnMvaW5maW5pYmFuZC9jb3JlL3VtZW0uYyAgICAgICAgICAgICB8ICAgNSArLQog
ZHJpdmVycy9pbmZpbmliYW5kL2h3L2hmaTEvdXNlcl9wYWdlcy5jICAgIHwgICA1ICstCiBkcml2
ZXJzL2luZmluaWJhbmQvaHcvcWliL3FpYl91c2VyX3BhZ2VzLmMgfCAgMTMgKy0tCiBkcml2ZXJz
L2luZmluaWJhbmQvaHcvdXNuaWMvdXNuaWNfdWlvbS5jICAgfCAgIDUgKy0KIGRyaXZlcnMvaW5m
aW5pYmFuZC9zdy9zaXcvc2l3X21lbS5jICAgICAgICB8ICAxOSArLS0tCiBpbmNsdWRlL2xpbnV4
L21tLmggICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDUgKy0KIG1tL2d1cC5jICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB8IDEwOSArKysrKysrKy0tLS0tLS0tLS0tLS0KIDcg
ZmlsZXMgY2hhbmdlZCwgNTQgaW5zZXJ0aW9ucygrKSwgMTA3IGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvaW5maW5pYmFuZC9jb3JlL3VtZW0uYyBiL2RyaXZlcnMvaW5maW5pYmFu
ZC9jb3JlL3VtZW0uYwppbmRleCAwOGRhODQwZWQ3ZWUuLjk2NWNmOWRlYTcxYSAxMDA2NDQKLS0t
IGEvZHJpdmVycy9pbmZpbmliYW5kL2NvcmUvdW1lbS5jCisrKyBiL2RyaXZlcnMvaW5maW5pYmFu
ZC9jb3JlL3VtZW0uYwpAQCAtNTQsMTAgKzU0LDcgQEAgc3RhdGljIHZvaWQgX19pYl91bWVtX3Jl
bGVhc2Uoc3RydWN0IGliX2RldmljZSAqZGV2LCBzdHJ1Y3QgaWJfdW1lbSAqdW1lbSwgaW50IGQK
IAogCWZvcl9lYWNoX3NnX3BhZ2UodW1lbS0+c2dfaGVhZC5zZ2wsICZzZ19pdGVyLCB1bWVtLT5z
Z19uZW50cywgMCkgewogCQlwYWdlID0gc2dfcGFnZV9pdGVyX3BhZ2UoJnNnX2l0ZXIpOwotCQlp
ZiAodW1lbS0+d3JpdGFibGUgJiYgZGlydHkpCi0JCQlwdXRfdXNlcl9wYWdlc19kaXJ0eV9sb2Nr
KCZwYWdlLCAxKTsKLQkJZWxzZQotCQkJcHV0X3VzZXJfcGFnZShwYWdlKTsKKwkJcHV0X3VzZXJf
cGFnZXNfZGlydHlfbG9jaygmcGFnZSwgMSwgdW1lbS0+d3JpdGFibGUgJiYgZGlydHkpOwogCX0K
IAogCXNnX2ZyZWVfdGFibGUoJnVtZW0tPnNnX2hlYWQpOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9p
bmZpbmliYW5kL2h3L2hmaTEvdXNlcl9wYWdlcy5jIGIvZHJpdmVycy9pbmZpbmliYW5kL2h3L2hm
aTEvdXNlcl9wYWdlcy5jCmluZGV4IGI4OWE5YjlhZWY3YS4uNDY5YWNiOTYxZmJkIDEwMDY0NAot
LS0gYS9kcml2ZXJzL2luZmluaWJhbmQvaHcvaGZpMS91c2VyX3BhZ2VzLmMKKysrIGIvZHJpdmVy
cy9pbmZpbmliYW5kL2h3L2hmaTEvdXNlcl9wYWdlcy5jCkBAIC0xMTgsMTAgKzExOCw3IEBAIGlu
dCBoZmkxX2FjcXVpcmVfdXNlcl9wYWdlcyhzdHJ1Y3QgbW1fc3RydWN0ICptbSwgdW5zaWduZWQg
bG9uZyB2YWRkciwgc2l6ZV90IG5wCiB2b2lkIGhmaTFfcmVsZWFzZV91c2VyX3BhZ2VzKHN0cnVj
dCBtbV9zdHJ1Y3QgKm1tLCBzdHJ1Y3QgcGFnZSAqKnAsCiAJCQkgICAgIHNpemVfdCBucGFnZXMs
IGJvb2wgZGlydHkpCiB7Ci0JaWYgKGRpcnR5KQotCQlwdXRfdXNlcl9wYWdlc19kaXJ0eV9sb2Nr
KHAsIG5wYWdlcyk7Ci0JZWxzZQotCQlwdXRfdXNlcl9wYWdlcyhwLCBucGFnZXMpOworCXB1dF91
c2VyX3BhZ2VzX2RpcnR5X2xvY2socCwgbnBhZ2VzLCBkaXJ0eSk7CiAKIAlpZiAobW0pIHsgLyog
ZHVyaW5nIGNsb3NlIGFmdGVyIHNpZ25hbCwgbW0gY2FuIGJlIE5VTEwgKi8KIAkJYXRvbWljNjRf
c3ViKG5wYWdlcywgJm1tLT5waW5uZWRfdm0pOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9pbmZpbmli
YW5kL2h3L3FpYi9xaWJfdXNlcl9wYWdlcy5jIGIvZHJpdmVycy9pbmZpbmliYW5kL2h3L3FpYi9x
aWJfdXNlcl9wYWdlcy5jCmluZGV4IGJmYmZiYjdlMGZmNC4uMjZjMWZiOGQ0NWNjIDEwMDY0NAot
LS0gYS9kcml2ZXJzL2luZmluaWJhbmQvaHcvcWliL3FpYl91c2VyX3BhZ2VzLmMKKysrIGIvZHJp
dmVycy9pbmZpbmliYW5kL2h3L3FpYi9xaWJfdXNlcl9wYWdlcy5jCkBAIC0zNywxNSArMzcsNiBA
QAogCiAjaW5jbHVkZSAicWliLmgiCiAKLXN0YXRpYyB2b2lkIF9fcWliX3JlbGVhc2VfdXNlcl9w
YWdlcyhzdHJ1Y3QgcGFnZSAqKnAsIHNpemVfdCBudW1fcGFnZXMsCi0JCQkJICAgICBpbnQgZGly
dHkpCi17Ci0JaWYgKGRpcnR5KQotCQlwdXRfdXNlcl9wYWdlc19kaXJ0eV9sb2NrKHAsIG51bV9w
YWdlcyk7Ci0JZWxzZQotCQlwdXRfdXNlcl9wYWdlcyhwLCBudW1fcGFnZXMpOwotfQotCiAvKioK
ICAqIHFpYl9tYXBfcGFnZSAtIGEgc2FmZXR5IHdyYXBwZXIgYXJvdW5kIHBjaV9tYXBfcGFnZSgp
CiAgKgpAQCAtMTI0LDcgKzExNSw3IEBAIGludCBxaWJfZ2V0X3VzZXJfcGFnZXModW5zaWduZWQg
bG9uZyBzdGFydF9wYWdlLCBzaXplX3QgbnVtX3BhZ2VzLAogCiAJcmV0dXJuIDA7CiBiYWlsX3Jl
bGVhc2U6Ci0JX19xaWJfcmVsZWFzZV91c2VyX3BhZ2VzKHAsIGdvdCwgMCk7CisJcHV0X3VzZXJf
cGFnZXNfZGlydHlfbG9jayhwLCBnb3QsIGZhbHNlKTsKIGJhaWw6CiAJYXRvbWljNjRfc3ViKG51
bV9wYWdlcywgJmN1cnJlbnQtPm1tLT5waW5uZWRfdm0pOwogCXJldHVybiByZXQ7CkBAIC0xMzIs
NyArMTIzLDcgQEAgaW50IHFpYl9nZXRfdXNlcl9wYWdlcyh1bnNpZ25lZCBsb25nIHN0YXJ0X3Bh
Z2UsIHNpemVfdCBudW1fcGFnZXMsCiAKIHZvaWQgcWliX3JlbGVhc2VfdXNlcl9wYWdlcyhzdHJ1
Y3QgcGFnZSAqKnAsIHNpemVfdCBudW1fcGFnZXMpCiB7Ci0JX19xaWJfcmVsZWFzZV91c2VyX3Bh
Z2VzKHAsIG51bV9wYWdlcywgMSk7CisJcHV0X3VzZXJfcGFnZXNfZGlydHlfbG9jayhwLCBudW1f
cGFnZXMsIHRydWUpOwogCiAJLyogZHVyaW5nIGNsb3NlIGFmdGVyIHNpZ25hbCwgbW0gY2FuIGJl
IE5VTEwgKi8KIAlpZiAoY3VycmVudC0+bW0pCmRpZmYgLS1naXQgYS9kcml2ZXJzL2luZmluaWJh
bmQvaHcvdXNuaWMvdXNuaWNfdWlvbS5jIGIvZHJpdmVycy9pbmZpbmliYW5kL2h3L3VzbmljL3Vz
bmljX3Vpb20uYwppbmRleCAwYjAyMzdkNDE2MTMuLjYyZTZmZmE5YWQ3OCAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9pbmZpbmliYW5kL2h3L3VzbmljL3VzbmljX3Vpb20uYworKysgYi9kcml2ZXJzL2lu
ZmluaWJhbmQvaHcvdXNuaWMvdXNuaWNfdWlvbS5jCkBAIC03NSwxMCArNzUsNyBAQCBzdGF0aWMg
dm9pZCB1c25pY191aW9tX3B1dF9wYWdlcyhzdHJ1Y3QgbGlzdF9oZWFkICpjaHVua19saXN0LCBp
bnQgZGlydHkpCiAJCWZvcl9lYWNoX3NnKGNodW5rLT5wYWdlX2xpc3QsIHNnLCBjaHVuay0+bmVu
dHMsIGkpIHsKIAkJCXBhZ2UgPSBzZ19wYWdlKHNnKTsKIAkJCXBhID0gc2dfcGh5cyhzZyk7Ci0J
CQlpZiAoZGlydHkpCi0JCQkJcHV0X3VzZXJfcGFnZXNfZGlydHlfbG9jaygmcGFnZSwgMSk7Ci0J
CQllbHNlCi0JCQkJcHV0X3VzZXJfcGFnZShwYWdlKTsKKwkJCXB1dF91c2VyX3BhZ2VzX2RpcnR5
X2xvY2soJnBhZ2UsIDEsIGRpcnR5KTsKIAkJCXVzbmljX2RiZygicGE6ICVwYVxuIiwgJnBhKTsK
IAkJfQogCQlrZnJlZShjaHVuayk7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2luZmluaWJhbmQvc3cv
c2l3L3Npd19tZW0uYyBiL2RyaXZlcnMvaW5maW5pYmFuZC9zdy9zaXcvc2l3X21lbS5jCmluZGV4
IDY3MTcxYzgyYjBjNC4uMWUxOTc3NTNiZjJmIDEwMDY0NAotLS0gYS9kcml2ZXJzL2luZmluaWJh
bmQvc3cvc2l3L3Npd19tZW0uYworKysgYi9kcml2ZXJzL2luZmluaWJhbmQvc3cvc2l3L3Npd19t
ZW0uYwpAQCAtNjAsMjAgKzYwLDYgQEAgc3RydWN0IHNpd19tZW0gKnNpd19tZW1faWQyb2JqKHN0
cnVjdCBzaXdfZGV2aWNlICpzZGV2LCBpbnQgc3RhZ19pbmRleCkKIAlyZXR1cm4gTlVMTDsKIH0K
IAotc3RhdGljIHZvaWQgc2l3X2ZyZWVfcGxpc3Qoc3RydWN0IHNpd19wYWdlX2NodW5rICpjaHVu
aywgaW50IG51bV9wYWdlcywKLQkJCSAgIGJvb2wgZGlydHkpCi17Ci0Jc3RydWN0IHBhZ2UgKipw
ID0gY2h1bmstPnBsaXN0OwotCi0Jd2hpbGUgKG51bV9wYWdlcy0tKSB7Ci0JCWlmICghUGFnZURp
cnR5KCpwKSAmJiBkaXJ0eSkKLQkJCXB1dF91c2VyX3BhZ2VzX2RpcnR5X2xvY2socCwgMSk7Ci0J
CWVsc2UKLQkJCXB1dF91c2VyX3BhZ2UoKnApOwotCQlwKys7Ci0JfQotfQotCiB2b2lkIHNpd191
bWVtX3JlbGVhc2Uoc3RydWN0IHNpd191bWVtICp1bWVtLCBib29sIGRpcnR5KQogewogCXN0cnVj
dCBtbV9zdHJ1Y3QgKm1tX3MgPSB1bWVtLT5vd25pbmdfbW07CkBAIC04Miw4ICs2OCw5IEBAIHZv
aWQgc2l3X3VtZW1fcmVsZWFzZShzdHJ1Y3Qgc2l3X3VtZW0gKnVtZW0sIGJvb2wgZGlydHkpCiAJ
Zm9yIChpID0gMDsgbnVtX3BhZ2VzOyBpKyspIHsKIAkJaW50IHRvX2ZyZWUgPSBtaW5fdChpbnQs
IFBBR0VTX1BFUl9DSFVOSywgbnVtX3BhZ2VzKTsKIAotCQlzaXdfZnJlZV9wbGlzdCgmdW1lbS0+
cGFnZV9jaHVua1tpXSwgdG9fZnJlZSwKLQkJCSAgICAgICB1bWVtLT53cml0YWJsZSAmJiBkaXJ0
eSk7CisJCXB1dF91c2VyX3BhZ2VzX2RpcnR5X2xvY2sodW1lbS0+cGFnZV9jaHVua1tpXS5wbGlz
dCwKKwkJCQkJICB0b19mcmVlLAorCQkJCQkgIHVtZW0tPndyaXRhYmxlICYmIGRpcnR5KTsKIAkJ
a2ZyZWUodW1lbS0+cGFnZV9jaHVua1tpXS5wbGlzdCk7CiAJCW51bV9wYWdlcyAtPSB0b19mcmVl
OwogCX0KZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvbW0uaCBiL2luY2x1ZGUvbGludXgvbW0u
aAppbmRleCAwMzM0Y2E5N2M1ODQuLjk3NTliNmEyNDQyMCAxMDA2NDQKLS0tIGEvaW5jbHVkZS9s
aW51eC9tbS5oCisrKyBiL2luY2x1ZGUvbGludXgvbW0uaApAQCAtMTA1Nyw4ICsxMDU3LDkgQEAg
c3RhdGljIGlubGluZSB2b2lkIHB1dF91c2VyX3BhZ2Uoc3RydWN0IHBhZ2UgKnBhZ2UpCiAJcHV0
X3BhZ2UocGFnZSk7CiB9CiAKLXZvaWQgcHV0X3VzZXJfcGFnZXNfZGlydHkoc3RydWN0IHBhZ2Ug
KipwYWdlcywgdW5zaWduZWQgbG9uZyBucGFnZXMpOwotdm9pZCBwdXRfdXNlcl9wYWdlc19kaXJ0
eV9sb2NrKHN0cnVjdCBwYWdlICoqcGFnZXMsIHVuc2lnbmVkIGxvbmcgbnBhZ2VzKTsKK3ZvaWQg
cHV0X3VzZXJfcGFnZXNfZGlydHlfbG9jayhzdHJ1Y3QgcGFnZSAqKnBhZ2VzLCB1bnNpZ25lZCBs
b25nIG5wYWdlcywKKwkJCSAgICAgICBib29sIG1ha2VfZGlydHkpOworCiB2b2lkIHB1dF91c2Vy
X3BhZ2VzKHN0cnVjdCBwYWdlICoqcGFnZXMsIHVuc2lnbmVkIGxvbmcgbnBhZ2VzKTsKIAogI2lm
IGRlZmluZWQoQ09ORklHX1NQQVJTRU1FTSkgJiYgIWRlZmluZWQoQ09ORklHX1NQQVJTRU1FTV9W
TUVNTUFQKQpkaWZmIC0tZ2l0IGEvbW0vZ3VwLmMgYi9tbS9ndXAuYwppbmRleCA5OGYxM2FiMzdi
YWMuLjdmNTczN2VkYjYyNCAxMDA2NDQKLS0tIGEvbW0vZ3VwLmMKKysrIGIvbW0vZ3VwLmMKQEAg
LTI5LDg1ICsyOSw2MiBAQCBzdHJ1Y3QgZm9sbG93X3BhZ2VfY29udGV4dCB7CiAJdW5zaWduZWQg
aW50IHBhZ2VfbWFzazsKIH07CiAKLXR5cGVkZWYgaW50ICgqc2V0X2RpcnR5X2Z1bmNfdCkoc3Ry
dWN0IHBhZ2UgKnBhZ2UpOwotCi1zdGF0aWMgdm9pZCBfX3B1dF91c2VyX3BhZ2VzX2RpcnR5KHN0
cnVjdCBwYWdlICoqcGFnZXMsCi0JCQkJICAgdW5zaWduZWQgbG9uZyBucGFnZXMsCi0JCQkJICAg
c2V0X2RpcnR5X2Z1bmNfdCBzZGYpCi17Ci0JdW5zaWduZWQgbG9uZyBpbmRleDsKLQotCWZvciAo
aW5kZXggPSAwOyBpbmRleCA8IG5wYWdlczsgaW5kZXgrKykgewotCQlzdHJ1Y3QgcGFnZSAqcGFn
ZSA9IGNvbXBvdW5kX2hlYWQocGFnZXNbaW5kZXhdKTsKLQotCQkvKgotCQkgKiBDaGVja2luZyBQ
YWdlRGlydHkgYXQgdGhpcyBwb2ludCBtYXkgcmFjZSB3aXRoCi0JCSAqIGNsZWFyX3BhZ2VfZGly
dHlfZm9yX2lvKCksIGJ1dCB0aGF0J3MgT0suIFR3byBrZXkgY2FzZXM6Ci0JCSAqCi0JCSAqIDEp
IFRoaXMgY29kZSBzZWVzIHRoZSBwYWdlIGFzIGFscmVhZHkgZGlydHksIHNvIGl0IHNraXBzCi0J
CSAqIHRoZSBjYWxsIHRvIHNkZigpLiBUaGF0IGNvdWxkIGhhcHBlbiBiZWNhdXNlCi0JCSAqIGNs
ZWFyX3BhZ2VfZGlydHlfZm9yX2lvKCkgY2FsbGVkIHBhZ2VfbWtjbGVhbigpLAotCQkgKiBmb2xs
b3dlZCBieSBzZXRfcGFnZV9kaXJ0eSgpLiBIb3dldmVyLCBub3cgdGhlIHBhZ2UgaXMKLQkJICog
Z29pbmcgdG8gZ2V0IHdyaXR0ZW4gYmFjaywgd2hpY2ggbWVldHMgdGhlIG9yaWdpbmFsCi0JCSAq
IGludGVudGlvbiBvZiBzZXR0aW5nIGl0IGRpcnR5LCBzbyBhbGwgaXMgd2VsbDoKLQkJICogY2xl
YXJfcGFnZV9kaXJ0eV9mb3JfaW8oKSBnb2VzIG9uIHRvIGNhbGwKLQkJICogVGVzdENsZWFyUGFn
ZURpcnR5KCksIGFuZCB3cml0ZSB0aGUgcGFnZSBiYWNrLgotCQkgKgotCQkgKiAyKSBUaGlzIGNv
ZGUgc2VlcyB0aGUgcGFnZSBhcyBjbGVhbiwgc28gaXQgY2FsbHMgc2RmKCkuCi0JCSAqIFRoZSBw
YWdlIHN0YXlzIGRpcnR5LCBkZXNwaXRlIGJlaW5nIHdyaXR0ZW4gYmFjaywgc28gaXQKLQkJICog
Z2V0cyB3cml0dGVuIGJhY2sgYWdhaW4gaW4gdGhlIG5leHQgd3JpdGViYWNrIGN5Y2xlLgotCQkg
KiBUaGlzIGlzIGhhcm1sZXNzLgotCQkgKi8KLQkJaWYgKCFQYWdlRGlydHkocGFnZSkpCi0JCQlz
ZGYocGFnZSk7Ci0KLQkJcHV0X3VzZXJfcGFnZShwYWdlKTsKLQl9Ci19Ci0KIC8qKgotICogcHV0
X3VzZXJfcGFnZXNfZGlydHkoKSAtIHJlbGVhc2UgYW5kIGRpcnR5IGFuIGFycmF5IG9mIGd1cC1w
aW5uZWQgcGFnZXMKLSAqIEBwYWdlczogIGFycmF5IG9mIHBhZ2VzIHRvIGJlIG1hcmtlZCBkaXJ0
eSBhbmQgcmVsZWFzZWQuCisgKiBwdXRfdXNlcl9wYWdlc19kaXJ0eV9sb2NrKCkgLSByZWxlYXNl
IGFuZCBvcHRpb25hbGx5IGRpcnR5IGd1cC1waW5uZWQgcGFnZXMKKyAqIEBwYWdlczogIGFycmF5
IG9mIHBhZ2VzIHRvIGJlIHB1dAogICogQG5wYWdlczogbnVtYmVyIG9mIHBhZ2VzIGluIHRoZSBA
cGFnZXMgYXJyYXkuCisgKiBAbWFrZV9kaXJ0eTogd2hldGhlciB0byBtYXJrIHRoZSBwYWdlcyBk
aXJ0eQogICoKICAqICJndXAtcGlubmVkIHBhZ2UiIHJlZmVycyB0byBhIHBhZ2UgdGhhdCBoYXMg
aGFkIG9uZSBvZiB0aGUgZ2V0X3VzZXJfcGFnZXMoKQogICogdmFyaWFudHMgY2FsbGVkIG9uIHRo
YXQgcGFnZS4KICAqCi0gKiBGb3IgZWFjaCBwYWdlIGluIHRoZSBAcGFnZXMgYXJyYXksIG1ha2Ug
dGhhdCBwYWdlIChvciBpdHMgaGVhZCBwYWdlLCBpZiBhCi0gKiBjb21wb3VuZCBwYWdlKSBkaXJ0
eSwgaWYgaXQgd2FzIHByZXZpb3VzbHkgbGlzdGVkIGFzIGNsZWFuLiBUaGVuLCByZWxlYXNlCi0g
KiB0aGUgcGFnZSB1c2luZyBwdXRfdXNlcl9wYWdlKCkuCisgKiBGb3IgZWFjaCBwYWdlIGluIHRo
ZSBAcGFnZXMgYXJyYXksIHJlbGVhc2UgdGhlIHBhZ2UuICBJZiBAbWFrZV9kaXJ0eSBpcworICog
dHJ1ZSwgbWFyayB0aGUgcGFnZSBkaXJ0eSBwcmlvciB0byByZWxlYXNlLgogICoKICAqIFBsZWFz
ZSBzZWUgdGhlIHB1dF91c2VyX3BhZ2UoKSBkb2N1bWVudGF0aW9uIGZvciBkZXRhaWxzLgogICoK
LSAqIHNldF9wYWdlX2RpcnR5KCksIHdoaWNoIGRvZXMgbm90IGxvY2sgdGhlIHBhZ2UsIGlzIHVz
ZWQgaGVyZS4KLSAqIFRoZXJlZm9yZSwgaXQgaXMgdGhlIGNhbGxlcidzIHJlc3BvbnNpYmlsaXR5
IHRvIGVuc3VyZSB0aGF0IHRoaXMgaXMKLSAqIHNhZmUuIElmIG5vdCwgdGhlbiBwdXRfdXNlcl9w
YWdlc19kaXJ0eV9sb2NrKCkgc2hvdWxkIGJlIGNhbGxlZCBpbnN0ZWFkLgorICogc2V0X3BhZ2Vf
ZGlydHlfbG9jaygpIGlzIHVzZWQgaW50ZXJuYWxseS4gSWYgaW5zdGVhZCwgc2V0X3BhZ2VfZGly
dHkoKSBpcworICogcmVxdWlyZWQsIHRoZW4gdGhlIGNhbGxlciBzaG91bGQgYSkgdmVyaWZ5IHRo
YXQgdGhpcyBpcyByZWFsbHkgY29ycmVjdCwKKyAqIGJlY2F1c2UgX2xvY2soKSBpcyB1c3VhbGx5
IHJlcXVpcmVkLCBhbmQgYikgaGFuZCBjb2RlIGl0OgorICogc2V0X3BhZ2VfZGlydHlfbG9jaygp
LCBwdXRfdXNlcl9wYWdlKCkuCiAgKgogICovCi12b2lkIHB1dF91c2VyX3BhZ2VzX2RpcnR5KHN0
cnVjdCBwYWdlICoqcGFnZXMsIHVuc2lnbmVkIGxvbmcgbnBhZ2VzKQordm9pZCBwdXRfdXNlcl9w
YWdlc19kaXJ0eV9sb2NrKHN0cnVjdCBwYWdlICoqcGFnZXMsIHVuc2lnbmVkIGxvbmcgbnBhZ2Vz
LAorCQkJICAgICAgIGJvb2wgbWFrZV9kaXJ0eSkKIHsKLQlfX3B1dF91c2VyX3BhZ2VzX2RpcnR5
KHBhZ2VzLCBucGFnZXMsIHNldF9wYWdlX2RpcnR5KTsKLX0KLUVYUE9SVF9TWU1CT0wocHV0X3Vz
ZXJfcGFnZXNfZGlydHkpOworCXVuc2lnbmVkIGxvbmcgaW5kZXg7CiAKLS8qKgotICogcHV0X3Vz
ZXJfcGFnZXNfZGlydHlfbG9jaygpIC0gcmVsZWFzZSBhbmQgZGlydHkgYW4gYXJyYXkgb2YgZ3Vw
LXBpbm5lZCBwYWdlcwotICogQHBhZ2VzOiAgYXJyYXkgb2YgcGFnZXMgdG8gYmUgbWFya2VkIGRp
cnR5IGFuZCByZWxlYXNlZC4KLSAqIEBucGFnZXM6IG51bWJlciBvZiBwYWdlcyBpbiB0aGUgQHBh
Z2VzIGFycmF5LgotICoKLSAqIEZvciBlYWNoIHBhZ2UgaW4gdGhlIEBwYWdlcyBhcnJheSwgbWFr
ZSB0aGF0IHBhZ2UgKG9yIGl0cyBoZWFkIHBhZ2UsIGlmIGEKLSAqIGNvbXBvdW5kIHBhZ2UpIGRp
cnR5LCBpZiBpdCB3YXMgcHJldmlvdXNseSBsaXN0ZWQgYXMgY2xlYW4uIFRoZW4sIHJlbGVhc2UK
LSAqIHRoZSBwYWdlIHVzaW5nIHB1dF91c2VyX3BhZ2UoKS4KLSAqCi0gKiBQbGVhc2Ugc2VlIHRo
ZSBwdXRfdXNlcl9wYWdlKCkgZG9jdW1lbnRhdGlvbiBmb3IgZGV0YWlscy4KLSAqCi0gKiBUaGlz
IGlzIGp1c3QgbGlrZSBwdXRfdXNlcl9wYWdlc19kaXJ0eSgpLCBleGNlcHQgdGhhdCBpdCBpbnZv
a2VzCi0gKiBzZXRfcGFnZV9kaXJ0eV9sb2NrKCksIGluc3RlYWQgb2Ygc2V0X3BhZ2VfZGlydHko
KS4KLSAqCi0gKi8KLXZvaWQgcHV0X3VzZXJfcGFnZXNfZGlydHlfbG9jayhzdHJ1Y3QgcGFnZSAq
KnBhZ2VzLCB1bnNpZ25lZCBsb25nIG5wYWdlcykKLXsKLQlfX3B1dF91c2VyX3BhZ2VzX2RpcnR5
KHBhZ2VzLCBucGFnZXMsIHNldF9wYWdlX2RpcnR5X2xvY2spOworCWlmICghbWFrZV9kaXJ0eSkg
eworCQlwdXRfdXNlcl9wYWdlcyhwYWdlcywgbnBhZ2VzKTsKKwkJcmV0dXJuOworCX0KKworCWZv
ciAoaW5kZXggPSAwOyBpbmRleCA8IG5wYWdlczsgaW5kZXgrKykgeworCQlzdHJ1Y3QgcGFnZSAq
cGFnZSA9IGNvbXBvdW5kX2hlYWQocGFnZXNbaW5kZXhdKTsKKwkJLyoKKwkJICogQ2hlY2tpbmcg
UGFnZURpcnR5IGF0IHRoaXMgcG9pbnQgbWF5IHJhY2Ugd2l0aAorCQkgKiBjbGVhcl9wYWdlX2Rp
cnR5X2Zvcl9pbygpLCBidXQgdGhhdCdzIE9LLiBUd28ga2V5CisJCSAqIGNhc2VzOgorCQkgKgor
CQkgKiAxKSBUaGlzIGNvZGUgc2VlcyB0aGUgcGFnZSBhcyBhbHJlYWR5IGRpcnR5LCBzbyBpdAor
CQkgKiBza2lwcyB0aGUgY2FsbCB0byBzZXRfcGFnZV9kaXJ0eSgpLiBUaGF0IGNvdWxkIGhhcHBl
bgorCQkgKiBiZWNhdXNlIGNsZWFyX3BhZ2VfZGlydHlfZm9yX2lvKCkgY2FsbGVkCisJCSAqIHBh
Z2VfbWtjbGVhbigpLCBmb2xsb3dlZCBieSBzZXRfcGFnZV9kaXJ0eSgpLgorCQkgKiBIb3dldmVy
LCBub3cgdGhlIHBhZ2UgaXMgZ29pbmcgdG8gZ2V0IHdyaXR0ZW4gYmFjaywKKwkJICogd2hpY2gg
bWVldHMgdGhlIG9yaWdpbmFsIGludGVudGlvbiBvZiBzZXR0aW5nIGl0CisJCSAqIGRpcnR5LCBz
byBhbGwgaXMgd2VsbDogY2xlYXJfcGFnZV9kaXJ0eV9mb3JfaW8oKSBnb2VzCisJCSAqIG9uIHRv
IGNhbGwgVGVzdENsZWFyUGFnZURpcnR5KCksIGFuZCB3cml0ZSB0aGUgcGFnZQorCQkgKiBiYWNr
LgorCQkgKgorCQkgKiAyKSBUaGlzIGNvZGUgc2VlcyB0aGUgcGFnZSBhcyBjbGVhbiwgc28gaXQg
Y2FsbHMKKwkJICogc2V0X3BhZ2VfZGlydHkoKS4gVGhlIHBhZ2Ugc3RheXMgZGlydHksIGRlc3Bp
dGUgYmVpbmcKKwkJICogd3JpdHRlbiBiYWNrLCBzbyBpdCBnZXRzIHdyaXR0ZW4gYmFjayBhZ2Fp
biBpbiB0aGUKKwkJICogbmV4dCB3cml0ZWJhY2sgY3ljbGUuIFRoaXMgaXMgaGFybWxlc3MuCisJ
CSAqLworCQlpZiAoIVBhZ2VEaXJ0eShwYWdlKSkKKwkJCXNldF9wYWdlX2RpcnR5X2xvY2socGFn
ZSk7CisJCXB1dF91c2VyX3BhZ2UocGFnZSk7CisJfQogfQogRVhQT1JUX1NZTUJPTChwdXRfdXNl
cl9wYWdlc19kaXJ0eV9sb2NrKTsKIAotLSAKMi4yMi4wCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2FtZC1nZng=
