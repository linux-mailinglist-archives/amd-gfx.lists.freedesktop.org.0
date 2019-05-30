Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DFB5B302BE
	for <lists+amd-gfx@lfdr.de>; Thu, 30 May 2019 21:25:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38BF68984E;
	Thu, 30 May 2019 19:25:32 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from aserp2130.oracle.com (aserp2130.oracle.com [141.146.126.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EDF989208
 for <amd-gfx@lists.freedesktop.org>; Thu, 30 May 2019 19:25:31 +0000 (UTC)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x4UJO1c5055829;
 Thu, 30 May 2019 19:25:28 GMT
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2130.oracle.com with ESMTP id 2spu7dtg06-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 30 May 2019 19:25:28 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x4UJPPnj086458;
 Thu, 30 May 2019 19:25:27 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3030.oracle.com with ESMTP id 2ss1fp907v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 30 May 2019 19:25:27 +0000
Received: from abhmp0002.oracle.com (abhmp0002.oracle.com [141.146.116.8])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x4UJPPkY025935;
 Thu, 30 May 2019 19:25:26 GMT
Received: from mwanda (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 30 May 2019 12:25:25 -0700
Date: Thu, 30 May 2019 22:25:19 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Chris.Park@amd.com
Subject: [bug report] drm/amd/display: Move link functions from dc to dc_link
Message-ID: <20190530192519.GA6076@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9273
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=926
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1905300136
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9273
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=958 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1905300136
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2018-07-02;
 bh=NpDWBT79mN4aInmzP+aLvc082KlpNP0033eqfkHA+MA=;
 b=roclTI5uWACfFHZiA9wiCUpc+rZrgu+rv4N2NJmMq8Sf9U6freOFP08ReTHZ5c2haMCS
 W0FGDRIzP+oBj3P+3mv69lvkGFAbJtGHNy13WeOY+wf6u3UPPp2XHLF8Ya2XhZSFLW7R
 jdyi06zY8uH1iTTGVmnGLngr+s3dz7mFl/486AsXdOkmDwfxZAhGI2g4jH1MqqvWAs3e
 njf+cCuriSCMN3Qd65m6bBz3hu5prjcRPiRihd6aKJx9g3A6EG4wZ+2zj9g3V1dbYw6k
 UCJ0f9MXjL2XwlQJc5KuJUDQLdPBbWbgM8Opxd8/f6ujlZ9bvr6P0IXveNIG6A2n+61b fQ== 
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

SGVsbG8gQ2hyaXMgUGFyaywKClRoaXMgaXMgYSBzZW1pLWF1dG9tYXRpYyBlbWFpbCBhYm91dCBu
ZXcgc3RhdGljIGNoZWNrZXIgd2FybmluZ3MuCgpUaGUgcGF0Y2ggZjU2OTJmNjlmNjczOiAiZHJt
L2FtZC9kaXNwbGF5OiBNb3ZlIGxpbmsgZnVuY3Rpb25zIGZyb20gZGMgCnRvIGRjX2xpbmsiIGZy
b20gTWF5IDEwLCAyMDE5LCBsZWFkcyB0byB0aGUgZm9sbG93aW5nIFNtYXRjaCAKY29tcGxhaW50
OgoKICAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvZGMvY29yZS9kY19s
aW5rLmM6MjkyOSBkY19saW5rX3NldF9wcmVmZXJyZWRfbGlua19zZXR0aW5ncygpCiAgICB3YXJu
OiB2YXJpYWJsZSBkZXJlZmVyZW5jZWQgYmVmb3JlIGNoZWNrICdsaW5rX3N0cmVhbScgKHNlZSBs
aW5lIDI5MjYpCgpkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9kaXNwbGF5L2RjL2NvcmUv
ZGNfbGluay5jCiAgMjkxMSAgICAgICAgICBmb3IgKGkgPSAwOyBpIDwgTUFYX1BJUEVTOyBpKysp
IHsKICAyOTEyICAgICAgICAgICAgICAgICAgcGlwZSA9ICZkYy0+Y3VycmVudF9zdGF0ZS0+cmVz
X2N0eC5waXBlX2N0eFtpXTsKICAyOTEzICAgICAgICAgICAgICAgICAgaWYgKHBpcGUtPnN0cmVh
bSAmJiBwaXBlLT5zdHJlYW0tPmxpbmspIHsKICAyOTE0ICAgICAgICAgICAgICAgICAgICAgICAg
ICBpZiAocGlwZS0+c3RyZWFtLT5saW5rID09IGxpbmspCiAgMjkxNSAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBicmVhazsKICAyOTE2ICAgICAgICAgICAgICAgICAgfQogIDI5MTcg
ICAgICAgICAgfQogIDI5MTggIAogIDI5MTkgICAgICAgICAgLyogU3RyZWFtIG5vdCBmb3VuZCAq
LwogIDI5MjAgICAgICAgICAgaWYgKGkgPT0gTUFYX1BJUEVTKQogIDI5MjEgICAgICAgICAgICAg
ICAgICByZXR1cm47CiAgMjkyMiAgCiAgMjkyMyAgICAgICAgICBsaW5rX3N0cmVhbSA9IGxpbmst
PmRjLT5jdXJyZW50X3N0YXRlLT5yZXNfY3R4LnBpcGVfY3R4W2ldLnN0cmVhbTsKICAyOTI0ICAK
ICAyOTI1CQkvKiBDYW5ub3QgcmV0cmFpbiBsaW5rIGlmIGJhY2tlbmQgaXMgb2ZmICovCiAgMjky
NgkJaWYgKGxpbmtfc3RyZWFtLT5kcG1zX29mZikKICAgICAgICAgICAgICAgICAgICBeXl5eXl5e
Xl5eXl5eXl5eXl5eXl4KQ2FuIGxpbmtfc3RyZWFtIGJlIE5VTEw/CgogIDI5MjcJCQlyZXR1cm47
CiAgMjkyOAkKICAyOTI5CQlpZiAobGlua19zdHJlYW0pCiAgICAgICAgICAgICAgICAgICAgXl5e
Xl5eXl5eXl4KV2UgY2hlY2sgaGVyZSBzbyBtYXliZT8KCiAgMjkzMAkJCWRlY2lkZV9saW5rX3Nl
dHRpbmdzKGxpbmtfc3RyZWFtLCAmc3RvcmVfc2V0dGluZ3MpOwogIDI5MzEJCgpyZWdhcmRzLApk
YW4gY2FycGVudGVyCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
