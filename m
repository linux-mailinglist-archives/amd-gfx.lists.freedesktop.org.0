Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5533350AA4
	for <lists+amd-gfx@lfdr.de>; Mon, 24 Jun 2019 14:26:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD05A89668;
	Mon, 24 Jun 2019 12:26:46 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37E2089668
 for <amd-gfx@lists.freedesktop.org>; Mon, 24 Jun 2019 12:26:46 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5OCO9Hg020927;
 Mon, 24 Jun 2019 12:26:41 GMT
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2120.oracle.com with ESMTP id 2t9c9pe2aw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 Jun 2019 12:26:41 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5OCQfVw040254;
 Mon, 24 Jun 2019 12:26:41 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3020.oracle.com with ESMTP id 2t9p6tj8xg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 Jun 2019 12:26:41 +0000
Received: from abhmp0013.oracle.com (abhmp0013.oracle.com [141.146.116.19])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x5OCQZ8Q003613;
 Mon, 24 Jun 2019 12:26:35 GMT
Received: from mwanda (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 24 Jun 2019 05:26:35 -0700
Date: Mon, 24 Jun 2019 15:26:30 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: kent.russell@amd.com
Subject: [bug report] drm/amdkfd: Add procfs-style information for KFD
 processes
Message-ID: <20190624122630.GA30487@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9297
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=615
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1906240102
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9297
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=654 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906240102
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2018-07-02;
 bh=ohKRDO+vtCm/Va6sCZcHGnlZX5KVO/HASEsKnZ6aCR4=;
 b=iIdrIdgT/hnkGRRr4+KILkkyyVwBK/l00LAn192Tc8DuVxbjbwpTDJp6NOWee2y19mul
 lggDm5uOl2mbFbwm7afgHtNke9rfq6CYOwiKTjk0r9oDdjhhrCR5u0hGHJbhUNFEzsqD
 pTzsfplWSgCL94jRbTdLPTxhXCzC6bADQAmIfhzDhfUpvnS7oiCDJHm4pLaRXiIe2e3i
 3e14CDJRd98aiLMDmVO2TiYjkbYwEhF4NWR9+5E9Sa8oZdo0NaJPovz6F+Yzg3AoUfmB
 5BKyGkxVk7vFRimjSq7THXcV+LYYp36Xel9BIYxINwpJ8GGCWkvu65jE5aC83FUPry0/ iA== 
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

SGVsbG8gS2VudCBSdXNzZWxsLAoKVGhlIHBhdGNoIGRlOWYyNmJiZDM4NDogImRybS9hbWRrZmQ6
IEFkZCBwcm9jZnMtc3R5bGUgaW5mb3JtYXRpb24gZm9yCktGRCBwcm9jZXNzZXMiIGZyb20gSnVu
IDEzLCAyMDE5LCBsZWFkcyB0byB0aGUgZm9sbG93aW5nIHN0YXRpYwpjaGVja2VyIHdhcm5pbmc6
CgoJZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vYW1ka2ZkL2tmZF9wcm9jZXNzLmM6Mjk3
IGtmZF9jcmVhdGVfcHJvY2VzcygpCgllcnJvcjogJ3Byb2Nlc3MnIGRlcmVmZXJlbmNpbmcgcG9z
c2libGUgRVJSX1BUUigpCgpkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9hbWRrZmQva2Zk
X3Byb2Nlc3MuYwogICAyODQgICAgICAgICAgICovCiAgIDI4NSAgICAgICAgICBtdXRleF9sb2Nr
KCZrZmRfcHJvY2Vzc2VzX211dGV4KTsKICAgMjg2ICAKICAgMjg3ICAgICAgICAgIC8qIEEgcHJp
b3Igb3BlbiBvZiAvZGV2L2tmZCBjb3VsZCBoYXZlIGFscmVhZHkgY3JlYXRlZCB0aGUgcHJvY2Vz
cy4gKi8KICAgMjg4ICAgICAgICAgIHByb2Nlc3MgPSBmaW5kX3Byb2Nlc3ModGhyZWFkKTsKICAg
Mjg5ICAgICAgICAgIGlmIChwcm9jZXNzKSB7CiAgIDI5MCAgICAgICAgICAgICAgICAgIHByX2Rl
YnVnKCJQcm9jZXNzIGFscmVhZHkgZm91bmRcbiIpOwogICAyOTEgICAgICAgICAgfSBlbHNlIHsK
ICAgMjkyICAgICAgICAgICAgICAgICAgcHJvY2VzcyA9IGNyZWF0ZV9wcm9jZXNzKHRocmVhZCwg
ZmlsZXApOwogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXl5eXl5eXl5eXl5eXl5e
Xl5eXl5eXl5eXl5eXgpUaGlzIHJldHVybnMgZXJyb3IgcG9pbnRlcnMuCgogICAyOTMgIAogICAy
OTQgICAgICAgICAgICAgICAgICBpZiAoIXByb2Nmcy5rb2JqKQogICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIF5eXl5eXl5eXl5eClRoaXMgaXMgYSBnbG9iYWwuICBDYW4gd2UgY2hlY2sgaXQg
ZWFybGllcj8KCgogICAyOTUgICAgICAgICAgICAgICAgICAgICAgICAgIGdvdG8gb3V0OwogICAy
OTYgIAogICAyOTcgICAgICAgICAgICAgICAgICBwcm9jZXNzLT5rb2JqID0ga2ZkX2FsbG9jX3N0
cnVjdChwcm9jZXNzLT5rb2JqKTsKICAgMjk4ICAgICAgICAgICAgICAgICAgaWYgKCFwcm9jZXNz
LT5rb2JqKSB7CiAgIDI5OSAgICAgICAgICAgICAgICAgICAgICAgICAgcHJfd2FybigiQ3JlYXRp
bmcgcHJvY2ZzIGtvYmplY3QgZmFpbGVkIik7CiAgIDMwMCAgICAgICAgICAgICAgICAgICAgICAg
ICAgZ290byBvdXQ7CgpXZSByZXR1cm4gc3VjY2VzcyBvbiB0aGlzIHBhdGguCgogICAzMDEgICAg
ICAgICAgICAgICAgICB9CiAgIDMwMiAgICAgICAgICAgICAgICAgIHJldCA9IGtvYmplY3RfaW5p
dF9hbmRfYWRkKHByb2Nlc3MtPmtvYmosICZwcm9jZnNfdHlwZSwKICAgMzAzICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcHJvY2ZzLmtvYmosICIlZCIsCiAgIDMw
NCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIChpbnQpcHJvY2Vz
cy0+bGVhZF90aHJlYWQtPnBpZCk7CiAgIDMwNSAgICAgICAgICAgICAgICAgIGlmIChyZXQpIHsK
ICAgMzA2ICAgICAgICAgICAgICAgICAgICAgICAgICBwcl93YXJuKCJDcmVhdGluZyBwcm9jZnMg
cGlkIGRpcmVjdG9yeSBmYWlsZWQiKTsKICAgMzA3ICAgICAgICAgICAgICAgICAgICAgICAgICBn
b3RvIG91dDsKCk5vIGVycm9yIGhhbmRsaW5nLiAgQmFzaWNhbGx5IHdoZW5ldmVyIHRoZXJlIGlz
IGEgZ290byBvdXQgdGhlIGVycm9yCmhhbmRsaW5nIGlzIHN1c3BlY3QuICBJdCdzIGJldHRlciB0
byBwaWNrIGEgbmFtZSB3aGljaCBzYXlzIHdoYXQgdGhlCmVycm9yIGxhYmVsIGRvZXMuLi4KCiAg
IDMwOCAgICAgICAgICAgICAgICAgIH0KICAgMzA5ICAKICAgMzEwICAgICAgICAgICAgICAgICAg
cHJvY2Vzcy0+YXR0cl9wYXNpZC5uYW1lID0gInBhc2lkIjsKICAgMzExICAgICAgICAgICAgICAg
ICAgcHJvY2Vzcy0+YXR0cl9wYXNpZC5tb2RlID0gS0ZEX1NZU0ZTX0ZJTEVfTU9ERTsKICAgMzEy
ICAgICAgICAgICAgICAgICAgc3lzZnNfYXR0cl9pbml0KCZwcm9jZXNzLT5hdHRyX3Bhc2lkKTsK
ICAgMzEzICAgICAgICAgICAgICAgICAgcmV0ID0gc3lzZnNfY3JlYXRlX2ZpbGUocHJvY2Vzcy0+
a29iaiwgJnByb2Nlc3MtPmF0dHJfcGFzaWQpOwogICAzMTQgICAgICAgICAgICAgICAgICBpZiAo
cmV0KQogICAzMTUgICAgICAgICAgICAgICAgICAgICAgICAgIHByX3dhcm4oIkNyZWF0aW5nIHBh
c2lkIGZvciBwaWQgJWQgZmFpbGVkIiwKICAgMzE2ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgKGludClwcm9jZXNzLT5sZWFkX3RocmVhZC0+cGlkKTsKCkVycm9yIGhh
bmRsaW5nIGFuZCBlcnJvciBjb2RlIG1pc3NpbmcuCgogICAzMTcgICAgICAgICAgfQogICAzMTgg
IG91dDoKICAgMzE5ICAgICAgICAgIG11dGV4X3VubG9jaygma2ZkX3Byb2Nlc3Nlc19tdXRleCk7
CiAgIDMyMCAgCiAgIDMyMSAgICAgICAgICByZXR1cm4gcHJvY2VzczsKICAgMzIyICB9CgoKcmVn
YXJkcywKZGFuIGNhcnBlbnRlcgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1n
Zng=
