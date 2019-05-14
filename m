Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B4741C08D
	for <lists+amd-gfx@lfdr.de>; Tue, 14 May 2019 04:24:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FD0189247;
	Tue, 14 May 2019 02:24:47 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 937 seconds by postgrey-1.36 at gabe;
 Tue, 14 May 2019 02:14:42 UTC
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F2588924C
 for <amd-gfx@lists.freedesktop.org>; Tue, 14 May 2019 02:14:42 +0000 (UTC)
Received: from pps.filterd (m0044010.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4E1oB36030425; Mon, 13 May 2019 18:59:01 -0700
Received: from mail.thefacebook.com (mailout.thefacebook.com [199.201.64.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2sf9vh2cjx-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Mon, 13 May 2019 18:59:01 -0700
Received: from prn-mbx01.TheFacebook.com (2620:10d:c081:6::15) by
 prn-hub06.TheFacebook.com (2620:10d:c081:35::130) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Mon, 13 May 2019 18:59:01 -0700
Received: from prn-hub05.TheFacebook.com (2620:10d:c081:35::129) by
 prn-mbx01.TheFacebook.com (2620:10d:c081:6::15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Mon, 13 May 2019 18:59:00 -0700
Received: from NAM01-SN1-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.29) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1713.5
 via Frontend Transport; Mon, 13 May 2019 18:59:00 -0700
Received: from BN8PR15MB2626.namprd15.prod.outlook.com (20.179.137.220) by
 BN8PR15MB2692.namprd15.prod.outlook.com (20.179.138.209) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.25; Tue, 14 May 2019 01:58:40 +0000
Received: from BN8PR15MB2626.namprd15.prod.outlook.com
 ([fe80::251b:ff54:1c67:4e5f]) by BN8PR15MB2626.namprd15.prod.outlook.com
 ([fe80::251b:ff54:1c67:4e5f%7]) with mapi id 15.20.1878.024; Tue, 14 May 2019
 01:58:40 +0000
From: Roman Gushchin <guro@fb.com>
To: "Kasiviswanathan, Harish" <Harish.Kasiviswanathan@amd.com>
Subject: Re: [PATCH 4/4] drm/amdkfd: Check against device cgroup
Thread-Topic: [PATCH 4/4] drm/amdkfd: Check against device cgroup
Thread-Index: AQHVAC55koEwRnit7kyr2zcr6OGdM6Zp8LgA
Date: Tue, 14 May 2019 01:58:40 +0000
Message-ID: <20190514015832.GA14741@tower.DHCP.thefacebook.com>
References: <20190501145904.27505-1-Harish.Kasiviswanathan@amd.com>
 <20190501145904.27505-5-Harish.Kasiviswanathan@amd.com>
In-Reply-To: <20190501145904.27505-5-Harish.Kasiviswanathan@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR01CA0002.prod.exchangelabs.com (2603:10b6:a02:80::15)
 To BN8PR15MB2626.namprd15.prod.outlook.com
 (2603:10b6:408:c7::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2620:10d:c090:200::3cb5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6c89329c-60e5-4620-a799-08d6d80faf5b
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);
 SRVR:BN8PR15MB2692; 
x-ms-traffictypediagnostic: BN8PR15MB2692:
x-microsoft-antispam-prvs: <BN8PR15MB26928D5C35302C17EDBFF5A4BE080@BN8PR15MB2692.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0037FD6480
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(376002)(396003)(39860400002)(366004)(346002)(199004)(189003)(6512007)(1076003)(229853002)(14444005)(9686003)(7736002)(81166006)(71200400001)(478600001)(71190400001)(186003)(81156014)(6486002)(256004)(6246003)(8936002)(8676002)(53936002)(33656002)(446003)(305945005)(46003)(64756008)(6916009)(5660300002)(66946007)(66446008)(73956011)(11346002)(66556008)(6436002)(54906003)(66476007)(4326008)(486006)(476003)(86362001)(14454004)(6116002)(316002)(25786009)(2906002)(6506007)(52116002)(99286004)(68736007)(76176011)(386003)(102836004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BN8PR15MB2692;
 H:BN8PR15MB2626.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 2MDlAHQCOppJ5pKconq31DaNTjO9pcfH98tBjuaBtoflCYnkQo7Bcs5Rgzq+zWOmZZmQRZkxOAekuiR7PCQnup+/yub3ltlGlSuGwYVofgPaP92O1Erlq+FIIBTYpda3RwcwmkBSKE2xMLOhsDVD+GWJdJcF6hwD1BPP+XZ39WB3LVEd7WmMJIEBa7Cb1MQ1eN/VF8S9UjTTkOL2LCSTQMMKV+Z+0uJV57WditZ6O5bEq1KJ2XR/k65XXFjknDjsjaGlcDKx78MtXQUc+Sdg/mBg+eGD1ILb3z4o5DkkEjaBNraWKCVYqidtC8pC/UU5Pg2Y0+LN0JqTOWMYW6RHiH92xykCmqdKUng/nA2a2Q+acpMRsajRLB98+LG3dGJW+7SldUWpivIPHIp6azfFADbxjQccEAg9d5b1bWmrWuw=
Content-ID: <6FF8CD02E98B004BBE547B3D3A239E33@namprd15.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c89329c-60e5-4620-a799-08d6d80faf5b
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 May 2019 01:58:40.1430 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR15MB2692
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-14_01:, , signatures=0
X-Proofpoint-Spam-Reason: safe
X-FB-Internal: Safe
X-Mailman-Approved-At: Tue, 14 May 2019 02:24:46 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fb.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=i3Pkxf7VTf2IM0QTltjUJeV3OviV+aj+2NUhz7zBWuw=;
 b=AuFO/DlHcVDzd9CqPVz+ERSfyu/z8BUKNy0lNo9MOf+rDaG2xqQ+HAFzm1cA2zlv43ao
 oI1LoAWPGMpUTW4H9nbCXbPx2MccIM41cPuhV1l/gixIQEuQmQkLaRLTbx2EfJPyxLND
 BUaL8DHgOGv2DSFPZvX7Wimrkbw7hAC6QC0= 
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fb.onmicrosoft.com; s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i3Pkxf7VTf2IM0QTltjUJeV3OviV+aj+2NUhz7zBWuw=;
 b=gUdJwCB9lVehEqge/dww1jYByYlnasnAZ8f9F84HXnmveB+4jB2beFDl20cd/9n/F71Xy0u7m+lfCmAXVhv2dfPhkhoZDM5gMyo6ewpiEniab95II16Roy/8eZtWR2r97d0KQfiyQZDnhyfIqTVWeODemq4k67lD7BDGTD3zBFU=
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

T24gV2VkLCBNYXkgMDEsIDIwMTkgYXQgMDI6NTk6MjlQTSArMDAwMCwgS2FzaXZpc3dhbmF0aGFu
LCBIYXJpc2ggd3JvdGU6Cj4gUGFydGljaXBhdGUgaW4gZGV2aWNlIGNncm91cC4gQWxsIGtmZCBk
ZXZpY2VzIGFyZSBleHBvc2VkIHZpYSAvZGV2L2tmZC4KPiBTbyB1c2UgL2Rldi9kcmkvcmVuZGVy
TiBub2RlLgo+IAo+IEJlZm9yZSBleHBvc2luZyB0aGUgZGV2aWNlIHRvIGEgdGFzayBjaGVjayBp
ZiBpdCBoYXMgcGVybWlzc2lvbiB0bwo+IGFjY2VzcyBpdC4gSWYgdGhlIHRhc2sgKGJhc2VkIG9u
IGl0cyBjZ3JvdXApIGNhbiBhY2Nlc3MgL2Rldi9kcmkvcmVuZGVyTgo+IHRoZW4gZXhwb3NlIHRo
ZSBkZXZpY2UgdmlhIGtmZCBub2RlLgo+IAo+IElmIHRoZSB0YXNrIGNhbm5vdCBhY2Nlc3MgL2Rl
di9kcmkvcmVuZGVyTiB0aGVuIHByb2Nlc3MgZGV2aWNlIGRhdGEKPiAocGRkKSBpcyBub3QgY3Jl
YXRlZC4gVGhpcyB3aWxsIGVuc3VyZSB0aGF0IHRhc2sgY2Fubm90IHVzZSB0aGUgZGV2aWNlLgo+
IAo+IEluIHN5c2ZzIHRvcG9sb2d5LCBhbGwgZGV2aWNlIG5vZGVzIGFyZSB2aXNpYmxlIGlycmVz
cGVjdGl2ZSBvZiB0aGUgdGFzawo+IGNncm91cC4gVGhlIHN5c2ZzIG5vZGUgZGlyZWN0b3JpZXMg
YXJlIGNyZWF0ZWQgYXQgZHJpdmVyIGxvYWQgdGltZSBhbmQKPiBjYW5ub3QgYmUgY2hhbmdlZCBk
eW5hbWljYWxseS4gSG93ZXZlciwgYWNjZXNzIHRvIGluZm9ybWF0aW9uIGluc2lkZQo+IG5vZGVz
IGlzIGNvbnRyb2xsZWQgYmFzZWQgb24gdGhlIHRhc2sncyBjZ3JvdXAgcGVybWlzc2lvbnMuCj4g
Cj4gU2lnbmVkLW9mZi1ieTogSGFyaXNoIEthc2l2aXN3YW5hdGhhbiA8SGFyaXNoLkthc2l2aXN3
YW5hdGhhbkBhbWQuY29tPgo+IFJldmlld2VkLWJ5OiBGZWxpeCBLdWVobGluZyA8RmVsaXguS3Vl
aGxpbmdAYW1kLmNvbT4KCkhlbGxvLCBIYXJpc2ghCgpDZ3JvdXAvZGV2aWNlIGNvbnRyb2xsZXIg
cGFydCBsb29rcyBnb29kIHRvIG1lLgpQbGVhc2UsIGZlZWwgZnJlZSB0byB1c2UgbXkgYWNrcyBm
b3IgcGF0Y2hlcyAzIGFuZCA0OgpBY2tlZC1ieTogUm9tYW4gR3VzaGNoaW4gPGd1cm9AZmIuY29t
PgoKVGhhbmtzIQoKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2ZsYXRf
bWVtb3J5LmMgfCAgOSArKysrKysrLS0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2Zk
X3ByaXYuaCAgICAgICAgfCAxNyArKysrKysrKysrKysrKysrKwo+ICBkcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGtmZC9rZmRfdG9wb2xvZ3kuYyAgICB8IDEyICsrKysrKysrKysrKwo+ICAzIGZpbGVz
IGNoYW5nZWQsIDM2IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9mbGF0X21lbW9yeS5jIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2ZsYXRfbWVtb3J5LmMKPiBpbmRleCBkYzczMzk4MjVi
NWMuLjM4MDRlZGZiNGZmNyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtm
ZC9rZmRfZmxhdF9tZW1vcnkuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tm
ZF9mbGF0X21lbW9yeS5jCj4gQEAgLTM2OSw4ICszNjksMTMgQEAgaW50IGtmZF9pbml0X2FwZXJ0
dXJlcyhzdHJ1Y3Qga2ZkX3Byb2Nlc3MgKnByb2Nlc3MpCj4gIAo+ICAJLypJdGVyYXRpbmcgb3Zl
ciBhbGwgZGV2aWNlcyovCj4gIAl3aGlsZSAoa2ZkX3RvcG9sb2d5X2VudW1fa2ZkX2RldmljZXMo
aWQsICZkZXYpID09IDApIHsKPiAtCQlpZiAoIWRldikgewo+IC0JCQlpZCsrOyAvKiBTa2lwIG5v
biBHUFUgZGV2aWNlcyAqLwo+ICsJCWlmICghZGV2IHx8IGtmZF9kZXZjZ3JvdXBfY2hlY2tfcGVy
bWlzc2lvbihkZXYpKSB7Cj4gKwkJCS8qIFNraXAgbm9uIEdQVSBkZXZpY2VzIGFuZCBkZXZpY2Vz
IHRvIHdoaWNoIHRoZQo+ICsJCQkgKiBjdXJyZW50IHByb2Nlc3MgaGF2ZSBubyBhY2Nlc3MgdG8u
IEFjY2VzcyBjYW4gYmUKPiArCQkJICogbGltaXRlZCBieSBwbGFjaW5nIHRoZSBwcm9jZXNzIGlu
IGEgc3BlY2lmaWMKPiArCQkJICogY2dyb3VwIGhpZXJhcmNoeQogICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgXgoJCQkJUHJvYmFibHksIGEgbWlzc2luZyBkb3QgaGVy
ZS4KPiArCQkJICovCj4gKwkJCWlkKys7Cj4gIAkJCWNvbnRpbnVlOwo+ICAJCX0KPiAgCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGlu
ZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
