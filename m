Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 78E7752023
	for <lists+amd-gfx@lfdr.de>; Tue, 25 Jun 2019 02:49:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2069489E47;
	Tue, 25 Jun 2019 00:49:49 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B647189E47
 for <amd-gfx@lists.freedesktop.org>; Tue, 25 Jun 2019 00:49:47 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5P0iHv6102655;
 Tue, 25 Jun 2019 00:49:44 GMT
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2120.oracle.com with ESMTP id 2t9cyq9451-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 25 Jun 2019 00:49:44 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5P0nNRZ098918;
 Tue, 25 Jun 2019 00:49:44 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3020.oracle.com with ESMTP id 2tat7bxatv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 25 Jun 2019 00:49:44 +0000
Received: from abhmp0014.oracle.com (abhmp0014.oracle.com [141.146.116.20])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x5P0nhNK005758;
 Tue, 25 Jun 2019 00:49:43 GMT
Received: from kadam (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 24 Jun 2019 17:49:42 -0700
Date: Tue, 25 Jun 2019 03:49:35 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: "Russell, Kent" <Kent.Russell@amd.com>
Subject: Re: [bug report] drm/amdkfd: Add procfs-style information for KFD
 processes
Message-ID: <20190625004935.GU18776@kadam>
References: <20190624122630.GA30487@mwanda>
 <BN6PR12MB16181F76E1F385E999A2219585E00@BN6PR12MB1618.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <BN6PR12MB16181F76E1F385E999A2219585E00@BN6PR12MB1618.namprd12.prod.outlook.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9298
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1906250004
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9298
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906250004
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2018-07-02;
 bh=LD4pIwiSAH6VlumMX5GBn3WXRQYzAlsURVf9zv2ZZkY=;
 b=oeHqFP1ZjObjoOMpevch6EyFbzo3JDBwnuZe+zPjiO36n5GOAe4skjXmw+0ooP6GJFzv
 F1+RyNSirHDa+1DqtmdvD0oSboV5GgHqCC9JqvASNkEARpFSwmEIJQtiSMFkuSTufdYW
 EtloItFEphcS5xHdSZvISxDqxUKFgYtw47NBqvinD9qhk6Ue0gvCqmFFLEsPcaQX7nzS
 RYG+mM4O+VsAuB/3pLv1KwACSaX9StbeLR7Sh46XtfXvMPsMZ9fyQuDlWg8Y5dISYri9
 4InhFd3aNI5Ccm8kpkz8PiLpA/AYr0gIWz7OdvbP4xNvhW4sB+E8VNzcqQR9QnYoJxhW 4A== 
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
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gTW9uLCBKdW4gMjQsIDIwMTkgYXQgMDY6MDY6MzZQTSArMDAwMCwgUnVzc2VsbCwgS2VudCB3
cm90ZToKPiBISSBEYW4sCj4gCj4gSSdsbCBjb21tZW50IGlubGluZSB3aXRoIFtLUl0gZm9yIHRo
ZSBtb3N0IHBhcnQuCj4gCj4gTW9zdCBvZiB0aGVzZSBjb21lIGZyb20gdGhlIGZhY3QgdGhhdCAi
ZmFpbHVyZSIgaGVyZSBpcyBub3QgY3JpdGljYWwuIElmIHdlIGNhbid0IG1ha2UgdGhlIHByb2Nm
cywgd2UganVzdCBjb21tZW50IGFib3V0IGl0IGluIGRtZXNnIGFuZCBjYXJyeSBvbi4gSWYgd2Ug
ZmFpbCB0byBtYWtlIHRoZSBwcm9jZnMgc3RydWN0dXJlIGhlcmUsIHdlIGp1c3QgcmVwb3J0IGFu
ZCBjYXJyeSBvbi4gVGhlIHJlc3Qgb2YgdGhlIGtlcm5lbCBjYW4gZnVuY3Rpb24gd2l0aG91dCBp
dCwgc28gZmFpbHVyZSBpc24ndCBjcml0aWNhbC4gQnV0IEkgc2hvdWxkIG1ha2UgdGhpcyBjbGVh
ciBpbiB0aGUgY29tbWVudHMuIFRoZXJlIGlzIG5vIHJlYWwgZXJyb3IgaGFuZGxpbmcgcmVxdWly
ZWQsIGJ1dCB3ZSBjYW4gY2xhcmlmeSB0aGF0IHdpdGggY29tbWVudHMuIEknbGwgdHJ5IHRvIGFk
ZHJlc3MgdGhpcyBpbiBhIGNvbWluZyBwYXRjaC4KPiAKClBhcnQgb2YgdGhlIHJlYXNvbiBmb3Ig
ZXJyb3IgaGFuZGxpbmcgaXMganVzdCB0byBzaWxlbmNlIHN0YXRpYyBjaGVja2VyCndhcm5pbmdz
IGJlY2F1c2Ugb3RoZXJ3aXNlIGV2ZXJ5b25lIGhhcyB0byByZXZpZXcgaXQgdG8gc2VlIGlmIHRo
ZQpyZXNvdXJjZSBsZWFrcyBhcmUgaW1wb3J0YW50LiAgSXQncyBlYXNpZXIgaW4gdGhlIGxvbmcg
cnVuIHRvIGp1c3QgZml4CmV2ZXJ5dGhpbmcgbm8gbWF0dGVyIGhvdyB0cml2aWFsLgoKcmVnYXJk
cywKZGFuIGNhcnBlbnRlcgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
