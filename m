Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA439243C
	for <lists+amd-gfx@lfdr.de>; Mon, 19 Aug 2019 15:06:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E63E8984F;
	Mon, 19 Aug 2019 13:06:12 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 600078984D
 for <amd-gfx@lists.freedesktop.org>; Mon, 19 Aug 2019 13:06:11 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x7JD4Pgu073940;
 Mon, 19 Aug 2019 13:06:07 GMT
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2120.oracle.com with ESMTP id 2uea7qf7n4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Aug 2019 13:06:07 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x7JCx6wt092924;
 Mon, 19 Aug 2019 13:04:06 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3020.oracle.com with ESMTP id 2ue8wy4fgt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Aug 2019 13:04:06 +0000
Received: from abhmp0012.oracle.com (abhmp0012.oracle.com [141.146.116.18])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x7JD44Ck003209;
 Mon, 19 Aug 2019 13:04:05 GMT
Received: from mwanda (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 19 Aug 2019 06:04:04 -0700
Date: Mon, 19 Aug 2019 16:03:58 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: kevin1.wang@amd.com
Subject: [bug report] drm/amd/powerplay: implement smc firmware v2.1 for smu11
Message-ID: <20190819130357.GA1615@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9353
 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=728
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1906280000 definitions=main-1908190148
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9353
 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=778 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
 definitions=main-1908190149
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2019-08-05;
 bh=K/1d2cMCI6k6U7s27V6MCYd3P4Z2ePS1qz2QIwsCvsg=;
 b=Am0h18RBbv584E0BR3J2PD7B8uVBOIwUbnh8C6hBpcYnvqG7d3wZSuyg9GFVJd277x0t
 MZpvEaf+VAGQbNOavDWpq9efYzod9RrD0clNPwBAsvpP6uxf8d4BYNT5MzxJFlD7DYc7
 I6AJyfceKJp+RwApn3LrPbmJPshvGwHbT7WTi2QribShsOKsQ+JTcKTLt2CCSrQtUdFb
 P6od3ATrczrAkEKwjUuVagZVsAKgq/h0aNGFHRh9ZZ973T0ZyFOD/bHPdUlhoKaQU8i+
 brdn0YE4L4jtbMWu7ELm4kIc+AYzQenyzVbY7eCSid4FgqXNtHarhRfdtmKO6SNZDaUY VQ== 
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

SGVsbG8gS2V2aW4gV2FuZywKClRoZSBwYXRjaCBiNTVjODNhNzQzOGQ6ICJkcm0vYW1kL3Bvd2Vy
cGxheTogaW1wbGVtZW50IHNtYyBmaXJtd2FyZQp2Mi4xIGZvciBzbXUxMSIgZnJvbSBKdW4gMjEs
IDIwMTksIGxlYWRzIHRvIHRoZSBmb2xsb3dpbmcgc3RhdGljCmNoZWNrZXIgd2FybmluZzoKCglk
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9wb3dlcnBsYXkvc211X3YxMV8wLmM6MzkwIHNt
dV92MTFfMF9zZXR1cF9wcHRhYmxlKCkKCXdhcm46IHBhc3NpbmcgY2FzdGVkIHBvaW50ZXIgJyZz
aXplJyB0byAnc211X2dldF9hdG9tX2RhdGFfdGFibGUoKScgMzIgdnMgMTYuCgpkcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS8uLi9wb3dlcnBsYXkvc211X3YxMV8wLmMKICAgMzU3ICBzdGF0aWMg
aW50IHNtdV92MTFfMF9zZXR1cF9wcHRhYmxlKHN0cnVjdCBzbXVfY29udGV4dCAqc211KQogICAz
NTggIHsKICAgMzU5ICAgICAgICAgIHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2ID0gc211LT5h
ZGV2OwogICAzNjAgICAgICAgICAgY29uc3Qgc3RydWN0IHNtY19maXJtd2FyZV9oZWFkZXJfdjFf
MCAqaGRyOwogICAzNjEgICAgICAgICAgaW50IHJldCwgaW5kZXg7CiAgIDM2MiAgICAgICAgICB1
aW50MzJfdCBzaXplOwogICAgICAgICAgICAgICAgXl5eXl5eXl5eXl5eXgoKICAgMzYzICAgICAg
ICAgIHVpbnQ4X3QgZnJldiwgY3JldjsKICAgMzY0ICAgICAgICAgIHZvaWQgKnRhYmxlOwogICAz
NjUgICAgICAgICAgdWludDE2X3QgdmVyc2lvbl9tYWpvciwgdmVyc2lvbl9taW5vcjsKICAgMzY2
ICAKICAgMzY3ICAgICAgICAgIGhkciA9IChjb25zdCBzdHJ1Y3Qgc21jX2Zpcm13YXJlX2hlYWRl
cl92MV8wICopIGFkZXYtPnBtLmZ3LT5kYXRhOwogICAzNjggICAgICAgICAgdmVyc2lvbl9tYWpv
ciA9IGxlMTZfdG9fY3B1KGhkci0+aGVhZGVyLmhlYWRlcl92ZXJzaW9uX21ham9yKTsKICAgMzY5
ICAgICAgICAgIHZlcnNpb25fbWlub3IgPSBsZTE2X3RvX2NwdShoZHItPmhlYWRlci5oZWFkZXJf
dmVyc2lvbl9taW5vcik7CiAgIDM3MCAgICAgICAgICBpZiAodmVyc2lvbl9tYWpvciA9PSAyICYm
IHNtdS0+c211X3RhYmxlLmJvb3RfdmFsdWVzLnBwX3RhYmxlX2lkID4gMCkgewogICAzNzEgICAg
ICAgICAgICAgICAgICBzd2l0Y2ggKHZlcnNpb25fbWlub3IpIHsKICAgMzcyICAgICAgICAgICAg
ICAgICAgY2FzZSAwOgogICAzNzMgICAgICAgICAgICAgICAgICAgICAgICAgIHJldCA9IHNtdV92
MTFfMF9zZXRfcHB0YWJsZV92Ml8wKHNtdSwgJnRhYmxlLCAmc2l6ZSk7CiAgIDM3NCAgICAgICAg
ICAgICAgICAgICAgICAgICAgYnJlYWs7CiAgIDM3NSAgICAgICAgICAgICAgICAgIGNhc2UgMToK
ICAgMzc2ICAgICAgICAgICAgICAgICAgICAgICAgICByZXQgPSBzbXVfdjExXzBfc2V0X3BwdGFi
bGVfdjJfMShzbXUsICZ0YWJsZSwgJnNpemUsCiAgIDM3NyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc211LT5zbXVfdGFibGUuYm9vdF92
YWx1ZXMucHBfdGFibGVfaWQpOwogICAzNzggICAgICAgICAgICAgICAgICAgICAgICAgIGJyZWFr
OwogICAzNzkgICAgICAgICAgICAgICAgICBkZWZhdWx0OgogICAzODAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHJldCA9IC1FSU5WQUw7CiAgIDM4MSAgICAgICAgICAgICAgICAgICAgICAgICAg
YnJlYWs7CiAgIDM4MiAgICAgICAgICAgICAgICAgIH0KICAgMzgzICAgICAgICAgICAgICAgICAg
aWYgKHJldCkKICAgMzg0ICAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gcmV0OwogICAz
ODUgIAogICAzODYgICAgICAgICAgfSBlbHNlIHsKICAgMzg3ICAgICAgICAgICAgICAgICAgaW5k
ZXggPSBnZXRfaW5kZXhfaW50b19tYXN0ZXJfdGFibGUoYXRvbV9tYXN0ZXJfbGlzdF9vZl9kYXRh
X3RhYmxlc192Ml8xLAogICAzODggICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBwb3dlcnBsYXlpbmZvKTsKICAgMzg5ICAKICAgMzkwICAgICAgICAg
ICAgICAgICAgcmV0ID0gc211X2dldF9hdG9tX2RhdGFfdGFibGUoc211LCBpbmRleCwgKHVpbnQx
Nl90ICopJnNpemUsICZmcmV2LCAmY3JldiwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXl5eXl5eXl5eXl5eXl5eXl4KVGhp
cyBvbmx5IGluaXRpYWxpemVzIHRoZSBoaWdoZXN0IDE2IGJpdHMuCgogICAzOTEgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAodWludDhfdCAqKikmdGFibGUp
OwogICAzOTIgICAgICAgICAgICAgICAgICBpZiAocmV0KQogICAzOTMgICAgICAgICAgICAgICAg
ICAgICAgICAgIHJldHVybiByZXQ7CiAgIDM5NCAgICAgICAgICB9CiAgIDM5NSAgCiAgIDM5NiAg
ICAgICAgICBpZiAoIXNtdS0+c211X3RhYmxlLnBvd2VyX3BsYXlfdGFibGUpCiAgIDM5NyAgICAg
ICAgICAgICAgICAgIHNtdS0+c211X3RhYmxlLnBvd2VyX3BsYXlfdGFibGUgPSB0YWJsZTsKICAg
Mzk4ICAgICAgICAgIGlmICghc211LT5zbXVfdGFibGUucG93ZXJfcGxheV90YWJsZV9zaXplKQog
ICAzOTkgICAgICAgICAgICAgICAgICBzbXUtPnNtdV90YWJsZS5wb3dlcl9wbGF5X3RhYmxlX3Np
emUgPSBzaXplOwogICA0MDAgIAogICA0MDEgICAgICAgICAgcmV0dXJuIDA7CgpyZWdhcmRzLApk
YW4gY2FycGVudGVyCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
