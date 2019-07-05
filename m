Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 108F460C0E
	for <lists+amd-gfx@lfdr.de>; Fri,  5 Jul 2019 22:07:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F9706E52C;
	Fri,  5 Jul 2019 20:07:36 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4AA96E52A
 for <amd-gfx@lists.freedesktop.org>; Fri,  5 Jul 2019 19:43:49 +0000 (UTC)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x65Jg7k3095231
 for <amd-gfx@lists.freedesktop.org>; Fri, 5 Jul 2019 15:43:48 -0400
Received: from e31.co.us.ibm.com (e31.co.us.ibm.com [32.97.110.149])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2tj9s5761g-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <amd-gfx@lists.freedesktop.org>; Fri, 05 Jul 2019 15:43:48 -0400
Received: from localhost
 by e31.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <amd-gfx@lists.freedesktop.org> from <kmahlkuc@linux.vnet.ibm.com>;
 Fri, 5 Jul 2019 20:43:47 +0100
Received: from b03cxnp08026.gho.boulder.ibm.com (9.17.130.18)
 by e31.co.us.ibm.com (192.168.1.131) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 5 Jul 2019 20:43:46 +0100
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x65JgUGH60293380
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 5 Jul 2019 19:42:30 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2BB9DC6059;
 Fri,  5 Jul 2019 19:42:30 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EB2A3C6055;
 Fri,  5 Jul 2019 19:42:29 +0000 (GMT)
Received: from oc6220003374.ibm.com (unknown [9.40.45.99])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Fri,  5 Jul 2019 19:42:29 +0000 (GMT)
From: KyleMahlkuch <kmahlkuc@linux.vnet.ibm.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH] Fix EEH during kexec
Date: Fri,  5 Jul 2019 14:41:25 -0500
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
x-cbid: 19070519-8235-0000-0000-00000EB32044
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011384; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01227923; UDB=6.00646569; IPR=6.01009164; 
 MB=3.00027600; MTD=3.00000008; XFM=3.00000015; UTC=2019-07-05 19:43:47
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19070519-8236-0000-0000-000046490381
Message-Id: <1562355687-16627-1-git-send-email-kmahlkuc@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-05_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=753 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907050247
X-Mailman-Approved-At: Fri, 05 Jul 2019 20:07:35 +0000
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
Cc: KyleMahlkuch <kmahlkuc@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RHVyaW5nIGtleGVjIHNvbWUgYWRhcHRlcnMgaGl0IGFuIEVFSCBzaW5jZSB0aGV5IGFyZSBub3Qg
cHJvcGVybHkKc2h1dCBkb3duIGluIHRoZSByYWRlb25fcGNpX3NodXRkb3duKCkgZnVuY3Rpb24u
IEFkZGluZwpyYWRlb25fc3VzcGVuZF9rbXMoKSBmaXhlcyB0aGlzIGlzc3VlLgoKU2luY2UgcmFk
ZW9uLmggaXMgbm93IGluY2x1ZGVkIGluIHJhZGVvbl9kcnYuYyByYWRlb25faW5pdCgpIG5lZWRz
CmEgbmV3IG5hbWUuIEkgY2hvc2UgcmFkZW9uX2luaXRsKCkuIFRoaXMgY2FuIGJlIGNoYW5nZWQg
aWYgdGhlcmUgaXMKYW5vdGhlciBzdWdnZXN0aW9uIGZvciBhIG5hbWUuCgpTaWduZWQtb2ZmLWJ5
OiBLeWxlIE1haGxrdWNoIDxLeWxlLk1haGxrdWNoIGF0IGlibS5jb20+Ci0tLQogZHJpdmVycy9n
cHUvZHJtL3JhZGVvbi9yYWRlb25fZHJ2LmMgfCAxNiArKysrKysrKysrKysrKy0tCiAxIGZpbGUg
Y2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRl
b24vcmFkZW9uX2Rydi5jCmluZGV4IDJlOTZjODguLjE0MmY3ODggMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2Rydi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRl
b24vcmFkZW9uX2Rydi5jCkBAIC0zMiw2ICszMiw3IEBACiAjaW5jbHVkZSA8ZHJtL2RybVAuaD4K
ICNpbmNsdWRlIDxkcm0vcmFkZW9uX2RybS5oPgogI2luY2x1ZGUgInJhZGVvbl9kcnYuaCIKKyNp
bmNsdWRlICJyYWRlb24uaCIKIAogI2luY2x1ZGUgPGRybS9kcm1fcGNpaWRzLmg+CiAjaW5jbHVk
ZSA8bGludXgvY29uc29sZS5oPgpAQCAtMzQ0LDExICszNDUsMjIgQEAgc3RhdGljIGludCByYWRl
b25fcGNpX3Byb2JlKHN0cnVjdCBwY2lfZGV2ICpwZGV2LAogc3RhdGljIHZvaWQKIHJhZGVvbl9w
Y2lfc2h1dGRvd24oc3RydWN0IHBjaV9kZXYgKnBkZXYpCiB7CisJc3RydWN0IGRybV9kZXZpY2Ug
KmRkZXYgPSBwY2lfZ2V0X2RydmRhdGEocGRldik7CisJc3RydWN0IHJhZGVvbl9kZXZpY2UgKnJk
ZXYgPSBkZGV2LT5kZXZfcHJpdmF0ZTsKKwogCS8qIGlmIHdlIGFyZSBydW5uaW5nIGluIGEgVk0s
IG1ha2Ugc3VyZSB0aGUgZGV2aWNlCiAJICogdG9ybiBkb3duIHByb3Blcmx5IG9uIHJlYm9vdC9z
aHV0ZG93bgogCSAqLwogCWlmIChyYWRlb25fZGV2aWNlX2lzX3ZpcnR1YWwoKSkKIAkJcmFkZW9u
X3BjaV9yZW1vdmUocGRldik7CisKKwkvKiBTb21lIGFkYXB0ZXJzIG5lZWQgdG8gYmUgc3VzcGVu
ZGVkIGJlZm9yZSBhCisJICogc2h1dGRvd24gb2NjdXJzIGluIG9yZGVyIHRvIHByZXZlbnQgYW4g
ZXJyb3IKKwkgKiBkdXJpbmcga2V4ZWMuCisJICovCisJaWYgKHJkZXYtPmZhbWlseSA9PSBDSElQ
X0NBSUNPUykKKwkJcmFkZW9uX3N1c3BlbmRfa21zKGRkZXYsIHRydWUsIHRydWUsIGZhbHNlKTsK
IH0KIAogc3RhdGljIGludCByYWRlb25fcG1vcHNfc3VzcGVuZChzdHJ1Y3QgZGV2aWNlICpkZXYp
CkBAIC01ODksNyArNjAxLDcgQEAgc3RhdGljIGxvbmcgcmFkZW9uX2ttc19jb21wYXRfaW9jdGwo
c3RydWN0IGZpbGUgKmZpbHAsIHVuc2lnbmVkIGludCBjbWQsIHVuc2lnbmUKIAkuZHJpdmVyLnBt
ID0gJnJhZGVvbl9wbV9vcHMsCiB9OwogCi1zdGF0aWMgaW50IF9faW5pdCByYWRlb25faW5pdCh2
b2lkKQorc3RhdGljIGludCBfX2luaXQgcmFkZW9uX2luaXRsKHZvaWQpCiB7CiAJaWYgKHZnYWNv
bl90ZXh0X2ZvcmNlKCkgJiYgcmFkZW9uX21vZGVzZXQgPT0gLTEpIHsKIAkJRFJNX0lORk8oIlZH
QUNPTiBkaXNhYmxlIHJhZGVvbiBrZXJuZWwgbW9kZXNldHRpbmcuXG4iKTsKQEAgLTYyMSw3ICs2
MzMsNyBAQCBzdGF0aWMgdm9pZCBfX2V4aXQgcmFkZW9uX2V4aXQodm9pZCkKIAlyYWRlb25fdW5y
ZWdpc3Rlcl9hdHB4X2hhbmRsZXIoKTsKIH0KIAotbW9kdWxlX2luaXQocmFkZW9uX2luaXQpOwor
bW9kdWxlX2luaXQocmFkZW9uX2luaXRsKTsKIG1vZHVsZV9leGl0KHJhZGVvbl9leGl0KTsKIAog
TU9EVUxFX0FVVEhPUihEUklWRVJfQVVUSE9SKTsKLS0gCjEuOC4zLjEKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFt
ZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
