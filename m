Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A963A922BC
	for <lists+amd-gfx@lfdr.de>; Mon, 19 Aug 2019 13:51:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E31E26E069;
	Mon, 19 Aug 2019 11:51:18 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CCD96E069
 for <amd-gfx@lists.freedesktop.org>; Mon, 19 Aug 2019 11:51:17 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x7JBnPTU030407;
 Mon, 19 Aug 2019 11:51:13 GMT
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2120.oracle.com with ESMTP id 2ue9hp6wsd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Aug 2019 11:51:13 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x7JBn9v8090470;
 Mon, 19 Aug 2019 11:51:13 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3030.oracle.com with ESMTP id 2ufb46nrgj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Aug 2019 11:51:12 +0000
Received: from abhmp0001.oracle.com (abhmp0001.oracle.com [141.146.116.7])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x7JBpCwW009712;
 Mon, 19 Aug 2019 11:51:12 GMT
Received: from mwanda (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 19 Aug 2019 04:51:11 -0700
Date: Mon, 19 Aug 2019 14:51:06 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: charlene.liu@amd.com
Subject: [bug report] drm/amd/display: add set and get clock for testing
 purposes
Message-ID: <20190819115106.GA24792@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9353
 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=860
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1906280000 definitions=main-1908190136
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9353
 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=927 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
 definitions=main-1908190136
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2019-08-05;
 bh=uOgJY77VSyPK7FuP/RbPdg+4HBM7B7GbsfuUvwPIf+M=;
 b=iKhzEtv6QprurG+Qz/OpIiwG19Gsd52EWLf0cxLQPzPvy0ZljeTbsTmuedj83Yp3GPb0
 WK9RrxIdNbfAqi/akdK2NO8El3ogs3ZyTIpxjsOLQ88kukAfY0T0H5KGmfo3aMx5QTZI
 uXPXeDPT/X1SD/MkPW+lTxEoCY6KkawDEydZpHUzdLWmi8sH92gGlFfDkewCnUauf00l
 cGHWM3pF9zTcB8Qd570SyTNhbTLbWqFREH2WjGFVe7V1XWjqinUl/YI/Sh4y0yLvcvL1
 AbfcSID3V+8/Vuny5PqEvatJsc7BMmWLV8DCVuMqV/GGKrIvrdxUQ4ifjkfPDMu70uuH Eg== 
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
Cc: amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SGVsbG8gQ2hhcmxlbmUgTGl1LAoKVGhpcyBpcyBhIHNlbWktYXV0b21hdGljIGVtYWlsIGFib3V0
IG5ldyBzdGF0aWMgY2hlY2tlciB3YXJuaW5ncy4KClRoZSBwYXRjaCA5MjVmNTY2Y2I3YWU6ICJk
cm0vYW1kL2Rpc3BsYXk6IGFkZCBzZXQgYW5kIGdldCBjbG9jayBmb3IKdGVzdGluZyBwdXJwb3Nl
cyIgZnJvbSBKdW4gMjcsIDIwMTksIGxlYWRzIHRvIHRoZSBmb2xsb3dpbmcgU21hdGNoCmNvbXBs
YWludDoKCiAgICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9kaXNwbGF5L2RjL2RjbjEw
L2RjbjEwX2h3X3NlcXVlbmNlci5jOjMyMzAgZGNuMTBfc2V0X2Nsb2NrKCkKICAgIGVycm9yOiB3
ZSBwcmV2aW91c2x5IGFzc3VtZWQgJ2RjLT5jbGtfbWdyJyBjb3VsZCBiZSBudWxsIChzZWUgbGlu
ZSAzMjI2KQoKZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9kY24xMC9k
Y24xMF9od19zZXF1ZW5jZXIuYwogIDMyMjUJCiAgMzIyNgkJaWYgKGRjLT5jbGtfbWdyICYmIGRj
LT5jbGtfbWdyLT5mdW5jcy0+Z2V0X2Nsb2NrKQogICAgICAgICAgICAgICAgICAgIF5eXl5eXl5e
Xl4KQ2hlY2sgZm9yIE5VTEwKCiAgMzIyNwkJCQkJZGMtPmNsa19tZ3ItPmZ1bmNzLT5nZXRfY2xv
Y2soZGMtPmNsa19tZ3IsCiAgMzIyOAkJCQkJCQljb250ZXh0LCBjbG9ja190eXBlLCAmY2xvY2tf
Y2ZnKTsKClRoaXMgaXMgaW5kZW50ZWQgYSBiaXQgdG9vIGZhci4KCiAgMzIyOQkKICAzMjMwCQlp
ZiAoIWRjLT5jbGtfbWdyLT5mdW5jcy0+Z2V0X2Nsb2NrKQogICAgICAgICAgICAgICAgICAgICBe
Xl5eXl5eXl5eXl5eClRoaXMgd2lsbCBvb3BzIGlmIC0+Y2xrX21nciBpcyBOVUxMCgogIDMyMzEJ
CQlyZXR1cm4gRENfRkFJTF9VTlNVUFBPUlRFRF8xOwogIDMyMzIJCgpyZWdhcmRzLApkYW4gY2Fy
cGVudGVyCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFt
ZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
