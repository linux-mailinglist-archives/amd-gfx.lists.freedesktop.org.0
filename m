Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9648BD115
	for <lists+amd-gfx@lfdr.de>; Tue, 24 Sep 2019 19:57:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF3A46EAC3;
	Tue, 24 Sep 2019 17:57:16 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 2065 seconds by postgrey-1.36 at gabe;
 Tue, 24 Sep 2019 17:47:38 UTC
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B5A26EAC3
 for <amd-gfx@lists.freedesktop.org>; Tue, 24 Sep 2019 17:47:38 +0000 (UTC)
Received: from pps.filterd (m0109333.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x8OH3tHp020099; Tue, 24 Sep 2019 10:13:10 -0700
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 2v7q7481tr-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 24 Sep 2019 10:13:10 -0700
Received: from ash-exopmbx201.TheFacebook.com (2620:10d:c0a8:83::8) by
 ash-exhub201.TheFacebook.com (2620:10d:c0a8:83::7) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 24 Sep 2019 10:13:09 -0700
Received: from ash-exhub202.TheFacebook.com (2620:10d:c0a8:83::6) by
 ash-exopmbx201.TheFacebook.com (2620:10d:c0a8:83::8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 24 Sep 2019 10:13:09 -0700
Received: from NAM03-BY2-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.36.103) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 24 Sep 2019 10:13:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m/oNt7asAPvxNzYDbc4Shocw/tZXipSVtpWmJKFh6oxcAtHvqqbC5UzCFMf+JwcAoR74kfcKRK80CEfftVYIgk2s/Kx13HyXo1Ebl+zwUBv/CWTP5Y6XUhjzS6pEv3h1Br8tseeFD5nnSCv4EBGc3EXKeYZlSrGWwAy0ekIs2siydsUUrp/CAbIfnacBQsd1UBb7mxQwxt+besJ1+h3syGlSn78oq3JjC4zenez3iNmAM+Sj8enwGQAmjj9TK5Q+GQgk9KNKi/LZZCCEiEyORUMzi0RYWS1Hpnmch+JMp6ldHNfPKzJjxiB1Ti8aQu4DeVFYbvN07q+JTJpViNeJnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oaNLN/OoQg0jn5YFYC9SRGx0oWJ1YJaT+a/tzQHnD+U=;
 b=hGeEfnw0Lu7k0PoGQwHiCGj1z6ouj/wGHXuuDBX1BI8xhkEzgosfO0scUtiexdTJYzjmwOP2PqOM10D3BVQbgytfhoxzS5u1ZHoJ9qxTIuNQo0fAnFV5yh06N18+ZL6RANadxJzUp9WEhJLkXBd+x2Y9a8dZRwnV63lI3mTyny2RIkqmax78PgMfWXJak7TwjnMf0BOOJozwzrjQ7T+P9iI1fSrCJGFlntKI+CbRLRQPAlRH7d1KvUmywFtkAO3HIIQ5fNx/n34XsWdfwGyr1Vkpjnv0TH21JL+WgqJHLpY+cTy3Ey0b4z66Amz1u0ix3X3mQ+30CXjkqz/F0KG/Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
Received: from BN8PR15MB2626.namprd15.prod.outlook.com (20.179.137.220) by
 BN8PR15MB2947.namprd15.prod.outlook.com (20.178.219.218) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.18; Tue, 24 Sep 2019 17:13:07 +0000
Received: from BN8PR15MB2626.namprd15.prod.outlook.com
 ([fe80::8174:3438:91db:ec29]) by BN8PR15MB2626.namprd15.prod.outlook.com
 ([fe80::8174:3438:91db:ec29%5]) with mapi id 15.20.2284.023; Tue, 24 Sep 2019
 17:13:07 +0000
From: Roman Gushchin <guro@fb.com>
To: "Kasiviswanathan, Harish" <Harish.Kasiviswanathan@amd.com>
Subject: Re: [PATCH v2 3/4] device_cgroup: Export devcgroup_check_permission
Thread-Topic: [PATCH v2 3/4] device_cgroup: Export devcgroup_check_permission
Thread-Index: AQHVbLlsnLqAQxP6tk+8o6W7mImx6qc7B1SAgAAV3oA=
Date: Tue, 24 Sep 2019 17:13:07 +0000
Message-ID: <20190924171303.GA1978@tower.DHCP.thefacebook.com>
References: <20190916180523.27341-1-Harish.Kasiviswanathan@amd.com>
 <20190916180523.27341-4-Harish.Kasiviswanathan@amd.com>
 <MN2PR12MB2911F59E9B91AAD349B4E40F8C840@MN2PR12MB2911.namprd12.prod.outlook.com>
In-Reply-To: <MN2PR12MB2911F59E9B91AAD349B4E40F8C840@MN2PR12MB2911.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR07CA0066.namprd07.prod.outlook.com
 (2603:10b6:a03:60::43) To BN8PR15MB2626.namprd15.prod.outlook.com
 (2603:10b6:408:c7::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2620:10d:c090:200::2:7406]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 82c7fe62-6b34-462b-09f1-08d7411277e0
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:BN8PR15MB2947; 
x-ms-traffictypediagnostic: BN8PR15MB2947:
x-microsoft-antispam-prvs: <BN8PR15MB2947EB010434743900C4E633BE840@BN8PR15MB2947.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0170DAF08C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(396003)(136003)(366004)(39860400002)(376002)(199004)(189003)(13464003)(486006)(256004)(33656002)(186003)(14444005)(71190400001)(14454004)(86362001)(8936002)(8676002)(305945005)(6246003)(71200400001)(6486002)(7736002)(316002)(229853002)(25786009)(81156014)(11346002)(46003)(6512007)(81166006)(476003)(6916009)(9686003)(5660300002)(53546011)(52116002)(446003)(66556008)(66446008)(66476007)(6436002)(64756008)(99286004)(102836004)(76176011)(66946007)(54906003)(2906002)(1076003)(478600001)(386003)(4326008)(6116002)(6506007);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BN8PR15MB2947;
 H:BN8PR15MB2626.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: sbULqnyE8xwT7VH1xDgLVLOZL5kf5GfLomgZ7kDDFgoVjhRMZuAAW37eNuqfGWGwsQ5vDl+XCgWyZZ6w+LyPjjrKDyNj+WYSaZ9hjdvV2Zz3EeMLsyl9eqnw1ZvDYui2WOSB7A8xsswGPBZzabFh7YFoar/xrv4u/lQgTGE4sB/ONHxk8Bl2balhvMaiWNrd5Q06/ESI9uhaNbDV+7bK4Ic9oQWo0Xeq6/Ct2QlvkL87YRxZKUshVNNeooemT8zWlPMd9+6HOiOPQBIKGwrqfKo/2glaZYtPB0aUokypsvol4nZ+LtPEBVGi0b8KDXcMRfzT8pnwOKkn7ISXeuIHCQlaLab/krsiANxTiePuRZHsaWtdrAY32NZqXoErGH7UUS/Z2pnmvvxKtUb46DaJ0A6+n7AvN/vs1YbDzHNanQY=
x-ms-exchange-transport-forked: True
Content-ID: <4C5BA7C636460D4186CFC4B1FC662A53@namprd15.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 82c7fe62-6b34-462b-09f1-08d7411277e0
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2019 17:13:07.4531 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QsiX5T32weTSms5ceOgaaL52iZO2EkX10FgnZPZxFt2DbSXYk9l6QXW5VbO9pKlk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR15MB2947
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-09-24_07:2019-09-23,2019-09-24 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 malwarescore=0
 clxscore=1011 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 mlxscore=0 impostorscore=0 phishscore=0 bulkscore=0 adultscore=0
 spamscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-1908290000 definitions=main-1909240150
X-FB-Internal: deliver
X-Mailman-Approved-At: Tue, 24 Sep 2019 17:57:15 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fb.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=oaNLN/OoQg0jn5YFYC9SRGx0oWJ1YJaT+a/tzQHnD+U=;
 b=KLwDOAL2ZomwKGcWmle97dLICfTildSZLmsHZfsDdwDkCq6W3usOe9Jl7rEaaT5KDhiX
 hvxGfKLleRNs1i7761JEjy8PFbBAtAFOPBkOUOShptPay6sjY46MilwJdqw9Se5mX/Kg
 0EnQAPClaaH0A/EOZykvuV0BQVcsLH+C+HY= 
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fb.onmicrosoft.com; 
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oaNLN/OoQg0jn5YFYC9SRGx0oWJ1YJaT+a/tzQHnD+U=;
 b=kmeKRuJrCBlmYZM1r5o/P/WEAIK44GU5vbbE8cc2TY853SAJbpmFKxMAJ/JpglsamhbcCH6TUJVzvdbPEo8NKhMYKrwHE7Oecmai9tFH2lh+36TlW5wXERlqPao1lcsmHrr4+sZJx2cEE273n38jKffKKR+HgSIMZwvCEc5XMIE=
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
Cc: "tj@kernel.org" <tj@kernel.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>,
 "cgroups@vger.kernel.org" <cgroups@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "airlied@redhat.com" <airlied@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gVHVlLCBTZXAgMjQsIDIwMTkgYXQgMDM6NTQ6NDdQTSArMDAwMCwgS2FzaXZpc3dhbmF0aGFu
LCBIYXJpc2ggd3JvdGU6Cj4gSGkgVGVqdW4sCj4gCj4gQ2FuIHlvdSBwbGVhc2UgcmV2aWV3IHRo
aXM/IFlvdSBhbmQgUm9tYW4gYWNrZWQgdGhpcyBwYXRjaCBiZWZvcmUuIEl0IHdpbGwgYmUgZ3Jl
YXQgaWYgSSBjYW4gUmV2aWV3ZWQtYnksIHNvIHRoYXQgSSBjYW4gdXBzdHJlYW0gdGhpcyB0aHJv
dWdoIEFsZXggRGV1Y2hlcidzIGFtZC1zdGFnaW5nLWRybS1uZXh0IGFuZCBEYXZlIEFpcmxpZSdz
IGRybS1uZXh0IHRyZWVzCj4gCj4gVGhhbmtzLAo+IEhhcmlzaAoKSGVsbG8sIEhhcmlzaCEKCklm
IGl0IGNhbiBoZWxwLCBwbGVhc2UsIGZlZWwgZnJlZSB0byB1c2UKUmV2aWV3ZWQtYnk6IFJvbWFu
IEd1c2hjaGluIDxndXJvQGZiLmNvbT4KClRoYW5rcyEKCj4gCj4gCj4gLS0tLS1PcmlnaW5hbCBN
ZXNzYWdlLS0tLS0KPiBGcm9tOiBLYXNpdmlzd2FuYXRoYW4sIEhhcmlzaCA8SGFyaXNoLkthc2l2
aXN3YW5hdGhhbkBhbWQuY29tPiAKPiBTZW50OiBNb25kYXksIFNlcHRlbWJlciAxNiwgMjAxOSAy
OjA2IFBNCj4gVG86IHRqQGtlcm5lbC5vcmc7IERldWNoZXIsIEFsZXhhbmRlciA8QWxleGFuZGVy
LkRldWNoZXJAYW1kLmNvbT47IGFpcmxpZWRAcmVkaGF0LmNvbQo+IENjOiBjZ3JvdXBzQHZnZXIu
a2VybmVsLm9yZzsgYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IEthc2l2aXN3YW5hdGhh
biwgSGFyaXNoIDxIYXJpc2guS2FzaXZpc3dhbmF0aGFuQGFtZC5jb20+Cj4gU3ViamVjdDogW1BB
VENIIHYyIDMvNF0gZGV2aWNlX2Nncm91cDogRXhwb3J0IGRldmNncm91cF9jaGVja19wZXJtaXNz
aW9uCj4gCj4gRm9yIEFNRCBjb21wdXRlIChhbWRrZmQpIGRyaXZlci4KPiAKPiBBbGwgQU1EIGNv
bXB1dGUgZGV2aWNlcyBhcmUgZXhwb3J0ZWQgdmlhIHNpbmdsZSBkZXZpY2Ugbm9kZSAvZGV2L2tm
ZC4gQXMKPiBhIHJlc3VsdCBkZXZpY2VzIGNhbm5vdCBiZSBjb250cm9sbGVkIGluZGl2aWR1YWxs
eSB1c2luZyBkZXZpY2UgY2dyb3VwLgo+IAo+IEFNRCBjb21wdXRlIGRldmljZXMgd2lsbCByZWx5
IG9uIGl0cyBncmFwaGljcyBjb3VudGVycGFydCB0aGF0IGV4cG9zZXMKPiAvZGV2L2RyaS9yZW5k
ZXJOIG5vZGUgZm9yIGVhY2ggZGV2aWNlLiBGb3IgZWFjaCB0YXNrIChiYXNlZCBvbiBpdHMKPiBj
Z3JvdXApLCBLRkQgZHJpdmVyIHdpbGwgY2hlY2sgaWYgL2Rldi9kcmkvcmVuZGVyTiBub2RlIGlz
IGFjY2Vzc2libGUKPiBiZWZvcmUgZXhwb3NpbmcgaXQuCj4gCj4gQ2hhbmdlLUlkOiBJOWFlMjgz
ZGY1NTBiMmMxMjJkNjc4NzBiMGNmYTMxNmJmYmYzYjYxNAo+IEFja2VkLWJ5OiBGZWxpeCBLdWVo
bGluZyA8RmVsaXguS3VlaGxpbmdAYW1kLmNvbT4KPiBBY2tlZC1ieTogVGVqdW4gSGVvIDx0akBr
ZXJuZWwub3JnPgo+IEFja2VkLWJ5OiBSb21hbiBHdXNoY2hpbiA8Z3Vyb0BmYi5jb20+Cj4gU2ln
bmVkLW9mZi1ieTogSGFyaXNoIEthc2l2aXN3YW5hdGhhbiA8SGFyaXNoLkthc2l2aXN3YW5hdGhh
bkBhbWQuY29tPgo+IC0tLQo+ICBpbmNsdWRlL2xpbnV4L2RldmljZV9jZ3JvdXAuaCB8IDE5ICsr
KystLS0tLS0tLS0tLS0tLS0KPiAgc2VjdXJpdHkvZGV2aWNlX2Nncm91cC5jICAgICAgfCAxNSAr
KysrKysrKysrKysrLS0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspLCAxNyBk
ZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9kZXZpY2VfY2dyb3Vw
LmggYi9pbmNsdWRlL2xpbnV4L2RldmljZV9jZ3JvdXAuaAo+IGluZGV4IDg1NTdlZmUwOTZkYy4u
ZmEzNWI1MmUwMDAyIDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvbGludXgvZGV2aWNlX2Nncm91cC5o
Cj4gKysrIGIvaW5jbHVkZS9saW51eC9kZXZpY2VfY2dyb3VwLmgKPiBAQCAtMTIsMjYgKzEyLDE1
IEBACj4gICNkZWZpbmUgREVWQ0dfREVWX0FMTCAgIDQgIC8qIHRoaXMgcmVwcmVzZW50cyBhbGwg
ZGV2aWNlcyAqLwo+ICAKPiAgI2lmZGVmIENPTkZJR19DR1JPVVBfREVWSUNFCj4gLWV4dGVybiBp
bnQgX19kZXZjZ3JvdXBfY2hlY2tfcGVybWlzc2lvbihzaG9ydCB0eXBlLCB1MzIgbWFqb3IsIHUz
MiBtaW5vciwKPiAtCQkJCQlzaG9ydCBhY2Nlc3MpOwo+ICtpbnQgZGV2Y2dyb3VwX2NoZWNrX3Bl
cm1pc3Npb24oc2hvcnQgdHlwZSwgdTMyIG1ham9yLCB1MzIgbWlub3IsCj4gKwkJCSAgICAgICBz
aG9ydCBhY2Nlc3MpOwo+ICAjZWxzZQo+IC1zdGF0aWMgaW5saW5lIGludCBfX2RldmNncm91cF9j
aGVja19wZXJtaXNzaW9uKHNob3J0IHR5cGUsIHUzMiBtYWpvciwgdTMyIG1pbm9yLAo+IC0JCQkJ
CSAgICAgICBzaG9ydCBhY2Nlc3MpCj4gK3N0YXRpYyBpbmxpbmUgaW50IGRldmNncm91cF9jaGVj
a19wZXJtaXNzaW9uKHNob3J0IHR5cGUsIHUzMiBtYWpvciwgdTMyIG1pbm9yLAo+ICsJCQkJCSAg
ICAgc2hvcnQgYWNjZXNzKQo+ICB7IHJldHVybiAwOyB9Cj4gICNlbmRpZgo+ICAKPiAgI2lmIGRl
ZmluZWQoQ09ORklHX0NHUk9VUF9ERVZJQ0UpIHx8IGRlZmluZWQoQ09ORklHX0NHUk9VUF9CUEYp
Cj4gLXN0YXRpYyBpbmxpbmUgaW50IGRldmNncm91cF9jaGVja19wZXJtaXNzaW9uKHNob3J0IHR5
cGUsIHUzMiBtYWpvciwgdTMyIG1pbm9yLAo+IC0JCQkJCSAgICAgc2hvcnQgYWNjZXNzKQo+IC17
Cj4gLQlpbnQgcmMgPSBCUEZfQ0dST1VQX1JVTl9QUk9HX0RFVklDRV9DR1JPVVAodHlwZSwgbWFq
b3IsIG1pbm9yLCBhY2Nlc3MpOwo+IC0KPiAtCWlmIChyYykKPiAtCQlyZXR1cm4gLUVQRVJNOwo+
IC0KPiAtCXJldHVybiBfX2RldmNncm91cF9jaGVja19wZXJtaXNzaW9uKHR5cGUsIG1ham9yLCBt
aW5vciwgYWNjZXNzKTsKPiAtfQo+IC0KPiAgc3RhdGljIGlubGluZSBpbnQgZGV2Y2dyb3VwX2lu
b2RlX3Blcm1pc3Npb24oc3RydWN0IGlub2RlICppbm9kZSwgaW50IG1hc2spCj4gIHsKPiAgCXNo
b3J0IHR5cGUsIGFjY2VzcyA9IDA7Cj4gZGlmZiAtLWdpdCBhL3NlY3VyaXR5L2RldmljZV9jZ3Jv
dXAuYyBiL3NlY3VyaXR5L2RldmljZV9jZ3JvdXAuYwo+IGluZGV4IGRjMjg5MTRmYTcyZS4uMDRk
ZDI5YmY3ZjA2IDEwMDY0NAo+IC0tLSBhL3NlY3VyaXR5L2RldmljZV9jZ3JvdXAuYwo+ICsrKyBi
L3NlY3VyaXR5L2RldmljZV9jZ3JvdXAuYwo+IEBAIC04MDEsOCArODAxLDggQEAgc3RydWN0IGNn
cm91cF9zdWJzeXMgZGV2aWNlc19jZ3JwX3N1YnN5cyA9IHsKPiAgICoKPiAgICogcmV0dXJucyAw
IG9uIHN1Y2Nlc3MsIC1FUEVSTSBjYXNlIHRoZSBvcGVyYXRpb24gaXMgbm90IHBlcm1pdHRlZAo+
ICAgKi8KPiAtaW50IF9fZGV2Y2dyb3VwX2NoZWNrX3Blcm1pc3Npb24oc2hvcnQgdHlwZSwgdTMy
IG1ham9yLCB1MzIgbWlub3IsCj4gLQkJCQkgc2hvcnQgYWNjZXNzKQo+ICtzdGF0aWMgaW50IF9f
ZGV2Y2dyb3VwX2NoZWNrX3Blcm1pc3Npb24oc2hvcnQgdHlwZSwgdTMyIG1ham9yLCB1MzIgbWlu
b3IsCj4gKwkJCQkJc2hvcnQgYWNjZXNzKQo+ICB7Cj4gIAlzdHJ1Y3QgZGV2X2Nncm91cCAqZGV2
X2Nncm91cDsKPiAgCWJvb2wgcmM7Cj4gQEAgLTgyNCwzICs4MjQsMTQgQEAgaW50IF9fZGV2Y2dy
b3VwX2NoZWNrX3Blcm1pc3Npb24oc2hvcnQgdHlwZSwgdTMyIG1ham9yLCB1MzIgbWlub3IsCj4g
IAo+ICAJcmV0dXJuIDA7Cj4gIH0KPiArCj4gK2ludCBkZXZjZ3JvdXBfY2hlY2tfcGVybWlzc2lv
bihzaG9ydCB0eXBlLCB1MzIgbWFqb3IsIHUzMiBtaW5vciwgc2hvcnQgYWNjZXNzKQo+ICt7Cj4g
KwlpbnQgcmMgPSBCUEZfQ0dST1VQX1JVTl9QUk9HX0RFVklDRV9DR1JPVVAodHlwZSwgbWFqb3Is
IG1pbm9yLCBhY2Nlc3MpOwo+ICsKPiArCWlmIChyYykKPiArCQlyZXR1cm4gLUVQRVJNOwo+ICsK
PiArCXJldHVybiBfX2RldmNncm91cF9jaGVja19wZXJtaXNzaW9uKHR5cGUsIG1ham9yLCBtaW5v
ciwgYWNjZXNzKTsKPiArfQo+ICtFWFBPUlRfU1lNQk9MKGRldmNncm91cF9jaGVja19wZXJtaXNz
aW9uKTsKPiAtLSAKPiAyLjE3LjEKPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9h
bWQtZ2Z4
