Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5488218721C
	for <lists+amd-gfx@lfdr.de>; Mon, 16 Mar 2020 19:18:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A7FD6E49F;
	Mon, 16 Mar 2020 18:18:03 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D05AD6E210;
 Mon, 16 Mar 2020 18:13:26 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 63BBC68BFE; Mon, 16 Mar 2020 19:13:24 +0100 (CET)
Date: Mon, 16 Mar 2020 19:13:24 +0100
From: Christoph Hellwig <hch@lst.de>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH  hmm 2/8] mm/hmm: don't free the cached pgmap while
 scanning
Message-ID: <20200316181324.GA24533@lst.de>
References: <20200311183506.3997-1-jgg@ziepe.ca>
 <20200311183506.3997-3-jgg@ziepe.ca> <20200316090250.GB12439@lst.de>
 <20200316180713.GI20941@ziepe.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200316180713.GI20941@ziepe.ca>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mailman-Approved-At: Mon, 16 Mar 2020 18:18:02 +0000
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
Cc: Philip Yang <Philip.Yang@amd.com>, Ralph Campbell <rcampbell@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>, Felix.Kuehling@amd.com,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Jerome Glisse <jglisse@redhat.com>, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gTW9uLCBNYXIgMTYsIDIwMjAgYXQgMDM6MDc6MTNQTSAtMDMwMCwgSmFzb24gR3VudGhvcnBl
IHdyb3RlOgo+IEkgY2hvc2UgdGhpcyB0byBiZSBzaW1wbGUgd2l0aG91dCBoYXZpbmcgdG8gZ290
byB1bndpbmQgaXQuCj4gCj4gU28sIGluc3RlYWQgbGlrZSB0aGlzOgoKQXMg0ZVhaWQsIGFuZCBw
ZXIgdGhlIHByZXZpb3VzIGRpc2N1c3Npb246ICBJIHRoaW5rIGp1c3QgcmVtb3ZpbmcgdGhlCnBn
bWFwIGxvb2t1cCBpcyB0aGUgcmlnaHQgdGhpbmcgdG8gZG8gaGVyZS4gIFNvbWV0aGluZyBsaWtl
IHRoaXMgcGF0Y2g6CgpkaWZmIC0tZ2l0IGEvbW0vaG1tLmMgYi9tbS9obW0uYwppbmRleCAzZDEw
NDg1YmYzMjMuLjlmMTA0OTgxNWQ0NCAxMDA2NDQKLS0tIGEvbW0vaG1tLmMKKysrIGIvbW0vaG1t
LmMKQEAgLTI4LDcgKzI4LDYgQEAKIAogc3RydWN0IGhtbV92bWFfd2FsayB7CiAJc3RydWN0IGht
bV9yYW5nZQkqcmFuZ2U7Ci0Jc3RydWN0IGRldl9wYWdlbWFwCSpwZ21hcDsKIAl1bnNpZ25lZCBs
b25nCQlsYXN0OwogCXVuc2lnbmVkIGludAkJZmxhZ3M7CiB9OwpAQCAtMTk4LDE1ICsxOTcsOCBA
QCBzdGF0aWMgaW50IGhtbV92bWFfaGFuZGxlX3BtZChzdHJ1Y3QgbW1fd2FsayAqd2FsaywgdW5z
aWduZWQgbG9uZyBhZGRyLAogCQlyZXR1cm4gaG1tX3ZtYV9mYXVsdChhZGRyLCBlbmQsIGZhdWx0
LCB3cml0ZV9mYXVsdCwgd2Fsayk7CiAKIAlwZm4gPSBwbWRfcGZuKHBtZCkgKyAoKGFkZHIgJiB+
UE1EX01BU0spID4+IFBBR0VfU0hJRlQpOwotCWZvciAoaSA9IDA7IGFkZHIgPCBlbmQ7IGFkZHIg
Kz0gUEFHRV9TSVpFLCBpKyssIHBmbisrKSB7Ci0JCWlmIChwbWRfZGV2bWFwKHBtZCkpIHsKLQkJ
CWhtbV92bWFfd2Fsay0+cGdtYXAgPSBnZXRfZGV2X3BhZ2VtYXAocGZuLAotCQkJCQkgICAgICBo
bW1fdm1hX3dhbGstPnBnbWFwKTsKLQkJCWlmICh1bmxpa2VseSghaG1tX3ZtYV93YWxrLT5wZ21h
cCkpCi0JCQkJcmV0dXJuIC1FQlVTWTsKLQkJfQorCWZvciAoaSA9IDA7IGFkZHIgPCBlbmQ7IGFk
ZHIgKz0gUEFHRV9TSVpFLCBpKyssIHBmbisrKQogCQlwZm5zW2ldID0gaG1tX2RldmljZV9lbnRy
eV9mcm9tX3BmbihyYW5nZSwgcGZuKSB8IGNwdV9mbGFnczsKLQl9CiAJaG1tX3ZtYV93YWxrLT5s
YXN0ID0gZW5kOwogCXJldHVybiAwOwogfQpAQCAtMjc3LDE1ICsyNjksNiBAQCBzdGF0aWMgaW50
IGhtbV92bWFfaGFuZGxlX3B0ZShzdHJ1Y3QgbW1fd2FsayAqd2FsaywgdW5zaWduZWQgbG9uZyBh
ZGRyLAogCWlmIChmYXVsdCB8fCB3cml0ZV9mYXVsdCkKIAkJZ290byBmYXVsdDsKIAotCWlmIChw
dGVfZGV2bWFwKHB0ZSkpIHsKLQkJaG1tX3ZtYV93YWxrLT5wZ21hcCA9IGdldF9kZXZfcGFnZW1h
cChwdGVfcGZuKHB0ZSksCi0JCQkJCSAgICAgIGhtbV92bWFfd2Fsay0+cGdtYXApOwotCQlpZiAo
dW5saWtlbHkoIWhtbV92bWFfd2Fsay0+cGdtYXApKSB7Ci0JCQlwdGVfdW5tYXAocHRlcCk7Ci0J
CQlyZXR1cm4gLUVCVVNZOwotCQl9Ci0JfQotCiAJLyoKIAkgKiBTaW5jZSBlYWNoIGFyY2hpdGVj
dHVyZSBkZWZpbmVzIGEgc3RydWN0IHBhZ2UgZm9yIHRoZSB6ZXJvIHBhZ2UsIGp1c3QKIAkgKiBm
YWxsIHRocm91Z2ggYW5kIHRyZWF0IGl0IGxpa2UgYSBub3JtYWwgcGFnZS4KQEAgLTQ1NSwxMiAr
NDM4LDYgQEAgc3RhdGljIGludCBobW1fdm1hX3dhbGtfcHVkKHB1ZF90ICpwdWRwLCB1bnNpZ25l
ZCBsb25nIHN0YXJ0LCB1bnNpZ25lZCBsb25nIGVuZCwKIAogCQlwZm4gPSBwdWRfcGZuKHB1ZCkg
KyAoKGFkZHIgJiB+UFVEX01BU0spID4+IFBBR0VfU0hJRlQpOwogCQlmb3IgKGkgPSAwOyBpIDwg
bnBhZ2VzOyArK2ksICsrcGZuKSB7Ci0JCQlobW1fdm1hX3dhbGstPnBnbWFwID0gZ2V0X2Rldl9w
YWdlbWFwKHBmbiwKLQkJCQkJICAgICAgaG1tX3ZtYV93YWxrLT5wZ21hcCk7Ci0JCQlpZiAodW5s
aWtlbHkoIWhtbV92bWFfd2Fsay0+cGdtYXApKSB7Ci0JCQkJcmV0ID0gLUVCVVNZOwotCQkJCWdv
dG8gb3V0X3VubG9jazsKLQkJCX0KIAkJCXBmbnNbaV0gPSBobW1fZGV2aWNlX2VudHJ5X2Zyb21f
cGZuKHJhbmdlLCBwZm4pIHwKIAkJCQkgIGNwdV9mbGFnczsKIAkJfQpAQCAtNjE0LDE1ICs1OTEs
NiBAQCBsb25nIGhtbV9yYW5nZV9mYXVsdChzdHJ1Y3QgaG1tX3JhbmdlICpyYW5nZSwgdW5zaWdu
ZWQgaW50IGZsYWdzKQogCQkJcmV0dXJuIC1FQlVTWTsKIAkJcmV0ID0gd2Fsa19wYWdlX3Jhbmdl
KG1tLCBobW1fdm1hX3dhbGsubGFzdCwgcmFuZ2UtPmVuZCwKIAkJCQkgICAgICAmaG1tX3dhbGtf
b3BzLCAmaG1tX3ZtYV93YWxrKTsKLQkJLyoKLQkJICogQSBwZ21hcCBpcyBrZXB0IGNhY2hlZCBp
biB0aGUgaG1tX3ZtYV93YWxrIHRvIGF2b2lkIGV4cGVuc2l2ZQotCQkgKiBzZWFyY2hpbmcgaW4g
dGhlIHByb2JhYmx5IGNvbW1vbiBjYXNlIHRoYXQgdGhlIHBnbWFwIGlzIHRoZQotCQkgKiBzYW1l
IGZvciB0aGUgZW50aXJlIHJlcXVlc3RlZCByYW5nZS4KLQkJICovCi0JCWlmIChobW1fdm1hX3dh
bGsucGdtYXApIHsKLQkJCXB1dF9kZXZfcGFnZW1hcChobW1fdm1hX3dhbGsucGdtYXApOwotCQkJ
aG1tX3ZtYV93YWxrLnBnbWFwID0gTlVMTDsKLQkJfQogCX0gd2hpbGUgKHJldCA9PSAtRUJVU1kp
OwogCiAJaWYgKHJldCkKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4Cg==
