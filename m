Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 484FBD7EB4
	for <lists+amd-gfx@lfdr.de>; Tue, 15 Oct 2019 20:17:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F59F6E884;
	Tue, 15 Oct 2019 18:17:42 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FF416E87A
 for <amd-gfx@lists.freedesktop.org>; Tue, 15 Oct 2019 18:16:17 +0000 (UTC)
Received: by mail-io1-xd42.google.com with SMTP id b136so48187451iof.3
 for <amd-gfx@lists.freedesktop.org>; Tue, 15 Oct 2019 11:16:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E5hGScokWqPgLdbBrk4RHza3Svxdrvt3RelMxzxNGX0=;
 b=besLmD+aH/yuJXU5/7BGMBxm0ZXBTsytVZnJTJqmljlhYErO83H+8DSNij3LMfmQ2Z
 Lc8v3iOOqGzIql9nsGNQ6YcQS7XDksRrEJVn7iXNuGx0T5NNXrifQOCDWz5pFA9ZZp/4
 650PETOH6K84pr5dis+aJ/f3xHLdv8xB6Xwp8zZLaTtCjHmUiqCtjoIgyZWTwLF5uqaE
 fKvoJRT+JQjALjGWqZ1cgewAL41V7ygy16A/GWUwboGTdH3+PhXm8gseNi971joHXnYa
 f7BLxTNMAX1/+yjy6R9qXQ8CM6a/Bv7nC8ZWZZg6mOdbNMQQ1vUm6Ip4gengKpxT75ij
 5mRw==
X-Gm-Message-State: APjAAAVpU2wApRj4vxZ8jb5FDb2mjJkfKRDbt9VQdtbmC89oI++sZVIi
 H7zpZZpDFmIv6YGA2soYG2RwuA==
X-Google-Smtp-Source: APXvYqwCqiYZ3SkEMQblXOUCwi4JhQL5teRlUkU0KcRoGUDDLgO1heLLmHRP1RmYbHcG9FHn93aEFA==
X-Received: by 2002:a92:5a9b:: with SMTP id b27mr7441321ilg.180.1571163376436; 
 Tue, 15 Oct 2019 11:16:16 -0700 (PDT)
Received: from ziepe.ca ([24.114.26.129])
 by smtp.gmail.com with ESMTPSA id b3sm2941671iln.42.2019.10.15.11.16.15
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 15 Oct 2019 11:16:16 -0700 (PDT)
Received: from jgg by jggl.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1iKRJT-0002CL-IH; Tue, 15 Oct 2019 15:12:51 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jerome Glisse <jglisse@redhat.com>, Ralph Campbell <rcampbell@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>, Felix.Kuehling@amd.com
Subject: [PATCH hmm 08/15] xen/gntdev: Use select for DMA_SHARED_BUFFER
Date: Tue, 15 Oct 2019 15:12:35 -0300
Message-Id: <20191015181242.8343-9-jgg@ziepe.ca>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191015181242.8343-1-jgg@ziepe.ca>
References: <20191015181242.8343-1-jgg@ziepe.ca>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 15 Oct 2019 18:17:39 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E5hGScokWqPgLdbBrk4RHza3Svxdrvt3RelMxzxNGX0=;
 b=IY7PaWcEoDxVF3RjzcFddJeqHnKCTQPHXfIpy/ZpttwuBMU0ukD62rv6NJn+q87jla
 IXutZA2u26Vor+s0oQSuxsRNrCPfLDsESVJ589Opd1LZ0R+URK4YBD+kFwmLrLBoPU6/
 QrUUkUIpST04E4tqDxJ+Jk1U4drJBIlnSZxYI4Bl4QDVhl0PK2MSM5oGR/kUL3z3tNDu
 6o4NOh44rhJyXMoM/uAh1nLdvonpdj8vdasf+naCfwSj0CId6hBhiy07gmILqk/KgFay
 UnZ7D83P4q5IJpWb+fT+I50stolQCQKdlumEuIxFdDr35X2DLJl56axpTHUNubqqx/HW
 iEEg==
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
Cc: Andrea Arcangeli <aarcange@redhat.com>, Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 linux-rdma@vger.kernel.org, amd-gfx@lists.freedesktop.org, linux-mm@kvack.org,
 Jason Gunthorpe <jgg@mellanox.com>, dri-devel@lists.freedesktop.org,
 xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgoKRE1BX1NIQVJFRF9CVUZG
RVIgY2FuIG5vdCBiZSBlbmFibGVkIGJ5IHRoZSB1c2VyIChpdCByZXByZXNlbnRzIGEgbGlicmFy
eQpzZXQgaW4gdGhlIGtlcm5lbCkuIFRoZSBrY29uZmlnIGNvbnZlbnRpb24gaXMgdG8gdXNlIHNl
bGVjdCBmb3Igc3VjaApzeW1ib2xzIHNvIHRoZXkgYXJlIHR1cm5lZCBvbiBpbXBsaWNpdGx5IHdo
ZW4gdGhlIHVzZXIgZW5hYmxlcyBhIGtjb25maWcKdGhhdCBuZWVkcyB0aGVtLgoKT3RoZXJ3aXNl
IHRoZSBYRU5fR05UREVWX0RNQUJVRiBrY29uZmlnIGlzIG92ZXJseSBkaWZmaWN1bHQgdG8gZW5h
YmxlLgoKRml4ZXM6IDkzMmQ2NTYyMTc5ZSAoInhlbi9nbnRkZXY6IEFkZCBpbml0aWFsIHN1cHBv
cnQgZm9yIGRtYS1idWYgVUFQSSIpCkNjOiBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyA8b2xla3Nh
bmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+CkNjOiBCb3JpcyBPc3Ryb3Zza3kgPGJvcmlzLm9z
dHJvdnNreUBvcmFjbGUuY29tPgpDYzogeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCkNj
OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+CkNjOiBTdGVmYW5vIFN0YWJlbGxpbmkg
PHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+ClNpZ25lZC1vZmYtYnk6IEphc29uIEd1bnRob3JwZSA8
amdnQG1lbGxhbm94LmNvbT4KLS0tCiBkcml2ZXJzL3hlbi9LY29uZmlnIHwgMyArKy0KIDEgZmls
ZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL3hlbi9LY29uZmlnIGIvZHJpdmVycy94ZW4vS2NvbmZpZwppbmRleCA3OWNjNzUwOTZm
NDIzMi4uYTUwZGFkZDAxMDkzMzYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMveGVuL0tjb25maWcKKysr
IGIvZHJpdmVycy94ZW4vS2NvbmZpZwpAQCAtMTQxLDcgKzE0MSw4IEBAIGNvbmZpZyBYRU5fR05U
REVWCiAKIGNvbmZpZyBYRU5fR05UREVWX0RNQUJVRgogCWJvb2wgIkFkZCBzdXBwb3J0IGZvciBk
bWEtYnVmIGdyYW50IGFjY2VzcyBkZXZpY2UgZHJpdmVyIGV4dGVuc2lvbiIKLQlkZXBlbmRzIG9u
IFhFTl9HTlRERVYgJiYgWEVOX0dSQU5UX0RNQV9BTExPQyAmJiBETUFfU0hBUkVEX0JVRkZFUgor
CWRlcGVuZHMgb24gWEVOX0dOVERFViAmJiBYRU5fR1JBTlRfRE1BX0FMTE9DCisJc2VsZWN0IERN
QV9TSEFSRURfQlVGRkVSCiAJaGVscAogCSAgQWxsb3dzIHVzZXJzcGFjZSBwcm9jZXNzZXMgYW5k
IGtlcm5lbCBtb2R1bGVzIHRvIHVzZSBYZW4gYmFja2VkCiAJICBkbWEtYnVmIGltcGxlbWVudGF0
aW9uLiBXaXRoIHRoaXMgZXh0ZW5zaW9uIGdyYW50IHJlZmVyZW5jZXMgdG8KLS0gCjIuMjMuMAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
