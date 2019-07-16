Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA756AE4E
	for <lists+amd-gfx@lfdr.de>; Tue, 16 Jul 2019 20:15:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF4E389D53;
	Tue, 16 Jul 2019 18:15:12 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C3ED6E165
 for <amd-gfx@lists.freedesktop.org>; Tue, 16 Jul 2019 18:11:28 +0000 (UTC)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6GIBRWu108180
 for <amd-gfx@lists.freedesktop.org>; Tue, 16 Jul 2019 14:11:27 -0400
Received: from e31.co.us.ibm.com (e31.co.us.ibm.com [32.97.110.149])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2tsj86byss-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <amd-gfx@lists.freedesktop.org>; Tue, 16 Jul 2019 14:11:27 -0400
Received: from localhost
 by e31.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <amd-gfx@lists.freedesktop.org> from <kmahlkuc@linux.vnet.ibm.com>;
 Tue, 16 Jul 2019 19:11:20 +0100
Received: from b03cxnp08027.gho.boulder.ibm.com (9.17.130.19)
 by e31.co.us.ibm.com (192.168.1.131) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 16 Jul 2019 19:11:17 +0100
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x6GIBGmA52494678
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 16 Jul 2019 18:11:16 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 337666E054;
 Tue, 16 Jul 2019 18:11:16 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CBF1F6E064;
 Tue, 16 Jul 2019 18:11:15 +0000 (GMT)
Received: from oc6220003374.ibm.com (unknown [9.40.45.99])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Tue, 16 Jul 2019 18:11:15 +0000 (GMT)
From: KyleMahlkuch <kmahlkuc@linux.vnet.ibm.com>
To: 
Subject: [PATCH] drm/radeon: Fix EEH during kexec
Date: Tue, 16 Jul 2019 13:10:02 -0500
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
x-cbid: 19071618-8235-0000-0000-00000EB70A7E
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011440; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01233098; UDB=6.00649713; IPR=6.01014409; 
 MB=3.00027747; MTD=3.00000008; XFM=3.00000015; UTC=2019-07-16 18:11:19
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19071618-8236-0000-0000-0000466A69BE
Message-Id: <1563300606-28434-1-git-send-email-kmahlkuc@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-16_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=731 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907160223
X-Mailman-Approved-At: Tue, 16 Jul 2019 18:15:11 +0000
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
IEFkZGluZwpyYWRlb25fc3VzcGVuZF9rbXMoKSBmaXhlcyB0aGlzIGlzc3VlLgoKU2luY2UgcmFk
ZW9uLmggaXMgbm93IGluY2x1ZGVkIGluIHJhZGVvbl9kcnYuYyByYWRlb25faW5pdCgpIG5lZWRz
CmEgbmV3IG5hbWUuIEkgY2hvc2UgcmFkZW9uX2luaXRsKCkuIFRoaXMgY2FuIGJlIGNoYW5nZWQg
aWYgdGhlcmUgaXMKYW5vdGhlciBzdWdnZXN0aW9uIGZvciBhIG5hbWUuCgpTaWduZWQtb2ZmLWJ5
OiBLeWxlIE1haGxrdWNoIDxLeWxlLk1haGxrdWNoIGF0IGlibS5jb20+Ci0tLQogZHJpdmVycy9n
cHUvZHJtL3JhZGVvbi9yYWRlb25fZHJ2LmMgfCAxNSArKysrKysrKysrKysrLS0KIDEgZmlsZSBj
aGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVv
bi9yYWRlb25fZHJ2LmMKaW5kZXggMmU5NmM4OC4uNTUwZjliMCAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fZHJ2LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVv
bi9yYWRlb25fZHJ2LmMKQEAgLTMyLDYgKzMyLDcgQEAKICNpbmNsdWRlIDxkcm0vZHJtUC5oPgog
I2luY2x1ZGUgPGRybS9yYWRlb25fZHJtLmg+CiAjaW5jbHVkZSAicmFkZW9uX2Rydi5oIgorI2lu
Y2x1ZGUgInJhZGVvbi5oIgogCiAjaW5jbHVkZSA8ZHJtL2RybV9wY2lpZHMuaD4KICNpbmNsdWRl
IDxsaW51eC9jb25zb2xlLmg+CkBAIC0zNDQsMTEgKzM0NSwyMSBAQCBzdGF0aWMgaW50IHJhZGVv
bl9wY2lfcHJvYmUoc3RydWN0IHBjaV9kZXYgKnBkZXYsCiBzdGF0aWMgdm9pZAogcmFkZW9uX3Bj
aV9zaHV0ZG93bihzdHJ1Y3QgcGNpX2RldiAqcGRldikKIHsKKwlzdHJ1Y3QgZHJtX2RldmljZSAq
ZGRldiA9IHBjaV9nZXRfZHJ2ZGF0YShwZGV2KTsKKwlzdHJ1Y3QgcmFkZW9uX2RldmljZSAqcmRl
diA9IGRkZXYtPmRldl9wcml2YXRlOworCiAJLyogaWYgd2UgYXJlIHJ1bm5pbmcgaW4gYSBWTSwg
bWFrZSBzdXJlIHRoZSBkZXZpY2UKIAkgKiB0b3JuIGRvd24gcHJvcGVybHkgb24gcmVib290L3No
dXRkb3duCiAJICovCiAJaWYgKHJhZGVvbl9kZXZpY2VfaXNfdmlydHVhbCgpKQogCQlyYWRlb25f
cGNpX3JlbW92ZShwZGV2KTsKKworCS8qIFNvbWUgYWRhcHRlcnMgbmVlZCB0byBiZSBzdXNwZW5k
ZWQgYmVmb3JlIGEKKwkqIHNodXRkb3duIG9jY3VycyBpbiBvcmRlciB0byBwcmV2ZW50IGFuIGVy
cm9yCisJKiBkdXJpbmcga2V4ZWMuCisJKi8KKwlpZiAocmRldi0+ZmFtaWx5ID09IENISVBfQ0FJ
Q09TKQorCQlyYWRlb25fc3VzcGVuZF9rbXMoZGRldiwgdHJ1ZSwgdHJ1ZSwgZmFsc2UpOwogfQog
CiBzdGF0aWMgaW50IHJhZGVvbl9wbW9wc19zdXNwZW5kKHN0cnVjdCBkZXZpY2UgKmRldikKQEAg
LTU4OSw3ICs2MDAsNyBAQCBzdGF0aWMgbG9uZyByYWRlb25fa21zX2NvbXBhdF9pb2N0bChzdHJ1
Y3QgZmlsZSAqZmlscCwgdW5zaWduZWQgaW50IGNtZCwgdW5zaWduZQogCS5kcml2ZXIucG0gPSAm
cmFkZW9uX3BtX29wcywKIH07CiAKLXN0YXRpYyBpbnQgX19pbml0IHJhZGVvbl9pbml0KHZvaWQp
CitzdGF0aWMgaW50IF9faW5pdCByYWRlb25faW5pdGwodm9pZCkKIHsKIAlpZiAodmdhY29uX3Rl
eHRfZm9yY2UoKSAmJiByYWRlb25fbW9kZXNldCA9PSAtMSkgewogCQlEUk1fSU5GTygiVkdBQ09O
IGRpc2FibGUgcmFkZW9uIGtlcm5lbCBtb2Rlc2V0dGluZy5cbiIpOwpAQCAtNjIxLDcgKzYzMiw3
IEBAIHN0YXRpYyB2b2lkIF9fZXhpdCByYWRlb25fZXhpdCh2b2lkKQogCXJhZGVvbl91bnJlZ2lz
dGVyX2F0cHhfaGFuZGxlcigpOwogfQogCi1tb2R1bGVfaW5pdChyYWRlb25faW5pdCk7Cittb2R1
bGVfaW5pdChyYWRlb25faW5pdGwpOwogbW9kdWxlX2V4aXQocmFkZW9uX2V4aXQpOwogCiBNT0RV
TEVfQVVUSE9SKERSSVZFUl9BVVRIT1IpOwotLSAKMS44LjMuMQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdm
eEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9hbWQtZ2Z4
