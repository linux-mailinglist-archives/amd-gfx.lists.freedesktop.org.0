Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FADF21C81
	for <lists+amd-gfx@lfdr.de>; Fri, 17 May 2019 19:31:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E110389949;
	Fri, 17 May 2019 17:31:15 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD41889811
 for <amd-gfx@lists.freedesktop.org>; Fri, 17 May 2019 17:06:41 +0000 (UTC)
Received: from pps.filterd (m0109332.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4HH4doJ023895; Fri, 17 May 2019 10:06:38 -0700
Received: from mail.thefacebook.com (mailout.thefacebook.com [199.201.64.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2shxhhrk7h-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Fri, 17 May 2019 10:06:38 -0700
Received: from prn-hub01.TheFacebook.com (2620:10d:c081:35::125) by
 prn-hub03.TheFacebook.com (2620:10d:c081:35::127) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Fri, 17 May 2019 10:06:37 -0700
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1713.5
 via Frontend Transport; Fri, 17 May 2019 10:06:37 -0700
Received: from BYAPR15MB2631.namprd15.prod.outlook.com (20.179.156.24) by
 BYAPR15MB2821.namprd15.prod.outlook.com (20.179.158.206) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.22; Fri, 17 May 2019 17:06:36 +0000
Received: from BYAPR15MB2631.namprd15.prod.outlook.com
 ([fe80::d4f6:b485:69ee:fd9a]) by BYAPR15MB2631.namprd15.prod.outlook.com
 ([fe80::d4f6:b485:69ee:fd9a%7]) with mapi id 15.20.1900.010; Fri, 17 May 2019
 17:06:35 +0000
From: Roman Gushchin <guro@fb.com>
To: "Kasiviswanathan, Harish" <Harish.Kasiviswanathan@amd.com>
Subject: Re: [PATCH v2 3/4] device_cgroup: Export devcgroup_check_permission
Thread-Topic: [PATCH v2 3/4] device_cgroup: Export devcgroup_check_permission
Thread-Index: AQHVDMuwlGxX/j2JnUSoSESRdhEwJaZvjCgA
Date: Fri, 17 May 2019 17:06:35 +0000
Message-ID: <20190517170630.GA1646@tower.DHCP.thefacebook.com>
References: <20190517161435.14121-1-Harish.Kasiviswanathan@amd.com>
 <20190517161435.14121-4-Harish.Kasiviswanathan@amd.com>
In-Reply-To: <20190517161435.14121-4-Harish.Kasiviswanathan@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MWHPR03CA0016.namprd03.prod.outlook.com
 (2603:10b6:300:117::26) To BYAPR15MB2631.namprd15.prod.outlook.com
 (2603:10b6:a03:152::24)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2620:10d:c090:200::1:2e0d]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7c58dc14-5bdc-4407-5ebb-08d6daea04b0
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);
 SRVR:BYAPR15MB2821; 
x-ms-traffictypediagnostic: BYAPR15MB2821:
x-microsoft-antispam-prvs: <BYAPR15MB2821BBCBDB96F6FE4B375ED0BE0B0@BYAPR15MB2821.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0040126723
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(346002)(366004)(396003)(39860400002)(376002)(199004)(189003)(256004)(14444005)(25786009)(1076003)(6916009)(14454004)(8936002)(81166006)(8676002)(6246003)(81156014)(476003)(4326008)(5660300002)(478600001)(11346002)(46003)(33656002)(446003)(229853002)(99286004)(186003)(6436002)(54906003)(64756008)(73956011)(66556008)(66476007)(66446008)(6512007)(9686003)(68736007)(386003)(66946007)(86362001)(6116002)(102836004)(305945005)(6506007)(2906002)(52116002)(71200400001)(71190400001)(6486002)(7736002)(486006)(53936002)(76176011)(316002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR15MB2821;
 H:BYAPR15MB2631.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: LODF53f37dTqzs76v+gWepWnbTXq7v0FmhKS86lnHv+KXyqs9YOj+5Q57Vg1VXQZCFFyO0aVYKY53oujyRM2pJueoK3VLk8J7Eg3E61vVvCcTQvCKgJhmzbQPNBcyF25uFrovgKViGLZO32PpsN4czRpaPVw7GXWUWAHF/Jt0amV2rtzH87dtuOp6DnnZIcXlc/Wj0KZ85HliC/951kEjONfs+I3+ypwZykMCvnFchkWujnNwFXbpnBu89MKzRYw2Dvg+/fen2JTCiYzjtUR5WqfXK5rSFFYKP2G/cjp6FN3l1p29QhpOJn9LyR00hOMo3Zd9AQEK7fuvOpurFd0v5D0uv19lX/Ry1FEUyggFy7UOj/evPSptl/MbIRr3pdVl/+jeqgTH2HkgFaUoLJ3TJInKmjm8FD2CcM5k7LkHjQ=
Content-ID: <DC1F663BC871E54EB6797495E4A22492@namprd15.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c58dc14-5bdc-4407-5ebb-08d6daea04b0
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 May 2019 17:06:35.8671 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB2821
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-17_10:, , signatures=0
X-Proofpoint-Spam-Reason: safe
X-FB-Internal: Safe
X-Mailman-Approved-At: Fri, 17 May 2019 17:31:14 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fb.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=pnMrEG9vRZsFDJQ6gNjPxBugHwQOwy4CdNuaafAAmSc=;
 b=Z3eSJf0RaI77w7mYOpQRu/aKk+vMg6WQKrpEJrU/YSBnlw6WaEB46ZUa1DAttKiAlhEj
 X6euveiu2kcS4QOki7uWH/Bb7pME7ld/KDZhdxs76yIwTo9A/Ktcco2mR694/KfqjA/m
 aYkPlczg6pc2f//8fV2lPOiUbZPJmtLENoE= 
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fb.onmicrosoft.com; s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pnMrEG9vRZsFDJQ6gNjPxBugHwQOwy4CdNuaafAAmSc=;
 b=Z78BCI5dGhDrFRq18yq3C/H7ezjOgHjZ2qcSgVFimvpOA1PqhTCz94V9ODS05niEgNhxSVguz64hwBN032f9yb1ST6GyCgG2PxVK0Z6j8/iWzdJT1uZwJ5oEXDi6TrsfCU7bGBTXd8qLlSbwG4wexS9G836+oWa4uKVoMbSUrl8=
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
Cc: "cgroups@vger.kernel.org" <cgroups@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gRnJpLCBNYXkgMTcsIDIwMTkgYXQgMDQ6MTU6MDZQTSArMDAwMCwgS2FzaXZpc3dhbmF0aGFu
LCBIYXJpc2ggd3JvdGU6Cj4gRm9yIEFNRCBjb21wdXRlIChhbWRrZmQpIGRyaXZlci4KPiAKPiBB
bGwgQU1EIGNvbXB1dGUgZGV2aWNlcyBhcmUgZXhwb3J0ZWQgdmlhIHNpbmdsZSBkZXZpY2Ugbm9k
ZSAvZGV2L2tmZC4gQXMKPiBhIHJlc3VsdCBkZXZpY2VzIGNhbm5vdCBiZSBjb250cm9sbGVkIGlu
ZGl2aWR1YWxseSB1c2luZyBkZXZpY2UgY2dyb3VwLgo+IAo+IEFNRCBjb21wdXRlIGRldmljZXMg
d2lsbCByZWx5IG9uIGl0cyBncmFwaGljcyBjb3VudGVycGFydCB0aGF0IGV4cG9zZXMKPiAvZGV2
L2RyaS9yZW5kZXJOIG5vZGUgZm9yIGVhY2ggZGV2aWNlLiBGb3IgZWFjaCB0YXNrIChiYXNlZCBv
biBpdHMKPiBjZ3JvdXApLCBLRkQgZHJpdmVyIHdpbGwgY2hlY2sgaWYgL2Rldi9kcmkvcmVuZGVy
TiBub2RlIGlzIGFjY2Vzc2libGUKPiBiZWZvcmUgZXhwb3NpbmcgaXQuCj4gCj4gQ2hhbmdlLUlk
OiBJMWI5NzA1YjJjMzA2MjJhMjc2NTVmNGY4Nzg5ODBmYTEzOGRiZjM3Mwo+IFNpZ25lZC1vZmYt
Ynk6IEhhcmlzaCBLYXNpdmlzd2FuYXRoYW4gPEhhcmlzaC5LYXNpdmlzd2FuYXRoYW5AYW1kLmNv
bT4KPiAtLS0KPiAgaW5jbHVkZS9saW51eC9kZXZpY2VfY2dyb3VwLmggfCAxOSArKysrLS0tLS0t
LS0tLS0tLS0tCj4gIHNlY3VyaXR5L2RldmljZV9jZ3JvdXAuYyAgICAgIHwgMTUgKysrKysrKysr
KysrKy0tCj4gIDIgZmlsZXMgY2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygrKSwgMTcgZGVsZXRpb25z
KC0pCj4gCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvZGV2aWNlX2Nncm91cC5oIGIvaW5j
bHVkZS9saW51eC9kZXZpY2VfY2dyb3VwLmgKPiBpbmRleCA4NTU3ZWZlMDk2ZGMuLmJkMTk4OTdi
ZDU4MiAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2xpbnV4L2RldmljZV9jZ3JvdXAuaAo+ICsrKyBi
L2luY2x1ZGUvbGludXgvZGV2aWNlX2Nncm91cC5oCj4gQEAgLTEyLDI2ICsxMiwxNSBAQAo+ICAj
ZGVmaW5lIERFVkNHX0RFVl9BTEwgICA0ICAvKiB0aGlzIHJlcHJlc2VudHMgYWxsIGRldmljZXMg
Ki8KPiAgCj4gICNpZmRlZiBDT05GSUdfQ0dST1VQX0RFVklDRQo+IC1leHRlcm4gaW50IF9fZGV2
Y2dyb3VwX2NoZWNrX3Blcm1pc3Npb24oc2hvcnQgdHlwZSwgdTMyIG1ham9yLCB1MzIgbWlub3Is
Cj4gLQkJCQkJc2hvcnQgYWNjZXNzKTsKPiArZXh0ZXJuIGludCBkZXZjZ3JvdXBfY2hlY2tfcGVy
bWlzc2lvbihzaG9ydCB0eXBlLCB1MzIgbWFqb3IsIHUzMiBtaW5vciwKPiArCQkJCSAgICAgIHNo
b3J0IGFjY2Vzcyk7Cj4gICNlbHNlCj4gLXN0YXRpYyBpbmxpbmUgaW50IF9fZGV2Y2dyb3VwX2No
ZWNrX3Blcm1pc3Npb24oc2hvcnQgdHlwZSwgdTMyIG1ham9yLCB1MzIgbWlub3IsCj4gLQkJCQkJ
ICAgICAgIHNob3J0IGFjY2VzcykKPiArc3RhdGljIGlubGluZSBpbnQgZGV2Y2dyb3VwX2NoZWNr
X3Blcm1pc3Npb24oc2hvcnQgdHlwZSwgdTMyIG1ham9yLCB1MzIgbWlub3IsCj4gKwkJCQkJICAg
ICBzaG9ydCBhY2Nlc3MpCj4gIHsgcmV0dXJuIDA7IH0KPiAgI2VuZGlmCj4gIAo+ICAjaWYgZGVm
aW5lZChDT05GSUdfQ0dST1VQX0RFVklDRSkgfHwgZGVmaW5lZChDT05GSUdfQ0dST1VQX0JQRikK
PiAtc3RhdGljIGlubGluZSBpbnQgZGV2Y2dyb3VwX2NoZWNrX3Blcm1pc3Npb24oc2hvcnQgdHlw
ZSwgdTMyIG1ham9yLCB1MzIgbWlub3IsCj4gLQkJCQkJICAgICBzaG9ydCBhY2Nlc3MpCj4gLXsK
PiAtCWludCByYyA9IEJQRl9DR1JPVVBfUlVOX1BST0dfREVWSUNFX0NHUk9VUCh0eXBlLCBtYWpv
ciwgbWlub3IsIGFjY2Vzcyk7Cj4gLQo+IC0JaWYgKHJjKQo+IC0JCXJldHVybiAtRVBFUk07Cj4g
LQo+IC0JcmV0dXJuIF9fZGV2Y2dyb3VwX2NoZWNrX3Blcm1pc3Npb24odHlwZSwgbWFqb3IsIG1p
bm9yLCBhY2Nlc3MpOwo+IC19Cj4gLQo+ICBzdGF0aWMgaW5saW5lIGludCBkZXZjZ3JvdXBfaW5v
ZGVfcGVybWlzc2lvbihzdHJ1Y3QgaW5vZGUgKmlub2RlLCBpbnQgbWFzaykKPiAgewo+ICAJc2hv
cnQgdHlwZSwgYWNjZXNzID0gMDsKPiBkaWZmIC0tZ2l0IGEvc2VjdXJpdHkvZGV2aWNlX2Nncm91
cC5jIGIvc2VjdXJpdHkvZGV2aWNlX2Nncm91cC5jCj4gaW5kZXggY2Q5NzkyOWZhYzY2Li4zYzU3
ZTA1YmY3M2IgMTAwNjQ0Cj4gLS0tIGEvc2VjdXJpdHkvZGV2aWNlX2Nncm91cC5jCj4gKysrIGIv
c2VjdXJpdHkvZGV2aWNlX2Nncm91cC5jCj4gQEAgLTgwMSw4ICs4MDEsOCBAQCBzdHJ1Y3QgY2dy
b3VwX3N1YnN5cyBkZXZpY2VzX2NncnBfc3Vic3lzID0gewo+ICAgKgo+ICAgKiByZXR1cm5zIDAg
b24gc3VjY2VzcywgLUVQRVJNIGNhc2UgdGhlIG9wZXJhdGlvbiBpcyBub3QgcGVybWl0dGVkCj4g
ICAqLwo+IC1pbnQgX19kZXZjZ3JvdXBfY2hlY2tfcGVybWlzc2lvbihzaG9ydCB0eXBlLCB1MzIg
bWFqb3IsIHUzMiBtaW5vciwKPiAtCQkJCSBzaG9ydCBhY2Nlc3MpCj4gK3N0YXRpYyBpbnQgX19k
ZXZjZ3JvdXBfY2hlY2tfcGVybWlzc2lvbihzaG9ydCB0eXBlLCB1MzIgbWFqb3IsIHUzMiBtaW5v
ciwKPiArCQkJCQlzaG9ydCBhY2Nlc3MpCj4gIHsKPiAgCXN0cnVjdCBkZXZfY2dyb3VwICpkZXZf
Y2dyb3VwOwo+ICAJYm9vbCByYzsKPiBAQCAtODI0LDMgKzgyNCwxNCBAQCBpbnQgX19kZXZjZ3Jv
dXBfY2hlY2tfcGVybWlzc2lvbihzaG9ydCB0eXBlLCB1MzIgbWFqb3IsIHUzMiBtaW5vciwKPiAg
Cj4gIAlyZXR1cm4gMDsKPiAgfQo+ICsKPiAraW50IGRldmNncm91cF9jaGVja19wZXJtaXNzaW9u
KHNob3J0IHR5cGUsIHUzMiBtYWpvciwgdTMyIG1pbm9yLCBzaG9ydCBhY2Nlc3MpCj4gK3sKPiAr
CWludCByYyA9IEJQRl9DR1JPVVBfUlVOX1BST0dfREVWSUNFX0NHUk9VUCh0eXBlLCBtYWpvciwg
bWlub3IsIGFjY2Vzcyk7Cj4gKwo+ICsJaWYgKHJjKQo+ICsJCXJldHVybiAtRVBFUk07Cj4gKwo+
ICsJcmV0dXJuIF9fZGV2Y2dyb3VwX2NoZWNrX3Blcm1pc3Npb24odHlwZSwgbWFqb3IsIG1pbm9y
LCBhY2Nlc3MpOwo+ICt9Cj4gK0VYUE9SVF9TWU1CT0woZGV2Y2dyb3VwX2NoZWNrX3Blcm1pc3Np
b24pOwoKUGVyZmVjdCwgbm93IGxvb2tzIGdvb2QgdG8gbWUhCgpQbGVhc2UsIGZlZWwgZnJlZSB0
byB1c2UgbXkgYWNrcyBmb3IgcGF0Y2hlcyAzIGFuZCA0OgpBY2tlZC1ieTogUm9tYW4gR3VzaGNo
aW4gPGd1cm9AZmIuY29tPgoKVGhhbmtzIQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2FtZC1nZng=
