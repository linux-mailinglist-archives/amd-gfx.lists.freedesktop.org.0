Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 362A98E71F
	for <lists+amd-gfx@lfdr.de>; Thu, 15 Aug 2019 10:41:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5C7C89FDB;
	Thu, 15 Aug 2019 08:41:38 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DE8C6E8B7;
 Thu, 15 Aug 2019 07:27:16 +0000 (UTC)
Received: from [2001:4bb8:18c:28b5:c70:4a89:bc61:2] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hyAAF-00010w-06; Thu, 15 Aug 2019 07:27:15 +0000
From: Christoph Hellwig <hch@lst.de>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "David (ChunMing) Zhou" <David1.Zhou@amd.com>
Subject: [PATCH 4/4] drm/amdgpu: simplify and cleanup setting the dma mask
Date: Thu, 15 Aug 2019 09:27:03 +0200
Message-Id: <20190815072703.7010-5-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190815072703.7010-1-hch@lst.de>
References: <20190815072703.7010-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Thu, 15 Aug 2019 08:41:35 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
 :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aOOFFEKMnnWfkUQ6+f0ZGZafV/dFv2cac5Nj+r5TNwg=; b=mL1Rlf6pCUs6KJaCWyDncsprOD
 UptO53edITEfoLPm9rmJl4TaSqCRE910hw2/biJBlDFeZ1hpyTVLKxBzmNTsESkC4jjh7o1aVvpM1
 DfYe/Tm+vXvx6STtd1Tdnkta85ENBKWwG89h7wwbFgyGKgZchhxUX25p7oDwlNPzqevXbz7D6OEDU
 LMM1pW87k9Bosy6WIAL0SYewBMT4j9QdiyV6YBPNNLg4TQ8wVQNMa2s9GRZqwYWjjo3lhirShFW0Q
 nNaym2zeHnBDoALZq9osjBRrwrJqzwKv8/7hkdoZQcwhMpuaK976dE4Xo9Uv/Zb3MkwShGBWO9Xiv
 u0rlVlOA==;
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
Cc: Atish Patra <Atish.Patra@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VXNlIGRtYV9zZXRfbWFza19hbmRfY29oZXJlbnQgdG8gc2V0IGJvdGggbWFza3MgaW4gb25lIGdv
LCBhbmQgcmVtb3ZlCnRoZSBubyBsb25nZXIgcmVxdWlyZWQgZmFsbGJhY2ssIGFzIHRoZSBrZXJu
ZWwgbm93IGFsd2F5cyBhY2NlcHRzCmxhcmdlciB0aGFuIHJlcXVpcmVkIERNQSBtYXNrcy4gIEZh
aWwgdGhlIGRyaXZlciBwcm9iZSBpZiB3ZSBjYW4ndApzZXQgdGhlIERNQSBtYXNrLCBhcyB0aGF0
IG1lYW5zIHRoZSBzeXN0ZW0gY2FuIG9ubHkgc3VwcG9ydCBhIGxhcmdlcgptYXNrLgoKU2lnbmVk
LW9mZi1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+Ci0tLQogZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1LmggICAgfCAgMSAtCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9nbWNfdjEwXzAuYyB8IDIxICsrLS0tLS0tLS0tLS0tLS0tLS0tLQogZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvZ21jX3Y2XzAuYyAgfCAxNSArKystLS0tLS0tLS0tLS0KIGRyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2dtY192N18wLmMgIHwgMjAgKysrLS0tLS0tLS0tLS0tLS0tLS0K
IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OF8wLmMgIHwgMjAgKysrLS0tLS0tLS0t
LS0tLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMgIHwgMjAgKysr
LS0tLS0tLS0tLS0tLS0tLS0KIDYgZmlsZXMgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKSwgODMg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1LmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHUuaAppbmRleCA4MTk5ZDIw
MWI0M2EuLmFiNTYyYzI3YmI0NCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1LmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1LmgKQEAg
LTc1OCw3ICs3NTgsNiBAQCBzdHJ1Y3QgYW1kZ3B1X2RldmljZSB7CiAJaW50CQkJCXVzZWNfdGlt
ZW91dDsKIAljb25zdCBzdHJ1Y3QgYW1kZ3B1X2FzaWNfZnVuY3MJKmFzaWNfZnVuY3M7CiAJYm9v
bAkJCQlzaHV0ZG93bjsKLQlib29sCQkJCW5lZWRfZG1hMzI7CiAJYm9vbAkJCQluZWVkX3N3aW90
bGI7CiAJYm9vbAkJCQlhY2NlbF93b3JraW5nOwogCXN0cnVjdCBub3RpZmllcl9ibG9jawkJYWNw
aV9uYjsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192MTBfMC5j
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3YxMF8wLmMKaW5kZXggNWVlYjcyZmNj
MTIzLi4wNWM4ODcyZWI4ZDMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2dtY192MTBfMC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192MTBfMC5j
CkBAIC01OTAsNyArNTkwLDYgQEAgc3RhdGljIHVuc2lnbmVkIGdtY192MTBfMF9nZXRfdmJpb3Nf
ZmJfc2l6ZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIHN0YXRpYyBpbnQgZ21jX3YxMF8w
X3N3X2luaXQodm9pZCAqaGFuZGxlKQogewogCWludCByOwotCWludCBkbWFfYml0czsKIAlzdHJ1
Y3QgYW1kZ3B1X2RldmljZSAqYWRldiA9IChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqKWhhbmRsZTsK
IAogCWdmeGh1Yl92Ml8wX2luaXQoYWRldik7CkBAIC02MzcsMjYgKzYzNiwxMCBAQCBzdGF0aWMg
aW50IGdtY192MTBfMF9zd19pbml0KHZvaWQgKmhhbmRsZSkKIAllbHNlCiAJCWFkZXYtPmdtYy5z
dG9sZW5fc2l6ZSA9IDkgKiAxMDI0ICoxMDI0OwogCi0JLyoKLQkgKiBTZXQgRE1BIG1hc2sgKyBu
ZWVkX2RtYTMyIGZsYWdzLgotCSAqIFBDSUUgLSBjYW4gaGFuZGxlIDQ0LWJpdHMuCi0JICogSUdQ
IC0gY2FuIGhhbmRsZSA0NC1iaXRzCi0JICogUENJIC0gZG1hMzIgZm9yIGxlZ2FjeSBwY2kgZ2Fy
dCwgNDQgYml0cyBvbiBuYXZpMTAKLQkgKi8KLQlhZGV2LT5uZWVkX2RtYTMyID0gZmFsc2U7Ci0J
ZG1hX2JpdHMgPSBhZGV2LT5uZWVkX2RtYTMyID8gMzIgOiA0NDsKLQotCXIgPSBwY2lfc2V0X2Rt
YV9tYXNrKGFkZXYtPnBkZXYsIERNQV9CSVRfTUFTSyhkbWFfYml0cykpOworCXIgPSBkbWFfc2V0
X21hc2tfYW5kX2NvaGVyZW50KGFkZXYtPmRldiwgRE1BX0JJVF9NQVNLKDQ0KSk7CiAJaWYgKHIp
IHsKLQkJYWRldi0+bmVlZF9kbWEzMiA9IHRydWU7Ci0JCWRtYV9iaXRzID0gMzI7CiAJCXByaW50
ayhLRVJOX1dBUk5JTkcgImFtZGdwdTogTm8gc3VpdGFibGUgRE1BIGF2YWlsYWJsZS5cbiIpOwot
CX0KLQotCXIgPSBwY2lfc2V0X2NvbnNpc3RlbnRfZG1hX21hc2soYWRldi0+cGRldiwgRE1BX0JJ
VF9NQVNLKGRtYV9iaXRzKSk7Ci0JaWYgKHIpIHsKLQkJcGNpX3NldF9jb25zaXN0ZW50X2RtYV9t
YXNrKGFkZXYtPnBkZXYsIERNQV9CSVRfTUFTSygzMikpOwotCQlwcmludGsoS0VSTl9XQVJOSU5H
ICJhbWRncHU6IE5vIGNvaGVyZW50IERNQSBhdmFpbGFibGUuXG4iKTsKKwkJcmV0dXJuIHI7CiAJ
fQogCiAJciA9IGdtY192MTBfMF9tY19pbml0KGFkZXYpOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y2XzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2dtY192Nl8wLmMKaW5kZXggY2E4ZGJlOTFjYzhiLi4xNDA3M2I1MDZhZmUgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192Nl8wLmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvZ21jX3Y2XzAuYwpAQCAtODM5LDcgKzgzOSw2IEBAIHN0YXRpYyB1bnNp
Z25lZCBnbWNfdjZfMF9nZXRfdmJpb3NfZmJfc2l6ZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRl
dikKIHN0YXRpYyBpbnQgZ21jX3Y2XzBfc3dfaW5pdCh2b2lkICpoYW5kbGUpCiB7CiAJaW50IHI7
Ci0JaW50IGRtYV9iaXRzOwogCXN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2ID0gKHN0cnVjdCBh
bWRncHVfZGV2aWNlICopaGFuZGxlOwogCiAJaWYgKGFkZXYtPmZsYWdzICYgQU1EX0lTX0FQVSkg
ewpAQCAtODYyLDIwICs4NjEsMTIgQEAgc3RhdGljIGludCBnbWNfdjZfMF9zd19pbml0KHZvaWQg
KmhhbmRsZSkKIAogCWFkZXYtPmdtYy5tY19tYXNrID0gMHhmZmZmZmZmZmZmVUxMOwogCi0JYWRl
di0+bmVlZF9kbWEzMiA9IGZhbHNlOwotCWRtYV9iaXRzID0gYWRldi0+bmVlZF9kbWEzMiA/IDMy
IDogNDA7Ci0JciA9IHBjaV9zZXRfZG1hX21hc2soYWRldi0+cGRldiwgRE1BX0JJVF9NQVNLKGRt
YV9iaXRzKSk7CisJciA9IGRtYV9zZXRfbWFza19hbmRfY29oZXJlbnQoYWRldi0+ZGV2LCBETUFf
QklUX01BU0soNDQpKTsKIAlpZiAocikgewotCQlhZGV2LT5uZWVkX2RtYTMyID0gdHJ1ZTsKLQkJ
ZG1hX2JpdHMgPSAzMjsKIAkJZGV2X3dhcm4oYWRldi0+ZGV2LCAiYW1kZ3B1OiBObyBzdWl0YWJs
ZSBETUEgYXZhaWxhYmxlLlxuIik7CisJCXJldHVybiByOwogCX0KLQlyID0gcGNpX3NldF9jb25z
aXN0ZW50X2RtYV9tYXNrKGFkZXYtPnBkZXYsIERNQV9CSVRfTUFTSyhkbWFfYml0cykpOwotCWlm
IChyKSB7Ci0JCXBjaV9zZXRfY29uc2lzdGVudF9kbWFfbWFzayhhZGV2LT5wZGV2LCBETUFfQklU
X01BU0soMzIpKTsKLQkJZGV2X3dhcm4oYWRldi0+ZGV2LCAiYW1kZ3B1OiBObyBjb2hlcmVudCBE
TUEgYXZhaWxhYmxlLlxuIik7Ci0JfQotCWFkZXYtPm5lZWRfc3dpb3RsYiA9IGRybV9uZWVkX3N3
aW90bGIoZG1hX2JpdHMpOworCWFkZXYtPm5lZWRfc3dpb3RsYiA9IGRybV9uZWVkX3N3aW90bGIo
NDQpOwogCiAJciA9IGdtY192Nl8wX2luaXRfbWljcm9jb2RlKGFkZXYpOwogCWlmIChyKSB7CmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjdfMC5jIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y3XzAuYwppbmRleCA1N2Y4MDA2NWQ1N2EuLmNhMzI5
MTVmYmVjYiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y3XzAu
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjdfMC5jCkBAIC05NTksNyAr
OTU5LDYgQEAgc3RhdGljIHVuc2lnbmVkIGdtY192N18wX2dldF92Ymlvc19mYl9zaXplKHN0cnVj
dCBhbWRncHVfZGV2aWNlICphZGV2KQogc3RhdGljIGludCBnbWNfdjdfMF9zd19pbml0KHZvaWQg
KmhhbmRsZSkKIHsKIAlpbnQgcjsKLQlpbnQgZG1hX2JpdHM7CiAJc3RydWN0IGFtZGdwdV9kZXZp
Y2UgKmFkZXYgPSAoc3RydWN0IGFtZGdwdV9kZXZpY2UgKiloYW5kbGU7CiAKIAlpZiAoYWRldi0+
ZmxhZ3MgJiBBTURfSVNfQVBVKSB7CkBAIC05OTAsMjUgKzk4OSwxMiBAQCBzdGF0aWMgaW50IGdt
Y192N18wX3N3X2luaXQodm9pZCAqaGFuZGxlKQogCSAqLwogCWFkZXYtPmdtYy5tY19tYXNrID0g
MHhmZmZmZmZmZmZmVUxMOyAvKiA0MCBiaXQgTUMgKi8KIAotCS8qIHNldCBETUEgbWFzayArIG5l
ZWRfZG1hMzIgZmxhZ3MuCi0JICogUENJRSAtIGNhbiBoYW5kbGUgNDAtYml0cy4KLQkgKiBJR1Ag
LSBjYW4gaGFuZGxlIDQwLWJpdHMKLQkgKiBQQ0kgLSBkbWEzMiBmb3IgbGVnYWN5IHBjaSBnYXJ0
LCA0MCBiaXRzIG9uIG5ld2VyIGFzaWNzCi0JICovCi0JYWRldi0+bmVlZF9kbWEzMiA9IGZhbHNl
OwotCWRtYV9iaXRzID0gYWRldi0+bmVlZF9kbWEzMiA/IDMyIDogNDA7Ci0JciA9IHBjaV9zZXRf
ZG1hX21hc2soYWRldi0+cGRldiwgRE1BX0JJVF9NQVNLKGRtYV9iaXRzKSk7CisJciA9IGRtYV9z
ZXRfbWFza19hbmRfY29oZXJlbnQoYWRldi0+ZGV2LCBETUFfQklUX01BU0soNDApKTsKIAlpZiAo
cikgewotCQlhZGV2LT5uZWVkX2RtYTMyID0gdHJ1ZTsKLQkJZG1hX2JpdHMgPSAzMjsKIAkJcHJf
d2FybigiYW1kZ3B1OiBObyBzdWl0YWJsZSBETUEgYXZhaWxhYmxlXG4iKTsKKwkJcmV0dXJuIHI7
CiAJfQotCXIgPSBwY2lfc2V0X2NvbnNpc3RlbnRfZG1hX21hc2soYWRldi0+cGRldiwgRE1BX0JJ
VF9NQVNLKGRtYV9iaXRzKSk7Ci0JaWYgKHIpIHsKLQkJcGNpX3NldF9jb25zaXN0ZW50X2RtYV9t
YXNrKGFkZXYtPnBkZXYsIERNQV9CSVRfTUFTSygzMikpOwotCQlwcl93YXJuKCJhbWRncHU6IE5v
IGNvaGVyZW50IERNQSBhdmFpbGFibGVcbiIpOwotCX0KLQlhZGV2LT5uZWVkX3N3aW90bGIgPSBk
cm1fbmVlZF9zd2lvdGxiKGRtYV9iaXRzKTsKKwlhZGV2LT5uZWVkX3N3aW90bGIgPSBkcm1fbmVl
ZF9zd2lvdGxiKDQwKTsKIAogCXIgPSBnbWNfdjdfMF9pbml0X21pY3JvY29kZShhZGV2KTsKIAlp
ZiAocikgewpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y4XzAu
YyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OF8wLmMKaW5kZXggOTIzODI4MGQx
ZmY3Li45MDlhODc2NDcwM2UgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2dtY192OF8wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y4XzAuYwpA
QCAtMTA3OSw3ICsxMDc5LDYgQEAgc3RhdGljIHVuc2lnbmVkIGdtY192OF8wX2dldF92Ymlvc19m
Yl9zaXplKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogc3RhdGljIGludCBnbWNfdjhfMF9z
d19pbml0KHZvaWQgKmhhbmRsZSkKIHsKIAlpbnQgcjsKLQlpbnQgZG1hX2JpdHM7CiAJc3RydWN0
IGFtZGdwdV9kZXZpY2UgKmFkZXYgPSAoc3RydWN0IGFtZGdwdV9kZXZpY2UgKiloYW5kbGU7CiAK
IAlpZiAoYWRldi0+ZmxhZ3MgJiBBTURfSVNfQVBVKSB7CkBAIC0xMTE2LDI1ICsxMTE1LDEyIEBA
IHN0YXRpYyBpbnQgZ21jX3Y4XzBfc3dfaW5pdCh2b2lkICpoYW5kbGUpCiAJICovCiAJYWRldi0+
Z21jLm1jX21hc2sgPSAweGZmZmZmZmZmZmZVTEw7IC8qIDQwIGJpdCBNQyAqLwogCi0JLyogc2V0
IERNQSBtYXNrICsgbmVlZF9kbWEzMiBmbGFncy4KLQkgKiBQQ0lFIC0gY2FuIGhhbmRsZSA0MC1i
aXRzLgotCSAqIElHUCAtIGNhbiBoYW5kbGUgNDAtYml0cwotCSAqIFBDSSAtIGRtYTMyIGZvciBs
ZWdhY3kgcGNpIGdhcnQsIDQwIGJpdHMgb24gbmV3ZXIgYXNpY3MKLQkgKi8KLQlhZGV2LT5uZWVk
X2RtYTMyID0gZmFsc2U7Ci0JZG1hX2JpdHMgPSBhZGV2LT5uZWVkX2RtYTMyID8gMzIgOiA0MDsK
LQlyID0gcGNpX3NldF9kbWFfbWFzayhhZGV2LT5wZGV2LCBETUFfQklUX01BU0soZG1hX2JpdHMp
KTsKKwlyID0gZG1hX3NldF9tYXNrX2FuZF9jb2hlcmVudChhZGV2LT5kZXYsIERNQV9CSVRfTUFT
Syg0MCkpOwogCWlmIChyKSB7Ci0JCWFkZXYtPm5lZWRfZG1hMzIgPSB0cnVlOwotCQlkbWFfYml0
cyA9IDMyOwogCQlwcl93YXJuKCJhbWRncHU6IE5vIHN1aXRhYmxlIERNQSBhdmFpbGFibGVcbiIp
OworCQlyZXR1cm4gcjsKIAl9Ci0JciA9IHBjaV9zZXRfY29uc2lzdGVudF9kbWFfbWFzayhhZGV2
LT5wZGV2LCBETUFfQklUX01BU0soZG1hX2JpdHMpKTsKLQlpZiAocikgewotCQlwY2lfc2V0X2Nv
bnNpc3RlbnRfZG1hX21hc2soYWRldi0+cGRldiwgRE1BX0JJVF9NQVNLKDMyKSk7Ci0JCXByX3dh
cm4oImFtZGdwdTogTm8gY29oZXJlbnQgRE1BIGF2YWlsYWJsZVxuIik7Ci0JfQotCWFkZXYtPm5l
ZWRfc3dpb3RsYiA9IGRybV9uZWVkX3N3aW90bGIoZG1hX2JpdHMpOworCWFkZXYtPm5lZWRfc3dp
b3RsYiA9IGRybV9uZWVkX3N3aW90bGIoNDApOwogCiAJciA9IGdtY192OF8wX2luaXRfbWljcm9j
b2RlKGFkZXYpOwogCWlmIChyKSB7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9nbWNfdjlfMC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAuYwpp
bmRleCA3M2YzYjc5YWIxMzEuLjM4YjkxYTQwN2U2YyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9nbWNfdjlfMC5jCkBAIC05NjgsNyArOTY4LDYgQEAgc3RhdGljIHVuc2lnbmVkIGdtY192OV8w
X2dldF92Ymlvc19mYl9zaXplKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogc3RhdGljIGlu
dCBnbWNfdjlfMF9zd19pbml0KHZvaWQgKmhhbmRsZSkKIHsKIAlpbnQgcjsKLQlpbnQgZG1hX2Jp
dHM7CiAJc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYgPSAoc3RydWN0IGFtZGdwdV9kZXZpY2Ug
KiloYW5kbGU7CiAKIAlnZnhodWJfdjFfMF9pbml0KGFkZXYpOwpAQCAtMTAzMCwyNSArMTAyOSwx
MiBAQCBzdGF0aWMgaW50IGdtY192OV8wX3N3X2luaXQodm9pZCAqaGFuZGxlKQogCSAqLwogCWFk
ZXYtPmdtYy5tY19tYXNrID0gMHhmZmZmZmZmZmZmZmZVTEw7IC8qIDQ4IGJpdCBNQyAqLwogCi0J
Lyogc2V0IERNQSBtYXNrICsgbmVlZF9kbWEzMiBmbGFncy4KLQkgKiBQQ0lFIC0gY2FuIGhhbmRs
ZSA0NC1iaXRzLgotCSAqIElHUCAtIGNhbiBoYW5kbGUgNDQtYml0cwotCSAqIFBDSSAtIGRtYTMy
IGZvciBsZWdhY3kgcGNpIGdhcnQsIDQ0IGJpdHMgb24gdmVnYTEwCi0JICovCi0JYWRldi0+bmVl
ZF9kbWEzMiA9IGZhbHNlOwotCWRtYV9iaXRzID0gYWRldi0+bmVlZF9kbWEzMiA/IDMyIDogNDQ7
Ci0JciA9IHBjaV9zZXRfZG1hX21hc2soYWRldi0+cGRldiwgRE1BX0JJVF9NQVNLKGRtYV9iaXRz
KSk7CisJciA9IGRtYV9zZXRfbWFza19hbmRfY29oZXJlbnQoYWRldi0+ZGV2LCBETUFfQklUX01B
U0soNDQpKTsKIAlpZiAocikgewotCQlhZGV2LT5uZWVkX2RtYTMyID0gdHJ1ZTsKLQkJZG1hX2Jp
dHMgPSAzMjsKIAkJcHJpbnRrKEtFUk5fV0FSTklORyAiYW1kZ3B1OiBObyBzdWl0YWJsZSBETUEg
YXZhaWxhYmxlLlxuIik7CisJCXJldHVybiByOwogCX0KLQlyID0gcGNpX3NldF9jb25zaXN0ZW50
X2RtYV9tYXNrKGFkZXYtPnBkZXYsIERNQV9CSVRfTUFTSyhkbWFfYml0cykpOwotCWlmIChyKSB7
Ci0JCXBjaV9zZXRfY29uc2lzdGVudF9kbWFfbWFzayhhZGV2LT5wZGV2LCBETUFfQklUX01BU0so
MzIpKTsKLQkJcHJpbnRrKEtFUk5fV0FSTklORyAiYW1kZ3B1OiBObyBjb2hlcmVudCBETUEgYXZh
aWxhYmxlLlxuIik7Ci0JfQotCWFkZXYtPm5lZWRfc3dpb3RsYiA9IGRybV9uZWVkX3N3aW90bGIo
ZG1hX2JpdHMpOworCWFkZXYtPm5lZWRfc3dpb3RsYiA9IGRybV9uZWVkX3N3aW90bGIoNDQpOwog
CiAJaWYgKGFkZXYtPmdtYy54Z21pLnN1cHBvcnRlZCkgewogCQlyID0gZ2Z4aHViX3YxXzFfZ2V0
X3hnbWlfaW5mbyhhZGV2KTsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9hbWQtZ2Z4
