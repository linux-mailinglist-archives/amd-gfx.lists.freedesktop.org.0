Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AEBA3E8F4F
	for <lists+amd-gfx@lfdr.de>; Tue, 29 Oct 2019 19:30:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 616206E55E;
	Tue, 29 Oct 2019 18:30:34 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9A276E58A
 for <amd-gfx@lists.freedesktop.org>; Tue, 29 Oct 2019 18:30:33 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x9TIOKxU171398;
 Tue, 29 Oct 2019 18:30:30 GMT
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2120.oracle.com with ESMTP id 2vve3qb428-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 29 Oct 2019 18:30:30 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x9TITCXd024443;
 Tue, 29 Oct 2019 18:30:29 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3020.oracle.com with ESMTP id 2vxpenqn0f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 29 Oct 2019 18:30:29 +0000
Received: from abhmp0006.oracle.com (abhmp0006.oracle.com [141.146.116.12])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x9TIUSuU011512;
 Tue, 29 Oct 2019 18:30:28 GMT
Received: from mwanda (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 29 Oct 2019 11:30:27 -0700
Date: Tue, 29 Oct 2019 21:30:22 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Eric.Yang2@amd.com
Subject: [bug report] drm/amd/display: move wm ranges reporting to end of
 init hw
Message-ID: <20191029183022.GE17569@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9425
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=310
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1908290000 definitions=main-1910290161
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9425
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=394 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1908290000
 definitions=main-1910290161
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2019-08-05;
 bh=VyO6drzktciFjVXanLmk7EmfZAUzn7rh/ycAjJhuqmQ=;
 b=JVtX43dm14DTSI//R4QAQmrfRBF4xcmE01U3B89sduP9bIlzNldCgZFJvLY+D/yqg7Ke
 wHFLiu8hKTWhJ2HSRv8SHrR3cCq/mLr+0ZtEF8Cb2FULOH4sljXGdQWt9TPo5own2OTZ
 ZyNQI+c0cmpVua4iaa53QLiRFerXN8PV7Pmr3U1TSiNc46CxF+4Rthapip85uzBUZtgn
 EwN9Ju8fJjxM3ZQz3SAey8gJO9cesq0p8G0hxsGFQAehvAxFcK9O0hLCIKxjPWg0e9ys
 RjkFQgCjsFFycGwBwpxQrs0+mMySKZcS9QlcNAE8j+1+5nhDUQ6OuZoO+hBhg5yilDGr Dg== 
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

SGVsbG8gRXJpYyBZYW5nLAoKVGhpcyBpcyBhIHNlbWktYXV0b21hdGljIGVtYWlsIGFib3V0IG5l
dyBzdGF0aWMgY2hlY2tlciB3YXJuaW5ncy4KClRoZSBwYXRjaCA2MjJhODhjODI1OWU6ICJkcm0v
YW1kL2Rpc3BsYXk6IG1vdmUgd20gcmFuZ2VzIHJlcG9ydGluZyB0byAKZW5kIG9mIGluaXQgaHci
IGZyb20gU2VwIDI0LCAyMDE5LCBsZWFkcyB0byB0aGUgZm9sbG93aW5nIFNtYXRjaCAKY29tcGxh
aW50OgoKICAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvZGMvZGNuMTAv
ZGNuMTBfaHdfc2VxdWVuY2VyLmM6MTMwOCBkY24xMF9pbml0X2h3KCkKICAgIGVycm9yOiB3ZSBw
cmV2aW91c2x5IGFzc3VtZWQgJ2RjLT5jbGtfbWdyJyBjb3VsZCBiZSBudWxsIChzZWUgbGluZSAx
MTg4KQoKZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9kY24xMC9kY24x
MF9od19zZXF1ZW5jZXIuYwogIDExODcJCiAgMTE4OAkJaWYgKGRjLT5jbGtfbWdyICYmIGRjLT5j
bGtfbWdyLT5mdW5jcy0+aW5pdF9jbG9ja3MpCiAgICAgICAgICAgICAgICAgICAgXl5eXl5eXl5e
Xl4KVGhlIGV4aXN0aW5nIGNvZGUgYXNzdW1lZCB0aGlzIGNvdWxkIGJlIE5VTEwuICAoUHJvYmFi
bHkgd2Ugc2hvdWxkCnJlbW92ZSB0aGlzIGNoZWNrPykuCgogIDExODkJCQlkYy0+Y2xrX21nci0+
ZnVuY3MtPmluaXRfY2xvY2tzKGRjLT5jbGtfbWdyKTsKICAxMTkwCQogIDExOTEJCS8vIEluaXRp
YWxpemUgdGhlIGRjY2cKICAxMTkyCQlpZiAoZGMtPnJlc19wb29sLT5kY2NnICYmIGRjLT5yZXNf
cG9vbC0+ZGNjZy0+ZnVuY3MtPmRjY2dfaW5pdCkKICAxMTkzCQkJZGMtPnJlc19wb29sLT5kY2Nn
LT5mdW5jcy0+ZGNjZ19pbml0KHJlc19wb29sLT5kY2NnKTsKICAxMTk0CQogIDExOTUJCWlmIChJ
U19GUEdBX01BWElNVVNfREMoZGMtPmN0eC0+ZGNlX2Vudmlyb25tZW50KSkgewogIDExOTYJCiAg
MTE5NwkJCVJFR19XUklURShSRUZDTEtfQ05UTCwgMCk7CiAgMTE5OAkJCVJFR19VUERBVEUoRENI
VUJCVUJfR0xPQkFMX1RJTUVSX0NOVEwsIERDSFVCQlVCX0dMT0JBTF9USU1FUl9FTkFCTEUsIDEp
OwogIDExOTkJCQlSRUdfV1JJVEUoRElPX01FTV9QV1JfQ1RSTCwgMCk7CiAgMTIwMAkKICAxMjAx
CQkJaWYgKCFkYy0+ZGVidWcuZGlzYWJsZV9jbG9ja19nYXRlKSB7CiAgMTIwMgkJCQkvKiBlbmFi
bGUgYWxsIERDTiBjbG9jayBnYXRpbmcgKi8KICAxMjAzCQkJCVJFR19XUklURShEQ0NHX0dBVEVf
RElTQUJMRV9DTlRMLCAwKTsKICAxMjA0CQogIDEyMDUJCQkJUkVHX1dSSVRFKERDQ0dfR0FURV9E
SVNBQkxFX0NOVEwyLCAwKTsKICAxMjA2CQogIDEyMDcJCQkJUkVHX1VQREFURShEQ0ZDTEtfQ05U
TCwgRENGQ0xLX0dBVEVfRElTLCAwKTsKICAxMjA4CQkJfQogIDEyMDkJCiAgMTIxMAkJCS8vRW5h
YmxlIGFiaWxpdHkgdG8gcG93ZXIgZ2F0ZSAvIGRvbid0IGZvcmNlIHBvd2VyIG9uIHBlcm1hbmVu
dGx5CiAgMTIxMQkJCWRjLT5od3NzLmVuYWJsZV9wb3dlcl9nYXRpbmdfcGxhbmUoaHdzLCB0cnVl
KTsKICAxMjEyCQogIDEyMTMJCQlyZXR1cm47CiAgMTIxNAkJfQogIDEyMTUJCiAgMTIxNgkJaWYg
KCFkY2ItPmZ1bmNzLT5pc19hY2NlbGVyYXRlZF9tb2RlKGRjYikpCiAgMTIxNwkJCWRjLT5od3Nz
LmRpc2FibGVfdmdhKGRjLT5od3NlcSk7CiAgMTIxOAkKICAxMjE5CQlkYy0+aHdzcy5iaW9zX2dv
bGRlbl9pbml0KGRjKTsKICAxMjIwCQlpZiAoZGMtPmN0eC0+ZGNfYmlvcy0+ZndfaW5mb192YWxp
ZCkgewogIDEyMjEJCQlyZXNfcG9vbC0+cmVmX2Nsb2Nrcy54dGFsaW5fY2xvY2tfaW5LaHogPQog
IDEyMjIJCQkJCWRjLT5jdHgtPmRjX2Jpb3MtPmZ3X2luZm8ucGxsX2luZm8uY3J5c3RhbF9mcmVx
dWVuY3k7CiAgMTIyMwkKICAxMjI0CQkJaWYgKCFJU19GUEdBX01BWElNVVNfREMoZGMtPmN0eC0+
ZGNlX2Vudmlyb25tZW50KSkgewogIDEyMjUJCQkJaWYgKHJlc19wb29sLT5kY2NnICYmIHJlc19w
b29sLT5odWJidWIpIHsKICAxMjI2CQogIDEyMjcJCQkJCShyZXNfcG9vbC0+ZGNjZy0+ZnVuY3Mt
PmdldF9kY2NnX3JlZl9mcmVxKShyZXNfcG9vbC0+ZGNjZywKICAxMjI4CQkJCQkJCWRjLT5jdHgt
PmRjX2Jpb3MtPmZ3X2luZm8ucGxsX2luZm8uY3J5c3RhbF9mcmVxdWVuY3ksCiAgMTIyOQkJCQkJ
CQkmcmVzX3Bvb2wtPnJlZl9jbG9ja3MuZGNjZ19yZWZfY2xvY2tfaW5LaHopOwogIDEyMzAJCiAg
MTIzMQkJCQkJKHJlc19wb29sLT5odWJidWItPmZ1bmNzLT5nZXRfZGNodWJfcmVmX2ZyZXEpKHJl
c19wb29sLT5odWJidWIsCiAgMTIzMgkJCQkJCQlyZXNfcG9vbC0+cmVmX2Nsb2Nrcy5kY2NnX3Jl
Zl9jbG9ja19pbktoeiwKICAxMjMzCQkJCQkJCSZyZXNfcG9vbC0+cmVmX2Nsb2Nrcy5kY2h1Yl9y
ZWZfY2xvY2tfaW5LaHopOwogIDEyMzQJCQkJfSBlbHNlIHsKICAxMjM1CQkJCQkvLyBOb3QgYWxs
IEFTSUNzIGhhdmUgRENDRyBzdyBjb21wb25lbnQKICAxMjM2CQkJCQlyZXNfcG9vbC0+cmVmX2Ns
b2Nrcy5kY2NnX3JlZl9jbG9ja19pbktoeiA9CiAgMTIzNwkJCQkJCQlyZXNfcG9vbC0+cmVmX2Ns
b2Nrcy54dGFsaW5fY2xvY2tfaW5LaHo7CiAgMTIzOAkJCQkJcmVzX3Bvb2wtPnJlZl9jbG9ja3Mu
ZGNodWJfcmVmX2Nsb2NrX2luS2h6ID0KICAxMjM5CQkJCQkJCXJlc19wb29sLT5yZWZfY2xvY2tz
Lnh0YWxpbl9jbG9ja19pbktoejsKICAxMjQwCQkJCX0KICAxMjQxCQkJfQogIDEyNDIJCX0gZWxz
ZQogIDEyNDMJCQlBU1NFUlRfQ1JJVElDQUwoZmFsc2UpOwogIDEyNDQJCiAgMTI0NQkJZm9yIChp
ID0gMDsgaSA8IGRjLT5saW5rX2NvdW50OyBpKyspIHsKICAxMjQ2CQkJLyogUG93ZXIgdXAgQU5E
IHVwZGF0ZSBpbXBsZW1lbnRhdGlvbiBhY2NvcmRpbmcgdG8gdGhlCiAgMTI0NwkJCSAqIHJlcXVp
cmVkIHNpZ25hbCAod2hpY2ggbWF5IGJlIGRpZmZlcmVudCBmcm9tIHRoZQogIDEyNDgJCQkgKiBk
ZWZhdWx0IHNpZ25hbCBvbiBjb25uZWN0b3IpLgogIDEyNDkJCQkgKi8KICAxMjUwCQkJc3RydWN0
IGRjX2xpbmsgKmxpbmsgPSBkYy0+bGlua3NbaV07CiAgMTI1MQkKICAxMjUyCQkJbGluay0+bGlu
a19lbmMtPmZ1bmNzLT5od19pbml0KGxpbmstPmxpbmtfZW5jKTsKICAxMjUzCQogIDEyNTQJCQkv
KiBDaGVjayBmb3IgZW5hYmxlZCBESUcgdG8gaWRlbnRpZnkgZW5hYmxlZCBkaXNwbGF5ICovCiAg
MTI1NQkJCWlmIChsaW5rLT5saW5rX2VuYy0+ZnVuY3MtPmlzX2RpZ19lbmFibGVkICYmCiAgMTI1
NgkJCQlsaW5rLT5saW5rX2VuYy0+ZnVuY3MtPmlzX2RpZ19lbmFibGVkKGxpbmstPmxpbmtfZW5j
KSkKICAxMjU3CQkJCWxpbmstPmxpbmtfc3RhdHVzLmxpbmtfYWN0aXZlID0gdHJ1ZTsKICAxMjU4
CQl9CiAgMTI1OQkKICAxMjYwCQkvKiBQb3dlciBnYXRlIERTQ3MgKi8KICAxMjYxCSNpZmRlZiBD
T05GSUdfRFJNX0FNRF9EQ19EU0NfU1VQUE9SVAogIDEyNjIJCWZvciAoaSA9IDA7IGkgPCByZXNf
cG9vbC0+cmVzX2NhcC0+bnVtX2RzYzsgaSsrKQogIDEyNjMJCQlpZiAoZGMtPmh3c3MuZHNjX3Bn
X2NvbnRyb2wgIT0gTlVMTCkKICAxMjY0CQkJCWRjLT5od3NzLmRzY19wZ19jb250cm9sKGh3cywg
cmVzX3Bvb2wtPmRzY3NbaV0tPmluc3QsIGZhbHNlKTsKICAxMjY1CSNlbmRpZgogIDEyNjYJCiAg
MTI2NwkJLyogSWYgdGFraW5nIGNvbnRyb2wgb3ZlciBmcm9tIFZCSU9TLCB3ZSBtYXkgd2FudCB0
byBvcHRpbWl6ZSBvdXIgZmlyc3QKICAxMjY4CQkgKiBtb2RlIHNldCwgc28gd2UgbmVlZCB0byBz
a2lwIHBvd2VyaW5nIGRvd24gcGlwZXMgdW50aWwgd2Uga25vdyB3aGljaAogIDEyNjkJCSAqIHBp
cGVzIHdlIHdhbnQgdG8gdXNlLgogIDEyNzAJCSAqIE90aGVyd2lzZSwgaWYgdGFraW5nIGNvbnRy
b2wgaXMgbm90IHBvc3NpYmxlLCB3ZSBuZWVkIHRvIHBvd2VyCiAgMTI3MQkJICogZXZlcnl0aGlu
ZyBkb3duLgogIDEyNzIJCSAqLwogIDEyNzMJCWlmIChkY2ItPmZ1bmNzLT5pc19hY2NlbGVyYXRl
ZF9tb2RlKGRjYikgfHwgZGMtPmNvbmZpZy5wb3dlcl9kb3duX2Rpc3BsYXlfb25fYm9vdCkgewog
IDEyNzQJCQlkYy0+aHdzcy5pbml0X3BpcGVzKGRjLCBkYy0+Y3VycmVudF9zdGF0ZSk7CiAgMTI3
NQkJfQogIDEyNzYJCiAgMTI3NwkJZm9yIChpID0gMDsgaSA8IHJlc19wb29sLT5hdWRpb19jb3Vu
dDsgaSsrKSB7CiAgMTI3OAkJCXN0cnVjdCBhdWRpbyAqYXVkaW8gPSByZXNfcG9vbC0+YXVkaW9z
W2ldOwogIDEyNzkJCiAgMTI4MAkJCWF1ZGlvLT5mdW5jcy0+aHdfaW5pdChhdWRpbyk7CiAgMTI4
MQkJfQogIDEyODIJCiAgMTI4MwkJaWYgKGFibSAhPSBOVUxMKSB7CiAgMTI4NAkJCWFibS0+ZnVu
Y3MtPmluaXRfYmFja2xpZ2h0KGFibSk7CiAgMTI4NQkJCWFibS0+ZnVuY3MtPmFibV9pbml0KGFi
bSk7CiAgMTI4NgkJfQogIDEyODcJCiAgMTI4OAkJaWYgKGRtY3UgIT0gTlVMTCkKICAxMjg5CQkJ
ZG1jdS0+ZnVuY3MtPmRtY3VfaW5pdChkbWN1KTsKICAxMjkwCQogIDEyOTEJCWlmIChhYm0gIT0g
TlVMTCAmJiBkbWN1ICE9IE5VTEwpCiAgMTI5MgkJCWFibS0+ZG1jdV9pc19ydW5uaW5nID0gZG1j
dS0+ZnVuY3MtPmlzX2RtY3VfaW5pdGlhbGl6ZWQoZG1jdSk7CiAgMTI5MwkKICAxMjk0CQkvKiBw
b3dlciBBRk1UIEhETUkgbWVtb3J5IFRPRE86IG1heSBtb3ZlIHRvIGRpcy9lbiBvdXRwdXQgc2F2
ZSBwb3dlciovCiAgMTI5NQkJUkVHX1dSSVRFKERJT19NRU1fUFdSX0NUUkwsIDApOwogIDEyOTYJ
CiAgMTI5NwkJaWYgKCFkYy0+ZGVidWcuZGlzYWJsZV9jbG9ja19nYXRlKSB7CiAgMTI5OAkJCS8q
IGVuYWJsZSBhbGwgRENOIGNsb2NrIGdhdGluZyAqLwogIDEyOTkJCQlSRUdfV1JJVEUoRENDR19H
QVRFX0RJU0FCTEVfQ05UTCwgMCk7CiAgMTMwMAkKICAxMzAxCQkJUkVHX1dSSVRFKERDQ0dfR0FU
RV9ESVNBQkxFX0NOVEwyLCAwKTsKICAxMzAyCQogIDEzMDMJCQlSRUdfVVBEQVRFKERDRkNMS19D
TlRMLCBEQ0ZDTEtfR0FURV9ESVMsIDApOwogIDEzMDQJCX0KICAxMzA1CQogIDEzMDYJCWRjLT5o
d3NzLmVuYWJsZV9wb3dlcl9nYXRpbmdfcGxhbmUoZGMtPmh3c2VxLCB0cnVlKTsKICAxMzA3CQog
IDEzMDgJCWlmIChkYy0+Y2xrX21nci0+ZnVuY3MtPm5vdGlmeV93bV9yYW5nZXMpCiAgICAgICAg
ICAgICAgICAgICAgXl5eXl5eXl5eXl5eXgpUaGUgcGF0Y2ggYWRkcyBhIG5ldyB1bmNvbmRpdGlv
bmFsIGRlcmVmZXJlbmNlLgoKICAxMzA5CQkJZGMtPmNsa19tZ3ItPmZ1bmNzLT5ub3RpZnlfd21f
cmFuZ2VzKGRjLT5jbGtfbWdyKTsKICAxMzEwCQoKcmVnYXJkcywKZGFuIGNhcnBlbnRlcgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxp
bmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
