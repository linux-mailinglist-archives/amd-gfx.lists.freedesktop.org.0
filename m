Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC19C87A6
	for <lists+amd-gfx@lfdr.de>; Wed,  2 Oct 2019 13:58:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79F866E95D;
	Wed,  2 Oct 2019 11:58:31 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80AEB6E95C
 for <amd-gfx@lists.freedesktop.org>; Wed,  2 Oct 2019 11:58:29 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x92Bs5xl111460;
 Wed, 2 Oct 2019 11:58:22 GMT
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2120.oracle.com with ESMTP id 2v9yfqce0a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 02 Oct 2019 11:58:22 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x92Bw2rA076713;
 Wed, 2 Oct 2019 11:58:21 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3020.oracle.com with ESMTP id 2vckyntn23-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 02 Oct 2019 11:58:21 +0000
Received: from abhmp0004.oracle.com (abhmp0004.oracle.com [141.146.116.10])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x92BwJSN019633;
 Wed, 2 Oct 2019 11:58:20 GMT
Received: from mwanda (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 02 Oct 2019 04:58:19 -0700
Date: Wed, 2 Oct 2019 14:58:14 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Anthony.Koo@amd.com
Subject: [bug report] drm/amd/display: Fix exception from AUX acquire failure
Message-ID: <20191002115814.GA10545@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9397
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=985
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1908290000 definitions=main-1910020115
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9397
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1908290000
 definitions=main-1910020114
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2019-08-05;
 bh=A5hzmtrueczPCTGFQ3qgq5peaJe35tLp4W7RtjaDeU0=;
 b=j2+aTZY40wc+GKf/41hUu2JsyTtqvpmLrCh8y6jqi0vrcq+Yb0xkgYwMypsUOkKExlIE
 Lncp0kBffwDNUhboHSchbODCzsjIAiL5JYgaoD86rakLAq59uy/RnzpTSF647/Im69+S
 asD/BwIMxhncpI+okVF2jnWuOVl0veBr6hf8HYJahZbMFFETD0OqgbDmq13j7OBbmdqt
 XQ3ZEVKgMZSBRtRWCJqBVOmAwMEZ7WwbxzDYr5t4ZpzNw0If9cA73Z5kUpwg2IpEZeB1
 rCIpVvl00ybPkA3l+3GPUwE8dKquKP6XLM6feAa6rtS8gBNWmKWwQusg9nJeW/KyIUm/ Iw== 
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

SGVsbG8gQW50aG9ueSBLb28sCgpUaGUgcGF0Y2ggZGNmMWE5ODg2NzhlOiAiZHJtL2FtZC9kaXNw
bGF5OiBGaXggZXhjZXB0aW9uIGZyb20gQVVYCmFjcXVpcmUgZmFpbHVyZSIgZnJvbSBGZWIgNiwg
MjAxOSwgbGVhZHMgdG8gdGhlIGZvbGxvd2luZyBzdGF0aWMKY2hlY2tlciB3YXJuaW5nOgoKCWRy
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9t
c3RfdHlwZXMuYzoxMDggZG1fZHBfYXV4X3RyYW5zZmVyKCkKCWVycm9yOiB1bmluaXRpYWxpemVk
IHN5bWJvbCAnb3BlcmF0aW9uX3Jlc3VsdCcuCgpkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8u
Li9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1fbXN0X3R5cGVzLmMKICAgIDgyICBzdGF0aWMg
c3NpemVfdCBkbV9kcF9hdXhfdHJhbnNmZXIoc3RydWN0IGRybV9kcF9hdXggKmF1eCwKICAgIDgz
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGRybV9kcF9hdXhfbXNn
ICptc2cpCiAgICA4NCAgewogICAgODUgICAgICAgICAgc3NpemVfdCByZXN1bHQgPSAwOwogICAg
ODYgICAgICAgICAgc3RydWN0IGF1eF9wYXlsb2FkIHBheWxvYWQ7CiAgICA4NyAgICAgICAgICBl
bnVtIGF1eF9jaGFubmVsX29wZXJhdGlvbl9yZXN1bHQgb3BlcmF0aW9uX3Jlc3VsdDsKICAgIDg4
ICAKICAgIDg5ICAgICAgICAgIGlmIChXQVJOX09OKG1zZy0+c2l6ZSA+IDE2KSkKICAgIDkwICAg
ICAgICAgICAgICAgICAgcmV0dXJuIC1FMkJJRzsKICAgIDkxICAKICAgIDkyICAgICAgICAgIHBh
eWxvYWQuYWRkcmVzcyA9IG1zZy0+YWRkcmVzczsKICAgIDkzICAgICAgICAgIHBheWxvYWQuZGF0
YSA9IG1zZy0+YnVmZmVyOwogICAgOTQgICAgICAgICAgcGF5bG9hZC5sZW5ndGggPSBtc2ctPnNp
emU7CiAgICA5NSAgICAgICAgICBwYXlsb2FkLnJlcGx5ID0gJm1zZy0+cmVwbHk7CiAgICA5NiAg
ICAgICAgICBwYXlsb2FkLmkyY19vdmVyX2F1eCA9IChtc2ctPnJlcXVlc3QgJiBEUF9BVVhfTkFU
SVZFX1dSSVRFKSA9PSAwOwogICAgOTcgICAgICAgICAgcGF5bG9hZC53cml0ZSA9IChtc2ctPnJl
cXVlc3QgJiBEUF9BVVhfSTJDX1JFQUQpID09IDA7CiAgICA5OCAgICAgICAgICBwYXlsb2FkLm1v
dCA9IChtc2ctPnJlcXVlc3QgJiBEUF9BVVhfSTJDX01PVCkgIT0gMDsKICAgIDk5ICAgICAgICAg
IHBheWxvYWQuZGVmZXJfZGVsYXkgPSAwOwogICAxMDAgIAogICAxMDEgICAgICAgICAgcmVzdWx0
ID0gZGNfbGlua19hdXhfdHJhbnNmZXJfcmF3KFRPX0RNX0FVWChhdXgpLT5kZGNfc2VydmljZSwg
JnBheWxvYWQsCiAgIDEwMiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAm
b3BlcmF0aW9uX3Jlc3VsdCk7CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBeXl5eXl5eXl5eXl5eXl5eXgpUaGUgcGF0Y2ggYWRkcyBhIG5ldyByZXR1cm4gd2hl
cmUgIm9wZXJhdGlvbl9yZXN1bHQiIGlzbid0IGluaXRpYWxpemVkLgoKICAgMTAzICAKICAgMTA0
ICAgICAgICAgIGlmIChwYXlsb2FkLndyaXRlKQogICAxMDUgICAgICAgICAgICAgICAgICByZXN1
bHQgPSBtc2ctPnNpemU7CiAgIDEwNiAgCiAgIDEwNyAgICAgICAgICBpZiAocmVzdWx0IDwgMCkK
ICAgMTA4ICAgICAgICAgICAgICAgICAgc3dpdGNoIChvcGVyYXRpb25fcmVzdWx0KSB7CiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgXl5eXl5eXl5eXl5eXl5eXgoKICAgMTA5ICAgICAg
ICAgICAgICAgICAgY2FzZSBBVVhfQ0hBTk5FTF9PUEVSQVRJT05fU1VDQ0VFREVEOgogICAxMTAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGJyZWFrOwogICAxMTEgICAgICAgICAgICAgICAgICBj
YXNlIEFVWF9DSEFOTkVMX09QRVJBVElPTl9GQUlMRURfSFBEX0RJU0NPTjoKICAgMTEyICAgICAg
ICAgICAgICAgICAgY2FzZSBBVVhfQ0hBTk5FTF9PUEVSQVRJT05fRkFJTEVEX1JFQVNPTl9VTktO
T1dOOgogICAxMTMgICAgICAgICAgICAgICAgICAgICAgICAgIHJlc3VsdCA9IC1FSU87CiAgIDEx
NCAgICAgICAgICAgICAgICAgICAgICAgICAgYnJlYWs7CiAgIDExNSAgICAgICAgICAgICAgICAg
IGNhc2UgQVVYX0NIQU5ORUxfT1BFUkFUSU9OX0ZBSUxFRF9JTlZBTElEX1JFUExZOgogICAxMTYg
ICAgICAgICAgICAgICAgICAgICAgICAgIHJlc3VsdCA9IC1FQlVTWTsKICAgMTE3ICAgICAgICAg
ICAgICAgICAgICAgICAgICBicmVhazsKICAgMTE4ICAgICAgICAgICAgICAgICAgY2FzZSBBVVhf
Q0hBTk5FTF9PUEVSQVRJT05fRkFJTEVEX1RJTUVPVVQ6CiAgIDExOSAgICAgICAgICAgICAgICAg
ICAgICAgICAgcmVzdWx0ID0gLUVUSU1FRE9VVDsKICAgMTIwICAgICAgICAgICAgICAgICAgICAg
ICAgICBicmVhazsKICAgMTIxICAgICAgICAgICAgICAgICAgfQogICAxMjIgIAogICAxMjMgICAg
ICAgICAgcmV0dXJuIHJlc3VsdDsKICAgMTI0ICB9CgpyZWdhcmRzLApkYW4gY2FycGVudGVyCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFp
bGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
