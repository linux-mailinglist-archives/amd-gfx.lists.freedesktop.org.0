Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCCF79D039
	for <lists+amd-gfx@lfdr.de>; Mon, 26 Aug 2019 15:20:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55DCD6E0F2;
	Mon, 26 Aug 2019 13:20:32 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB10D6E0F2
 for <amd-gfx@lists.freedesktop.org>; Mon, 26 Aug 2019 13:20:30 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x7QDImEL124490;
 Mon, 26 Aug 2019 13:20:24 GMT
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2120.oracle.com with ESMTP id 2ujwvq8xje-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 26 Aug 2019 13:20:24 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x7QDHojf004907;
 Mon, 26 Aug 2019 13:20:23 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3030.oracle.com with ESMTP id 2ujw6uuqd5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 26 Aug 2019 13:20:23 +0000
Received: from abhmp0017.oracle.com (abhmp0017.oracle.com [141.146.116.23])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x7QDKMoG024152;
 Mon, 26 Aug 2019 13:20:22 GMT
Received: from mwanda (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 26 Aug 2019 06:20:21 -0700
Date: Mon, 26 Aug 2019 16:20:12 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Alex Deucher <alexander.deucher@amd.com>
Subject: [PATCH] drm/amd/powerplay: Fix an off by one in
 navi10_get_smu_msg_index()
Message-ID: <20190826132012.GB6840@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9360
 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1906280000 definitions=main-1908260145
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9360
 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
 definitions=main-1908260145
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2019-08-05;
 bh=jg8OGb+FrdnhPvXGD0oYUUIjDrZd0OA9UveLV21eQdk=;
 b=Kb4WesHD3XEj9rSET3ZPcZVa7XfRqOM4ACy0Y3HMavSmOZJK91GpQi5yHGnoroCtdm1C
 beH2YlBok+TCRBGXIAnroPkgj6Eoc+iUTmyv1ByihC2s3tuHy602d8CXDOfRuSeUsJgo
 TPGHCt1I93KNKppj7iyXaRsn3RpE+lFNa9xGysAl0hEIp8ulNrA4bl397RGWHGCq8F6n
 ldxmFpjFBxlgL55+tbltMOnzU8V1GCVb9WyWIsCYyrG54PcRWC6Wrl5qXWZmbAfkWBYk
 Vcnv05arZfK+luTelPmrwN8n7PoroMsnvxBNYrWnemDKLB8bLDJoGoF1P1Xt0A05r+F8 XA== 
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
Cc: "David \(ChunMing\) Zhou" <David1.Zhou@amd.com>,
 David Airlie <airlied@linux.ie>, Kevin Wang <kevin1.wang@amd.com>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Huang Rui <ray.huang@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, Evan Quan <evan.quan@amd.com>,
 Kenneth Feng <kenneth.feng@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhlIG5hdmkxMF9tZXNzYWdlX21hcFtdIGFycmF5IGhhcyBTTVVfTVNHX01BWF9DT1VOVCBlbGVt
ZW50cyBzbyB0aGUgIj4iCmhhcyB0byBiZSBjaGFuZ2VkIHRvICI+PSIgdG8gcHJldmVudCByZWFk
aW5nIG9uZSBlbGVtZW50IGJleW9uZCB0aGUgZW5kCm9mIHRoZSBhcnJheS4KClNpZ25lZC1vZmYt
Ynk6IERhbiBDYXJwZW50ZXIgPGRhbi5jYXJwZW50ZXJAb3JhY2xlLmNvbT4KLS0tCiBkcml2ZXJz
L2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMgfCAyICstCiAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bv
d2VycGxheS9uYXZpMTBfcHB0LmMKaW5kZXggZDdlMjVmNTExM2YxLi5mYmVjZDI1ZjE1MGYgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L25hdmkxMF9wcHQuYworKysg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMKQEAgLTIxMyw3ICsy
MTMsNyBAQCBzdGF0aWMgaW50IG5hdmkxMF9nZXRfc211X21zZ19pbmRleChzdHJ1Y3Qgc211X2Nv
bnRleHQgKnNtYywgdWludDMyX3QgaW5kZXgpCiB7CiAJc3RydWN0IHNtdV8xMV8wX2NtbjJhaXNj
X21hcHBpbmcgbWFwcGluZzsKIAotCWlmIChpbmRleCA+IFNNVV9NU0dfTUFYX0NPVU5UKQorCWlm
IChpbmRleCA+PSBTTVVfTVNHX01BWF9DT1VOVCkKIAkJcmV0dXJuIC1FSU5WQUw7CiAKIAltYXBw
aW5nID0gbmF2aTEwX21lc3NhZ2VfbWFwW2luZGV4XTsKLS0gCjIuMjAuMQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QK
YW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
