Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 164D5B69D6
	for <lists+amd-gfx@lfdr.de>; Wed, 18 Sep 2019 19:48:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86EE76F5EF;
	Wed, 18 Sep 2019 17:48:23 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7EA46F406;
 Wed, 18 Sep 2019 16:30:59 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x8IGNamU178592;
 Wed, 18 Sep 2019 16:30:53 GMT
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2120.oracle.com with ESMTP id 2v385e53qu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 18 Sep 2019 16:30:53 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x8IGMr64173715;
 Wed, 18 Sep 2019 16:30:52 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3020.oracle.com with ESMTP id 2v37mmwng8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 18 Sep 2019 16:30:52 +0000
Received: from abhmp0007.oracle.com (abhmp0007.oracle.com [141.146.116.13])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x8IGUkb2029057;
 Wed, 18 Sep 2019 16:30:47 GMT
Received: from x250.idc.oracle.com (/10.191.241.104)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 18 Sep 2019 09:30:45 -0700
From: Allen Pais <allen.pais@oracle.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/amdkfd: fix a potential NULL pointer dereference
Date: Wed, 18 Sep 2019 22:00:31 +0530
Message-Id: <1568824231-4007-1-git-send-email-allen.pais@oracle.com>
X-Mailer: git-send-email 1.9.1
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9384
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=3
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=899
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1908290000 definitions=main-1909180156
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9384
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=3 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=983 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1908290000
 definitions=main-1909180156
X-Mailman-Approved-At: Wed, 18 Sep 2019 17:48:23 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.com; h=from : to : cc :
 subject : date : message-id; s=corp-2019-08-05;
 bh=TgunZWBu9b1BmO6HitEFm1hFDnIkgPngmteT+Ahcq04=;
 b=dUmAIMPgBJ+Xkoa8RFOcS0medzQ6GpZKULtyguw8tJVvVctGRhH2GGT1oNNGCt8z88nq
 9HTPPdKJWtYjazcdipL9h+0y1LvUJK4p2cObiccwCfeE4PPVgqVxdAuLC7LsSHPU4GmA
 3+wMBjGiH0AK+tE8jy6PPbiz8j30xCgMq1ZcqoKTjYtPDwgLBxsDEaPaP9QLnIx4N12x
 yxUHoc0b2STtuXTL/P3MeRbtJ0bWAi56veY63rqhQW5U812WW70ODnI33guG5QzWbazK
 pgEZyCZDLfb9F4CeQqXElAv2FFUGC+wMV/L3YfJjK50gSYVjRNxhubv+/KhH4caRSwxj 0A== 
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
Cc: airlied@linux.ie, daniel@ffwll.ch, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

YWxsb2Nfd29ya3F1ZXVlIGlzIG5vdCBjaGVja2VkIGZvciBlcnJvcnMgYW5kIGFzIGEgcmVzdWx0
LAphIHBvdGVudGlhbCBOVUxMIGRlcmVmZXJlbmNlIGNvdWxkIG9jY3VyLgoKU2lnbmVkLW9mZi1i
eTogQWxsZW4gUGFpcyA8YWxsZW4ucGFpc0BvcmFjbGUuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1ka2ZkL2tmZF9pbnRlcnJ1cHQuYyB8IDUgKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA1
IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9r
ZmRfaW50ZXJydXB0LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfaW50ZXJydXB0
LmMKaW5kZXggYzU2YWM0Ny4uY2FhODJhOCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRrZmQva2ZkX2ludGVycnVwdC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2Zk
L2tmZF9pbnRlcnJ1cHQuYwpAQCAtNjIsNiArNjIsMTEgQEAgaW50IGtmZF9pbnRlcnJ1cHRfaW5p
dChzdHJ1Y3Qga2ZkX2RldiAqa2ZkKQogCX0KIAogCWtmZC0+aWhfd3EgPSBhbGxvY193b3JrcXVl
dWUoIktGRCBJSCIsIFdRX0hJR0hQUkksIDEpOworCWlmICh1bmxpa2VseSgha2ZkLT5paF93cSkp
IHsKKwkJZmlmb19mcmVlKCZrZmQtPmloX2ZpZm8pOworCQlkZXZfZXJyKGtmZF9jaGFyZGV2KCks
ICJGYWlsZWQgdG8gYWxsb2NhdGUgS0ZEIElIIHdvcmtxdWV1ZVxuIik7CisJCXJldHVybiBrZmQt
PmloX3dxOworCX0KIAlzcGluX2xvY2tfaW5pdCgma2ZkLT5pbnRlcnJ1cHRfbG9jayk7CiAKIAlJ
TklUX1dPUksoJmtmZC0+aW50ZXJydXB0X3dvcmssIGludGVycnVwdF93cSk7Ci0tIAoxLjkuMQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
