Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A0D7E1D9
	for <lists+amd-gfx@lfdr.de>; Thu,  1 Aug 2019 20:01:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1FD86E314;
	Thu,  1 Aug 2019 18:00:58 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFA006E30D
 for <amd-gfx@lists.freedesktop.org>; Wed, 31 Jul 2019 22:10:55 +0000 (UTC)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6VM1rOP041038; Wed, 31 Jul 2019 18:10:53 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2u3h7pnbxd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 31 Jul 2019 18:10:53 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x6VM54vU021360;
 Wed, 31 Jul 2019 22:10:52 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma01wdc.us.ibm.com with ESMTP id 2u0e86rb7e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 31 Jul 2019 22:10:52 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x6VMApwX59376076
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 31 Jul 2019 22:10:51 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6FAE778115;
 Wed, 31 Jul 2019 22:10:51 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 16B4678114;
 Wed, 31 Jul 2019 22:10:50 +0000 (GMT)
Received: from oc6220003374.ibm.com (unknown [9.40.45.99])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Wed, 31 Jul 2019 22:10:50 +0000 (GMT)
From: KyleMahlkuch <kmahlkuc@linux.vnet.ibm.com>
To: 
Subject: [PATCH v2] drm/radeon: Fix EEH during kexec
Date: Wed, 31 Jul 2019 17:10:14 -0500
Message-Id: <1564611032-10016-1-git-send-email-kmahlkuc@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-31_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=715 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1907310221
X-Mailman-Approved-At: Thu, 01 Aug 2019 18:00:57 +0000
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
Cc: David1.Zhou@amd.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, KyleMahlkuch <kmahlkuc@linux.vnet.ibm.com>,
 alexander.deucher@amd.com, christian.koenig@amd.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RHVyaW5nIGtleGVjIHNvbWUgYWRhcHRlcnMgaGl0IGFuIEVFSCBzaW5jZSB0aGV5IGFyZSBub3Qg
cHJvcGVybHkKc2h1dCBkb3duIGluIHRoZSByYWRlb25fcGNpX3NodXRkb3duKCkgZnVuY3Rpb24u
IEFkZGluZwpyYWRlb25fc3VzcGVuZF9rbXMoKSBmaXhlcyB0aGlzIGlzc3VlLgoKU2lnbmVkLW9m
Zi1ieTogS3lsZSBNYWhsa3VjaCA8S3lsZS5NYWhsa3VjaCBhdCBpYm0uY29tPgotLS0KIGRyaXZl
cnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2Rydi5jIHwgOCArKysrKysrKwogMSBmaWxlIGNoYW5n
ZWQsIDggaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24v
cmFkZW9uX2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fZHJ2LmMKaW5kZXgg
YTZjYmUxMS4uMTVkN2JlYiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRl
b25fZHJ2LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fZHJ2LmMKQEAgLTM0
OSwxMSArMzQ5LDE5IEBAIHN0YXRpYyBpbnQgcmFkZW9uX3BjaV9wcm9iZShzdHJ1Y3QgcGNpX2Rl
diAqcGRldiwKIHN0YXRpYyB2b2lkCiByYWRlb25fcGNpX3NodXRkb3duKHN0cnVjdCBwY2lfZGV2
ICpwZGV2KQogeworCXN0cnVjdCBkcm1fZGV2aWNlICpkZGV2ID0gcGNpX2dldF9kcnZkYXRhKHBk
ZXYpOworCiAJLyogaWYgd2UgYXJlIHJ1bm5pbmcgaW4gYSBWTSwgbWFrZSBzdXJlIHRoZSBkZXZp
Y2UKIAkgKiB0b3JuIGRvd24gcHJvcGVybHkgb24gcmVib290L3NodXRkb3duCiAJICovCiAJaWYg
KHJhZGVvbl9kZXZpY2VfaXNfdmlydHVhbCgpKQogCQlyYWRlb25fcGNpX3JlbW92ZShwZGV2KTsK
KworCS8qIFNvbWUgYWRhcHRlcnMgbmVlZCB0byBiZSBzdXNwZW5kZWQgYmVmb3JlIGEKKwkqIHNo
dXRkb3duIG9jY3VycyBpbiBvcmRlciB0byBwcmV2ZW50IGFuIGVycm9yCisJKiBkdXJpbmcga2V4
ZWMuCisJKi8KKwlyYWRlb25fc3VzcGVuZF9rbXMoZGRldiwgdHJ1ZSwgdHJ1ZSwgZmFsc2UpOwog
fQogCiBzdGF0aWMgaW50IHJhZGVvbl9wbW9wc19zdXNwZW5kKHN0cnVjdCBkZXZpY2UgKmRldikK
LS0gCjEuOC4zLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
