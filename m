Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F76C75C47
	for <lists+amd-gfx@lfdr.de>; Fri, 26 Jul 2019 02:57:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA58C6E84F;
	Fri, 26 Jul 2019 00:57:09 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from hqemgate15.nvidia.com (hqemgate15.nvidia.com [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 491646E845;
 Fri, 26 Jul 2019 00:57:07 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5d3a4fea0000>; Thu, 25 Jul 2019 17:57:14 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Thu, 25 Jul 2019 17:57:06 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Thu, 25 Jul 2019 17:57:06 -0700
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 26 Jul
 2019 00:57:04 +0000
Received: from hqnvemgw01.nvidia.com (172.20.150.20) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Fri, 26 Jul 2019 00:57:03 +0000
Received: from rcampbell-dev.nvidia.com (Not Verified[10.110.48.66]) by
 hqnvemgw01.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5d3a4fdf0003>; Thu, 25 Jul 2019 17:57:03 -0700
From: Ralph Campbell <rcampbell@nvidia.com>
To: <linux-mm@kvack.org>
Subject: [PATCH v2 4/7] mm: merge hmm_range_snapshot into hmm_range_fault
Date: Thu, 25 Jul 2019 17:56:47 -0700
Message-ID: <20190726005650.2566-5-rcampbell@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190726005650.2566-1-rcampbell@nvidia.com>
References: <20190726005650.2566-1-rcampbell@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1564102634; bh=ucErf2NgykfAIu7RRloJG8d1JIV1vHLQef+I+l6mEkc=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Type:Content-Transfer-Encoding;
 b=lQZvtydNiQ/49KQg58Da0PcYWPRDnlZegDqjgfVgmt3uTKcedgTkAIGbMli2vDbMD
 kDYa31DvyZNMh8dhuJ2IWfqbIOHBacsH8fBbU16atj2a9BdYcHSnXGYpb80sGZauso
 kfMsmb9lGwi2UoIb1cfA0skaNwNkey7+i7sOSA+oCRseHJn5wPZYyRCW1OssaSpbaH
 n5XiHMrMzFsCN8ZmF602lHwhJBsu0Vm6v3pqDkmjsBerRjL6c7s/OKsS+8ATwd0d1A
 o808TFkEvOypT/yIXFhXFaus06mg5T0Q0CTl+79AxJn20SnOToOr7oAV7jzTnd3Zac
 0Sj7FQ1ciSZPQ==
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
Cc: Ralph Campbell <rcampbell@nvidia.com>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+CgpBZGQgYSBITU1fRkFVTFRfU05B
UFNIT1QgZmxhZyBzbyB0aGF0IGhtbV9yYW5nZV9zbmFwc2hvdCBjYW4gYmUgbWVyZ2VkCmludG8g
dGhlIGFsbW9zdCBpZGVudGljYWwgaG1tX3JhbmdlX2ZhdWx0IGZ1bmN0aW9uLgoKU2lnbmVkLW9m
Zi1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+ClNpZ25lZC1vZmYtYnk6IFJhbHBo
IENhbXBiZWxsIDxyY2FtcGJlbGxAbnZpZGlhLmNvbT4KQ2M6ICJKw6lyw7RtZSBHbGlzc2UiIDxq
Z2xpc3NlQHJlZGhhdC5jb20+CkNjOiBKYXNvbiBHdW50aG9ycGUgPGpnZ0BtZWxsYW5veC5jb20+
Ci0tLQogRG9jdW1lbnRhdGlvbi92bS9obW0ucnN0IHwgMTcgKysrKy0tLS0KIGluY2x1ZGUvbGlu
dXgvaG1tLmggICAgICB8ICA0ICstCiBtbS9obW0uYyAgICAgICAgICAgICAgICAgfCA4NSArLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiAzIGZpbGVzIGNoYW5nZWQsIDEz
IGluc2VydGlvbnMoKyksIDkzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRp
b24vdm0vaG1tLnJzdCBiL0RvY3VtZW50YXRpb24vdm0vaG1tLnJzdAppbmRleCA3MTBjZTFjNzAx
YmYuLmRkY2I1Y2E4YjI5NiAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi92bS9obW0ucnN0Cisr
KyBiL0RvY3VtZW50YXRpb24vdm0vaG1tLnJzdApAQCAtMTkyLDE1ICsxOTIsMTQgQEAgcmVhZCBv
bmx5LCBvciBmdWxseSB1bm1hcCwgZXRjLikuIFRoZSBkZXZpY2UgbXVzdCBjb21wbGV0ZSB0aGUg
dXBkYXRlIGJlZm9yZQogdGhlIGRyaXZlciBjYWxsYmFjayByZXR1cm5zLgogCiBXaGVuIHRoZSBk
ZXZpY2UgZHJpdmVyIHdhbnRzIHRvIHBvcHVsYXRlIGEgcmFuZ2Ugb2YgdmlydHVhbCBhZGRyZXNz
ZXMsIGl0IGNhbgotdXNlIGVpdGhlcjo6Cit1c2U6OgogCi0gIGxvbmcgaG1tX3JhbmdlX3NuYXBz
aG90KHN0cnVjdCBobW1fcmFuZ2UgKnJhbmdlKTsKLSAgbG9uZyBobW1fcmFuZ2VfZmF1bHQoc3Ry
dWN0IGhtbV9yYW5nZSAqcmFuZ2UsIGJvb2wgYmxvY2spOworICBsb25nIGhtbV9yYW5nZV9mYXVs
dChzdHJ1Y3QgaG1tX3JhbmdlICpyYW5nZSwgdW5zaWduZWQgaW50IGZsYWdzKTsKIAotVGhlIGZp
cnN0IG9uZSAoaG1tX3JhbmdlX3NuYXBzaG90KCkpIHdpbGwgb25seSBmZXRjaCBwcmVzZW50IENQ
VSBwYWdlIHRhYmxlCitXaXRoIHRoZSBITU1fUkFOR0VfU05BUFNIT1QgZmxhZywgaXQgd2lsbCBv
bmx5IGZldGNoIHByZXNlbnQgQ1BVIHBhZ2UgdGFibGUKIGVudHJpZXMgYW5kIHdpbGwgbm90IHRy
aWdnZXIgYSBwYWdlIGZhdWx0IG9uIG1pc3Npbmcgb3Igbm9uLXByZXNlbnQgZW50cmllcy4KLVRo
ZSBzZWNvbmQgb25lIGRvZXMgdHJpZ2dlciBhIHBhZ2UgZmF1bHQgb24gbWlzc2luZyBvciByZWFk
LW9ubHkgZW50cmllcyBpZgotd3JpdGUgYWNjZXNzIGlzIHJlcXVlc3RlZCAoc2VlIGJlbG93KS4g
UGFnZSBmYXVsdHMgdXNlIHRoZSBnZW5lcmljIG1tIHBhZ2UKK1dpdGhvdXQgdGhhdCBmbGFnLCBp
dCBkb2VzIHRyaWdnZXIgYSBwYWdlIGZhdWx0IG9uIG1pc3Npbmcgb3IgcmVhZC1vbmx5IGVudHJp
ZXMKK2lmIHdyaXRlIGFjY2VzcyBpcyByZXF1ZXN0ZWQgKHNlZSBiZWxvdykuIFBhZ2UgZmF1bHRz
IHVzZSB0aGUgZ2VuZXJpYyBtbSBwYWdlCiBmYXVsdCBjb2RlIHBhdGgganVzdCBsaWtlIGEgQ1BV
IHBhZ2UgZmF1bHQuCiAKIEJvdGggZnVuY3Rpb25zIGNvcHkgQ1BVIHBhZ2UgdGFibGUgZW50cmll
cyBpbnRvIHRoZWlyIHBmbnMgYXJyYXkgYXJndW1lbnQuIEVhY2gKQEAgLTIyNywyMCArMjI2LDIw
IEBAIFRoZSB1c2FnZSBwYXR0ZXJuIGlzOjoKIAogICAgICAgLyoKICAgICAgICAqIEp1c3Qgd2Fp
dCBmb3IgcmFuZ2UgdG8gYmUgdmFsaWQsIHNhZmUgdG8gaWdub3JlIHJldHVybiB2YWx1ZSBhcyB3
ZQotICAgICAgICogd2lsbCB1c2UgdGhlIHJldHVybiB2YWx1ZSBvZiBobW1fcmFuZ2Vfc25hcHNo
b3QoKSBiZWxvdyB1bmRlciB0aGUKKyAgICAgICAqIHdpbGwgdXNlIHRoZSByZXR1cm4gdmFsdWUg
b2YgaG1tX3JhbmdlX2ZhdWx0KCkgYmVsb3cgdW5kZXIgdGhlCiAgICAgICAgKiBtbWFwX3NlbSB0
byBhc2NlcnRhaW4gdGhlIHZhbGlkaXR5IG9mIHRoZSByYW5nZS4KICAgICAgICAqLwogICAgICAg
aG1tX3JhbmdlX3dhaXRfdW50aWxfdmFsaWQoJnJhbmdlLCBUSU1FT1VUX0lOX01TRUMpOwogCiAg
YWdhaW46CiAgICAgICBkb3duX3JlYWQoJm1tLT5tbWFwX3NlbSk7Ci0gICAgICByZXQgPSBobW1f
cmFuZ2Vfc25hcHNob3QoJnJhbmdlKTsKKyAgICAgIHJldCA9IGhtbV9yYW5nZV9mYXVsdCgmcmFu
Z2UsIEhNTV9SQU5HRV9TTkFQU0hPVCk7CiAgICAgICBpZiAocmV0KSB7CiAgICAgICAgICAgdXBf
cmVhZCgmbW0tPm1tYXBfc2VtKTsKICAgICAgICAgICBpZiAocmV0ID09IC1FQlVTWSkgewogICAg
ICAgICAgICAgLyoKICAgICAgICAgICAgICAqIE5vIG5lZWQgdG8gY2hlY2sgaG1tX3JhbmdlX3dh
aXRfdW50aWxfdmFsaWQoKSByZXR1cm4gdmFsdWUKLSAgICAgICAgICAgICAqIG9uIHJldHJ5IHdl
IHdpbGwgZ2V0IHByb3BlciBlcnJvciB3aXRoIGhtbV9yYW5nZV9zbmFwc2hvdCgpCisgICAgICAg
ICAgICAgKiBvbiByZXRyeSB3ZSB3aWxsIGdldCBwcm9wZXIgZXJyb3Igd2l0aCBobW1fcmFuZ2Vf
ZmF1bHQoKQogICAgICAgICAgICAgICovCiAgICAgICAgICAgICBobW1fcmFuZ2Vfd2FpdF91bnRp
bF92YWxpZCgmcmFuZ2UsIFRJTUVPVVRfSU5fTVNFQyk7CiAgICAgICAgICAgICBnb3RvIGFnYWlu
OwpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9obW0uaCBiL2luY2x1ZGUvbGludXgvaG1tLmgK
aW5kZXggMTVmMWIxMTNiZTNjLi5mMzY5M2RjYzhiOTggMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvbGlu
dXgvaG1tLmgKKysrIGIvaW5jbHVkZS9saW51eC9obW0uaApAQCAtNDEyLDcgKzQxMiw5IEBAIHZv
aWQgaG1tX3JhbmdlX3VucmVnaXN0ZXIoc3RydWN0IGhtbV9yYW5nZSAqcmFuZ2UpOwogICovCiAj
ZGVmaW5lIEhNTV9GQVVMVF9BTExPV19SRVRSWQkJKDEgPDwgMCkKIAotbG9uZyBobW1fcmFuZ2Vf
c25hcHNob3Qoc3RydWN0IGhtbV9yYW5nZSAqcmFuZ2UpOworLyogRG9uJ3QgZmF1bHQgaW4gbWlz
c2luZyBQVEVzLCBqdXN0IHNuYXBzaG90IHRoZSBjdXJyZW50IHN0YXRlLiAqLworI2RlZmluZSBI
TU1fRkFVTFRfU05BUFNIT1QJCSgxIDw8IDEpCisKIGxvbmcgaG1tX3JhbmdlX2ZhdWx0KHN0cnVj
dCBobW1fcmFuZ2UgKnJhbmdlLCB1bnNpZ25lZCBpbnQgZmxhZ3MpOwogCiBsb25nIGhtbV9yYW5n
ZV9kbWFfbWFwKHN0cnVjdCBobW1fcmFuZ2UgKnJhbmdlLApkaWZmIC0tZ2l0IGEvbW0vaG1tLmMg
Yi9tbS9obW0uYwppbmRleCA4NGYyNzkxZDM1MTAuLjFiYzAxNGNkZGQ3OCAxMDA2NDQKLS0tIGEv
bW0vaG1tLmMKKysrIGIvbW0vaG1tLmMKQEAgLTI4MCw3ICsyODAsNiBAQCBzdHJ1Y3QgaG1tX3Zt
YV93YWxrIHsKIAlzdHJ1Y3QgaG1tX3JhbmdlCSpyYW5nZTsKIAlzdHJ1Y3QgZGV2X3BhZ2VtYXAJ
KnBnbWFwOwogCXVuc2lnbmVkIGxvbmcJCWxhc3Q7Ci0JYm9vbAkJCWZhdWx0OwogCXVuc2lnbmVk
IGludAkJZmxhZ3M7CiB9OwogCkBAIC0zNzMsNyArMzcyLDcgQEAgc3RhdGljIGlubGluZSB2b2lk
IGhtbV9wdGVfbmVlZF9mYXVsdChjb25zdCBzdHJ1Y3QgaG1tX3ZtYV93YWxrICpobW1fdm1hX3dh
bGssCiB7CiAJc3RydWN0IGhtbV9yYW5nZSAqcmFuZ2UgPSBobW1fdm1hX3dhbGstPnJhbmdlOwog
Ci0JaWYgKCFobW1fdm1hX3dhbGstPmZhdWx0KQorCWlmIChobW1fdm1hX3dhbGstPmZsYWdzICYg
SE1NX0ZBVUxUX1NOQVBTSE9UKQogCQlyZXR1cm47CiAKIAkvKgpAQCAtNDE4LDcgKzQxNyw3IEBA
IHN0YXRpYyB2b2lkIGhtbV9yYW5nZV9uZWVkX2ZhdWx0KGNvbnN0IHN0cnVjdCBobW1fdm1hX3dh
bGsgKmhtbV92bWFfd2FsaywKIHsKIAl1bnNpZ25lZCBsb25nIGk7CiAKLQlpZiAoIWhtbV92bWFf
d2Fsay0+ZmF1bHQpIHsKKwlpZiAoaG1tX3ZtYV93YWxrLT5mbGFncyAmIEhNTV9GQVVMVF9TTkFQ
U0hPVCkgewogCQkqZmF1bHQgPSAqd3JpdGVfZmF1bHQgPSBmYWxzZTsKIAkJcmV0dXJuOwogCX0K
QEAgLTkzNiw4NSArOTM1LDYgQEAgdm9pZCBobW1fcmFuZ2VfdW5yZWdpc3RlcihzdHJ1Y3QgaG1t
X3JhbmdlICpyYW5nZSkKIH0KIEVYUE9SVF9TWU1CT0woaG1tX3JhbmdlX3VucmVnaXN0ZXIpOwog
Ci0vKgotICogaG1tX3JhbmdlX3NuYXBzaG90KCkgLSBzbmFwc2hvdCBDUFUgcGFnZSB0YWJsZSBm
b3IgYSByYW5nZQotICogQHJhbmdlOiByYW5nZQotICogUmV0dXJuOiAtRUlOVkFMIGlmIGludmFs
aWQgYXJndW1lbnQsIC1FTk9NRU0gb3V0IG9mIG1lbW9yeSwgLUVQRVJNIGludmFsaWQKLSAqICAg
ICAgICAgIHBlcm1pc3Npb24gKGZvciBpbnN0YW5jZSBhc2tpbmcgZm9yIHdyaXRlIGFuZCByYW5n
ZSBpcyByZWFkIG9ubHkpLAotICogICAgICAgICAgLUVCVVNZIGlmIHlvdSBuZWVkIHRvIHJldHJ5
LCAtRUZBVUxUIGludmFsaWQgKGllIGVpdGhlciBubyB2YWxpZAotICogICAgICAgICAgdm1hIG9y
IGl0IGlzIGlsbGVnYWwgdG8gYWNjZXNzIHRoYXQgcmFuZ2UpLCBudW1iZXIgb2YgdmFsaWQgcGFn
ZXMKLSAqICAgICAgICAgIGluIHJhbmdlLT5wZm5zW10gKGZyb20gcmFuZ2Ugc3RhcnQgYWRkcmVz
cykuCi0gKgotICogVGhpcyBzbmFwc2hvdHMgdGhlIENQVSBwYWdlIHRhYmxlIGZvciBhIHJhbmdl
IG9mIHZpcnR1YWwgYWRkcmVzc2VzLiBTbmFwc2hvdAotICogdmFsaWRpdHkgaXMgdHJhY2tlZCBi
eSByYW5nZSBzdHJ1Y3QuIFNlZSBpbiBpbmNsdWRlL2xpbnV4L2htbS5oIGZvciBleGFtcGxlCi0g
KiBvbiBob3cgdG8gdXNlLgotICovCi1sb25nIGhtbV9yYW5nZV9zbmFwc2hvdChzdHJ1Y3QgaG1t
X3JhbmdlICpyYW5nZSkKLXsKLQljb25zdCB1bnNpZ25lZCBsb25nIGRldmljZV92bWEgPSBWTV9J
TyB8IFZNX1BGTk1BUCB8IFZNX01JWEVETUFQOwotCXVuc2lnbmVkIGxvbmcgc3RhcnQgPSByYW5n
ZS0+c3RhcnQsIGVuZDsKLQlzdHJ1Y3QgaG1tX3ZtYV93YWxrIGhtbV92bWFfd2FsazsKLQlzdHJ1
Y3QgaG1tICpobW0gPSByYW5nZS0+aG1tOwotCXN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hOwot
CXN0cnVjdCBtbV93YWxrIG1tX3dhbGs7Ci0KLQlsb2NrZGVwX2Fzc2VydF9oZWxkKCZobW0tPm1t
LT5tbWFwX3NlbSk7Ci0JZG8gewotCQkvKiBJZiByYW5nZSBpcyBubyBsb25nZXIgdmFsaWQgZm9y
Y2UgcmV0cnkuICovCi0JCWlmICghcmFuZ2UtPnZhbGlkKQotCQkJcmV0dXJuIC1FQlVTWTsKLQot
CQl2bWEgPSBmaW5kX3ZtYShobW0tPm1tLCBzdGFydCk7Ci0JCWlmICh2bWEgPT0gTlVMTCB8fCAo
dm1hLT52bV9mbGFncyAmIGRldmljZV92bWEpKQotCQkJcmV0dXJuIC1FRkFVTFQ7Ci0KLQkJaWYg
KGlzX3ZtX2h1Z2V0bGJfcGFnZSh2bWEpKSB7Ci0JCQlpZiAoaHVnZV9wYWdlX3NoaWZ0KGhzdGF0
ZV92bWEodm1hKSkgIT0KLQkJCQkgICAgcmFuZ2UtPnBhZ2Vfc2hpZnQgJiYKLQkJCSAgICByYW5n
ZS0+cGFnZV9zaGlmdCAhPSBQQUdFX1NISUZUKQotCQkJCXJldHVybiAtRUlOVkFMOwotCQl9IGVs
c2UgewotCQkJaWYgKHJhbmdlLT5wYWdlX3NoaWZ0ICE9IFBBR0VfU0hJRlQpCi0JCQkJcmV0dXJu
IC1FSU5WQUw7Ci0JCX0KLQotCQlpZiAoISh2bWEtPnZtX2ZsYWdzICYgVk1fUkVBRCkpIHsKLQkJ
CS8qCi0JCQkgKiBJZiB2bWEgZG8gbm90IGFsbG93IHJlYWQgYWNjZXNzLCB0aGVuIGFzc3VtZSB0
aGF0IGl0Ci0JCQkgKiBkb2VzIG5vdCBhbGxvdyB3cml0ZSBhY2Nlc3MsIGVpdGhlci4gSE1NIGRv
ZXMgbm90Ci0JCQkgKiBzdXBwb3J0IGFyY2hpdGVjdHVyZSB0aGF0IGFsbG93IHdyaXRlIHdpdGhv
dXQgcmVhZC4KLQkJCSAqLwotCQkJaG1tX3BmbnNfY2xlYXIocmFuZ2UsIHJhbmdlLT5wZm5zLAot
CQkJCXJhbmdlLT5zdGFydCwgcmFuZ2UtPmVuZCk7Ci0JCQlyZXR1cm4gLUVQRVJNOwotCQl9Ci0K
LQkJcmFuZ2UtPnZtYSA9IHZtYTsKLQkJaG1tX3ZtYV93YWxrLnBnbWFwID0gTlVMTDsKLQkJaG1t
X3ZtYV93YWxrLmxhc3QgPSBzdGFydDsKLQkJaG1tX3ZtYV93YWxrLmZhdWx0ID0gZmFsc2U7Ci0J
CWhtbV92bWFfd2Fsay5yYW5nZSA9IHJhbmdlOwotCQltbV93YWxrLnByaXZhdGUgPSAmaG1tX3Zt
YV93YWxrOwotCQllbmQgPSBtaW4ocmFuZ2UtPmVuZCwgdm1hLT52bV9lbmQpOwotCi0JCW1tX3dh
bGsudm1hID0gdm1hOwotCQltbV93YWxrLm1tID0gdm1hLT52bV9tbTsKLQkJbW1fd2Fsay5wdGVf
ZW50cnkgPSBOVUxMOwotCQltbV93YWxrLnRlc3Rfd2FsayA9IE5VTEw7Ci0JCW1tX3dhbGsuaHVn
ZXRsYl9lbnRyeSA9IE5VTEw7Ci0JCW1tX3dhbGsucHVkX2VudHJ5ID0gaG1tX3ZtYV93YWxrX3B1
ZDsKLQkJbW1fd2Fsay5wbWRfZW50cnkgPSBobW1fdm1hX3dhbGtfcG1kOwotCQltbV93YWxrLnB0
ZV9ob2xlID0gaG1tX3ZtYV93YWxrX2hvbGU7Ci0JCW1tX3dhbGsuaHVnZXRsYl9lbnRyeSA9IGht
bV92bWFfd2Fsa19odWdldGxiX2VudHJ5OwotCi0JCXdhbGtfcGFnZV9yYW5nZShzdGFydCwgZW5k
LCAmbW1fd2Fsayk7Ci0JCXN0YXJ0ID0gZW5kOwotCX0gd2hpbGUgKHN0YXJ0IDwgcmFuZ2UtPmVu
ZCk7Ci0KLQlyZXR1cm4gKGhtbV92bWFfd2Fsay5sYXN0IC0gcmFuZ2UtPnN0YXJ0KSA+PiBQQUdF
X1NISUZUOwotfQotRVhQT1JUX1NZTUJPTChobW1fcmFuZ2Vfc25hcHNob3QpOwotCiAvKioKICAq
IGhtbV9yYW5nZV9mYXVsdCAtIHRyeSB0byBmYXVsdCBzb21lIGFkZHJlc3MgaW4gYSB2aXJ0dWFs
IGFkZHJlc3MgcmFuZ2UKICAqIEByYW5nZToJcmFuZ2UgYmVpbmcgZmF1bHRlZApAQCAtMTA4OCw3
ICsxMDA4LDYgQEAgbG9uZyBobW1fcmFuZ2VfZmF1bHQoc3RydWN0IGhtbV9yYW5nZSAqcmFuZ2Us
IHVuc2lnbmVkIGludCBmbGFncykKIAkJcmFuZ2UtPnZtYSA9IHZtYTsKIAkJaG1tX3ZtYV93YWxr
LnBnbWFwID0gTlVMTDsKIAkJaG1tX3ZtYV93YWxrLmxhc3QgPSBzdGFydDsKLQkJaG1tX3ZtYV93
YWxrLmZhdWx0ID0gdHJ1ZTsKIAkJaG1tX3ZtYV93YWxrLmZsYWdzID0gZmxhZ3M7CiAJCWhtbV92
bWFfd2Fsay5yYW5nZSA9IHJhbmdlOwogCQltbV93YWxrLnByaXZhdGUgPSAmaG1tX3ZtYV93YWxr
OwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
