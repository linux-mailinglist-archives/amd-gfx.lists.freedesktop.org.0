Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD6FD3461
	for <lists+amd-gfx@lfdr.de>; Fri, 11 Oct 2019 01:30:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 500EC6E3C4;
	Thu, 10 Oct 2019 23:30:55 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 4186 seconds by postgrey-1.36 at gabe;
 Thu, 10 Oct 2019 20:54:39 UTC
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 719DC6EB87
 for <amd-gfx@lists.freedesktop.org>; Thu, 10 Oct 2019 20:54:39 +0000 (UTC)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x9AJgaqS012504; Thu, 10 Oct 2019 15:44:48 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2vj9ft2v91-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Oct 2019 15:44:48 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x9AJePAo006681;
 Thu, 10 Oct 2019 19:44:47 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma02dal.us.ibm.com with ESMTP id 2vejt7rhhf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Oct 2019 19:44:47 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x9AJijoX15925654
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Oct 2019 19:44:46 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D79AD6A04D;
 Thu, 10 Oct 2019 19:44:45 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 88C836A047;
 Thu, 10 Oct 2019 19:44:45 +0000 (GMT)
Received: from oc6220003374.ibm.com (unknown [9.40.45.99])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Thu, 10 Oct 2019 19:44:45 +0000 (GMT)
From: KyleMahlkuch <kmahlkuc@linux.vnet.ibm.com>
To: alexander.deucher@amd.com
Subject: [PATCH v3] drm/radeon: Fix EEH during kexec
Date: Thu, 10 Oct 2019 14:44:29 -0500
Message-Id: <1570736672-10644-1-git-send-email-kmahlkuc@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-10_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=643 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1910100164
X-Mailman-Approved-At: Thu, 10 Oct 2019 23:30:54 +0000
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
Cc: amd-gfx@lists.freedesktop.org, stable@vger.kernel.org,
 KyleMahlkuch <kmahlkuc@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RHVyaW5nIGtleGVjIHNvbWUgYWRhcHRlcnMgaGl0IGFuIEVFSCBzaW5jZSB0aGV5IGFyZSBub3Qg
cHJvcGVybHkKc2h1dCBkb3duIGluIHRoZSByYWRlb25fcGNpX3NodXRkb3duKCkgZnVuY3Rpb24u
IEFkZGluZwpyYWRlb25fc3VzcGVuZF9rbXMoKSBmaXhlcyB0aGlzIGlzc3VlLgpFbmFibGVkIG9u
bHkgb24gUFBDIGJlY2F1c2UgdGhpcyBwYXRjaCBjYXVzZXMgaXNzdWVzIG9uIHNvbWUgb3RoZXIK
Ym9hcmRzLgoKU2lnbmVkLW9mZi1ieTogS3lsZSBNYWhsa3VjaCA8S3lsZS5NYWhsa3VjaCBhdCBp
Ym0uY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2Rydi5jIHwgMTQgKysr
KysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0v
cmFkZW9uL3JhZGVvbl9kcnYuYwppbmRleCA5ZTU1MDc2Li40NTI4ZjRkIDEwMDY0NAotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9kcnYuYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
cmFkZW9uL3JhZGVvbl9kcnYuYwpAQCAtMzc5LDExICszNzksMjUgQEAgc3RhdGljIGludCByYWRl
b25fcGNpX3Byb2JlKHN0cnVjdCBwY2lfZGV2ICpwZGV2LAogc3RhdGljIHZvaWQKIHJhZGVvbl9w
Y2lfc2h1dGRvd24oc3RydWN0IHBjaV9kZXYgKnBkZXYpCiB7CisjaWZkZWYgQ09ORklHX1BQQzY0
CisJc3RydWN0IGRybV9kZXZpY2UgKmRkZXYgPSBwY2lfZ2V0X2RydmRhdGEocGRldik7CisjZW5k
aWYKKwogCS8qIGlmIHdlIGFyZSBydW5uaW5nIGluIGEgVk0sIG1ha2Ugc3VyZSB0aGUgZGV2aWNl
CiAJICogdG9ybiBkb3duIHByb3Blcmx5IG9uIHJlYm9vdC9zaHV0ZG93bgogCSAqLwogCWlmIChy
YWRlb25fZGV2aWNlX2lzX3ZpcnR1YWwoKSkKIAkJcmFkZW9uX3BjaV9yZW1vdmUocGRldik7CisK
KyNpZmRlZiBDT05GSUdfUFBDNjQKKwkvKiBTb21lIGFkYXB0ZXJzIG5lZWQgdG8gYmUgc3VzcGVu
ZGVkIGJlZm9yZSBhCisJICogc2h1dGRvd24gb2NjdXJzIGluIG9yZGVyIHRvIHByZXZlbnQgYW4g
ZXJyb3IKKwkgKiBkdXJpbmcga2V4ZWMuCisJICogTWFrZSB0aGlzIHBvd2VyIHNwZWNpZmljIGJl
Y2F1YXNlIGl0IGJyZWFrcworCSAqIHNvbWUgbm9uLXBvd2VyIGJvYXJkcy4KKwkgKi8KKwlyYWRl
b25fc3VzcGVuZF9rbXMoZGRldiwgdHJ1ZSwgdHJ1ZSwgZmFsc2UpOworI2VuZGlmCiB9CiAKIHN0
YXRpYyBpbnQgcmFkZW9uX3Btb3BzX3N1c3BlbmQoc3RydWN0IGRldmljZSAqZGV2KQotLSAKMS44
LjMuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1k
LWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
