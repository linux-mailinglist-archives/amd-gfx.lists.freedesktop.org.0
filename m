Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B92475823
	for <lists+amd-gfx@lfdr.de>; Thu, 25 Jul 2019 21:41:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1094D6E825;
	Thu, 25 Jul 2019 19:41:42 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780087.outbound.protection.outlook.com [40.107.78.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C952B6E825
 for <amd-gfx@lists.freedesktop.org>; Thu, 25 Jul 2019 19:41:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KMgiPX2jGyQPeH2eCpLtcEBPNwjG3maLkScpMEoNNKb7E0heT1IyW7wnnCLBed9GtcSwFi/0s7FI8OxMBoZk3j3/QbGdGR9K36p3JBD55Q8ttNa+m61QdER40S7g0+c1HEzH6mNFgC27NbDPOxaQj5Dzs/ExvgKwtMp3o9KKKh1Xnk+t4A71DT9+jei8qthYq73RRrE29eDl7lOCNYu33mkpJLnGjsquQMiuA9uoHp7kz91FHdd1VAnBqYFAjTu3FgMoAoOzJ+DnPBEGbncsui+YsrSA2yo+AdJPjEPIA5lxUehfP4XDVi776z4ah3K+eN03MpEIazb6njJSV08/BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HF6Dbh7xfoURPe4u+FyWNls7FRFSCNW5+SucucPZTcw=;
 b=hbcdjOu5mEftR2w7QBEkik4zkba5jQdg4NS5qbR0e7EdN+btV7IPcOyJxPR2lZt8XS4htRn26oywxMgbJw03U22qXd1czQvzb1OaO2AywpsX+YlJB9ZMDxsqR7mb1mNcCOLcZXQ4dwWDS4KjQIbcBZSSfKpKnm3Qfy/Dz02x/Bdn1e3ydI5/qJCiXryMhh9AfXXWVO0QyKQ2bqOaln16kHz/ffd86e07ygPnxDwAJ4fKgPwcwDi3b1EjIQVl10ZIV4brttbyK4mBHVMLHH8ztPnRHALKRuQJveaxITCpjBtU72ugtZoVGJnsJokfEPrEHg8G76RiipYJD4hiwlg7sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from DM5PR12MB2456.namprd12.prod.outlook.com (52.132.141.37) by
 DM5PR12MB2536.namprd12.prod.outlook.com (52.132.141.155) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.17; Thu, 25 Jul 2019 19:41:39 +0000
Received: from DM5PR12MB2456.namprd12.prod.outlook.com
 ([fe80::2882:d83f:bf0:8cb2]) by DM5PR12MB2456.namprd12.prod.outlook.com
 ([fe80::2882:d83f:bf0:8cb2%5]) with mapi id 15.20.2115.005; Thu, 25 Jul 2019
 19:41:39 +0000
From: "Liu, Leo" <Leo.Liu@amd.com>
To: "Thai, Thong" <Thong.Thai@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v3 2/2] drm/amd/amdgpu/vcn_v2_0: Move VCN 2.0 specific dec
 ring test to vcn_v2_0
Thread-Topic: [PATCH v3 2/2] drm/amd/amdgpu/vcn_v2_0: Move VCN 2.0 specific
 dec ring test to vcn_v2_0
Thread-Index: AQHVQxT9KWZU8/hNYEmp6Od1vRjs1qbbu8eA
Date: Thu, 25 Jul 2019 19:41:38 +0000
Message-ID: <3d04cdf9-a553-8210-8bf9-3d20b824824c@amd.com>
References: <20190725181516.6114-1-thong.thai@amd.com>
 <20190725181516.6114-2-thong.thai@amd.com>
In-Reply-To: <20190725181516.6114-2-thong.thai@amd.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [2607:fea8:a21f:e10f:c8fe:3df8:eaeb:cc1d]
x-clientproxiedby: YTXPR0101CA0002.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::15) To DM5PR12MB2456.namprd12.prod.outlook.com
 (2603:10b6:4:b4::37)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e238807c-a7e8-4859-591b-08d711381c46
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB2536; 
x-ms-traffictypediagnostic: DM5PR12MB2536:
x-microsoft-antispam-prvs: <DM5PR12MB253691E8494DBD6CA769ECCBE5C10@DM5PR12MB2536.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:499;
x-forefront-prvs: 0109D382B0
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(39860400002)(376002)(136003)(366004)(396003)(199004)(189003)(110136005)(65826007)(66476007)(446003)(65806001)(31696002)(66556008)(5660300002)(68736007)(478600001)(86362001)(305945005)(66446008)(6436002)(11346002)(64756008)(52116002)(6486002)(25786009)(2501003)(76176011)(7736002)(14454004)(65956001)(36756003)(71200400001)(476003)(6116002)(71190400001)(66946007)(256004)(14444005)(386003)(6246003)(46003)(58126008)(6512007)(2616005)(81156014)(6506007)(53546011)(2906002)(53936002)(102836004)(8936002)(316002)(186003)(31686004)(64126003)(229853002)(81166006)(99286004)(486006)(8676002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB2536;
 H:DM5PR12MB2456.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 9occt2tBDloVzS4lAMzE3h+XIEWAP2uqUfWqV54GyUK39AKNz2lLtQUYVi7KVPbA7VbLLeRbIYm7rK9GmZLUqW3VpxSZ7uFkZPRlFdhA1awQoYP7dq+j2s/UEszj17NREI0EiUPOvbwGV/dBG4WtpA7oFwlrmlKP3r/aUwFjX4BPj8Ug7u6mJlpG+CbDyPWDQPZEIrNKIEdHlwGVkXZK9tD3gp22QcT/zwuXFlP7SNBiuZragUss6gbJHIRbMpQch14UYG2XDEuUqCv+tM0p8CdND6nGaR+rsk0Kwdh/KP+pUdYQ/8621don6iTANVK9b07JVG6OmwfMC3dqTYDIy1lCYJmfYxP0weiCoe1Bqn0lPRaWzMHmLTLaszLaqjhfQs9QrwssZdLfSv4BCC3eU16qMpdOPNSH+VPRxOLhRCo=
Content-ID: <6303CECFDAA4ED4B974FA7E7AE101E12@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e238807c-a7e8-4859-591b-08d711381c46
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2019 19:41:38.8036 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: leoliu@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2536
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HF6Dbh7xfoURPe4u+FyWNls7FRFSCNW5+SucucPZTcw=;
 b=FsxN7yPSNp7IMzjuNMKIbO7g+oB/QZZAKerf3D77G0nYdRUF2Rwr7p6L8IetzXJTwkkN7rKOjeLE0LzwDHloeOfDbUBWRmPYajPrvrnP9Y8OtR1fb2r4IbhxCAhuj62UwTN04QmwE+x1H9yZhvA9je3jmG3i7gpf5kYozRh5KMo=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Leo.Liu@amd.com; 
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

DQpPbiAyMDE5LTA3LTI1IDI6MTUgcC5tLiwgVGhhaSwgVGhvbmcgd3JvdGU6DQo+IFZDTiAyLjAg
ZmlybXdhcmUgbm93IHJlcXVpcmVzIGEgcGFja2V0IHN0YXJ0IGNvbW1hbmQgdG8gYmUgc2VudCBi
ZWZvcmUNCj4gYW55IG90aGVyIGRlY29kZSByaW5nIGJ1ZmZlciBjb21tYW5kLg0KPg0KPiBTaWdu
ZWQtb2ZmLWJ5OiBUaG9uZyBUaGFpIDx0aG9uZy50aGFpQGFtZC5jb20+DQo+IC0tLQ0KPiAgIGRy
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3Zjbl92Ml8wLmMgfCAzMiArKysrKysrKysrKysrKysr
KysrKysrKysrKy0NCj4gICAxIGZpbGUgY2hhbmdlZCwgMzEgaW5zZXJ0aW9ucygrKSwgMSBkZWxl
dGlvbigtKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmNu
X3YyXzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3Zjbl92Ml8wLmMNCj4gaW5kZXgg
NzA5MWFlZjk1ZmYwLi5kZTkyOGYxYjE1MjggMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L3Zjbl92Ml8wLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvdmNuX3YyXzAuYw0KPiBAQCAtMjA4Miw2ICsyMDgyLDM2IEBAIHN0YXRpYyBpbnQgdmNuX3Yy
XzBfcHJvY2Vzc19pbnRlcnJ1cHQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsDQo+ICAgCXJl
dHVybiAwOw0KPiAgIH0NCj4gICANCj4gK2ludCB2Y25fdjJfMF9kZWNfcmluZ190ZXN0X3Jpbmco
c3RydWN0IGFtZGdwdV9yaW5nICpyaW5nKQ0KDQpQbGVhc2UgdXNlIHN0YXRpYyBmdW5jdGlvbiBp
bnN0ZWFkLiBXaXRoIHRoYXQgZml4ZWQsIHRoZSBwYXRjaCBpcw0KDQpSZXZpZXdlZC1ieTogTGVv
IExpdSA8bGVvLmxpdUBhbWQuY29tPg0KDQoNCj4gK3sNCj4gKwlzdHJ1Y3QgYW1kZ3B1X2Rldmlj
ZSAqYWRldiA9IHJpbmctPmFkZXY7DQo+ICsJdWludDMyX3QgdG1wID0gMDsNCj4gKwl1bnNpZ25l
ZCBpOw0KPiArCWludCByOw0KPiArDQo+ICsJV1JFRzMyKGFkZXYtPnZjbi5leHRlcm5hbC5zY3Jh
dGNoOSwgMHhDQUZFREVBRCk7DQo+ICsJciA9IGFtZGdwdV9yaW5nX2FsbG9jKHJpbmcsIDQpOw0K
PiArCWlmIChyKQ0KPiArCQlyZXR1cm4gcjsNCj4gKwlhbWRncHVfcmluZ193cml0ZShyaW5nLCBQ
QUNLRVQwKGFkZXYtPnZjbi5pbnRlcm5hbC5jbWQsIDApKTsNCj4gKwlhbWRncHVfcmluZ193cml0
ZShyaW5nLCBWQ05fREVDX0tNRF9DTUQgfCAoVkNOX0RFQ19DTURfUEFDS0VUX1NUQVJUIDw8IDEp
KTsNCj4gKwlhbWRncHVfcmluZ193cml0ZShyaW5nLCBQQUNLRVQwKGFkZXYtPnZjbi5pbnRlcm5h
bC5zY3JhdGNoOSwgMCkpOw0KPiArCWFtZGdwdV9yaW5nX3dyaXRlKHJpbmcsIDB4REVBREJFRUYp
Ow0KPiArCWFtZGdwdV9yaW5nX2NvbW1pdChyaW5nKTsNCj4gKwlmb3IgKGkgPSAwOyBpIDwgYWRl
di0+dXNlY190aW1lb3V0OyBpKyspIHsNCj4gKwkJdG1wID0gUlJFRzMyKGFkZXYtPnZjbi5leHRl
cm5hbC5zY3JhdGNoOSk7DQo+ICsJCWlmICh0bXAgPT0gMHhERUFEQkVFRikNCj4gKwkJCWJyZWFr
Ow0KPiArCQlEUk1fVURFTEFZKDEpOw0KPiArCX0NCj4gKw0KPiArCWlmIChpID49IGFkZXYtPnVz
ZWNfdGltZW91dCkNCj4gKwkJciA9IC1FVElNRURPVVQ7DQo+ICsNCj4gKwlyZXR1cm4gcjsNCj4g
K30NCj4gKw0KPiArDQo+ICAgc3RhdGljIGludCB2Y25fdjJfMF9zZXRfcG93ZXJnYXRpbmdfc3Rh
dGUodm9pZCAqaGFuZGxlLA0KPiAgIAkJCQkJICBlbnVtIGFtZF9wb3dlcmdhdGluZ19zdGF0ZSBz
dGF0ZSkNCj4gICB7DQo+IEBAIC0yMTQ1LDcgKzIxNzUsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0
IGFtZGdwdV9yaW5nX2Z1bmNzIHZjbl92Ml8wX2RlY19yaW5nX3ZtX2Z1bmNzID0gew0KPiAgIAku
ZW1pdF9pYiA9IHZjbl92Ml8wX2RlY19yaW5nX2VtaXRfaWIsDQo+ICAgCS5lbWl0X2ZlbmNlID0g
dmNuX3YyXzBfZGVjX3JpbmdfZW1pdF9mZW5jZSwNCj4gICAJLmVtaXRfdm1fZmx1c2ggPSB2Y25f
djJfMF9kZWNfcmluZ19lbWl0X3ZtX2ZsdXNoLA0KPiAtCS50ZXN0X3JpbmcgPSBhbWRncHVfdmNu
X2RlY19yaW5nX3Rlc3RfcmluZywNCj4gKwkudGVzdF9yaW5nID0gdmNuX3YyXzBfZGVjX3Jpbmdf
dGVzdF9yaW5nLA0KPiAgIAkudGVzdF9pYiA9IGFtZGdwdV92Y25fZGVjX3JpbmdfdGVzdF9pYiwN
Cj4gICAJLmluc2VydF9ub3AgPSB2Y25fdjJfMF9kZWNfcmluZ19pbnNlcnRfbm9wLA0KPiAgIAku
aW5zZXJ0X3N0YXJ0ID0gdmNuX3YyXzBfZGVjX3JpbmdfaW5zZXJ0X3N0YXJ0LA0KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxp
c3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
