Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7498F81326
	for <lists+amd-gfx@lfdr.de>; Mon,  5 Aug 2019 09:28:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 890E26E1F5;
	Mon,  5 Aug 2019 07:28:34 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800077.outbound.protection.outlook.com [40.107.80.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92C356E1F5
 for <amd-gfx@lists.freedesktop.org>; Mon,  5 Aug 2019 07:28:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LbMri974yoZ7oRiWL6a4TKjxZYHGIgifE9hIFXlQ1Ss8R3QMKKA1G9lDpJNN0a7MqNRPTDaJLi3Fmk7WJWIxYLxj552MdWOr4Ej2DkbPhaZ+o8tVyMa/27ZN3DpMF4KEa0gwVB13enqEZI8k32VX+DuuoFKts2Th/2PlNUHWF+/JD5CDrCEcUVqYYqIv9ZrjhosZRct57soGGtycOMp8Ba+wiTqC24nYqe7aXq+HaGY3W0woAYoF0LPPy7IG1u5ubF5DfL4MDwX3rHCIXUbJ+Wg7qy9EUZ+Buoas7IdhhWJ+oKh1/zI84KdgBKKorYTlkSLeyE02pwcDiQkDwoMYvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7T9d62OiV8c7a2e6mpUtPU6Gdja0nHKTPx46/5slnU8=;
 b=Eo6Jx6risk5Uq4METZU1+BZt8mRA4UrUA+qd3YFUoQwiIurcQsmfsly2uqnx0VgFjQiC4tTlxK7+G/Bo04ORWKycXcCaGdlYVUJ6M+FiDeXuTFbZo4Vh39c+tG9oe/+dd8GIRQzjH6Z3yTxd7fcHVuoWFHRROm4ameZwHUoUNjMiKb+Pvtahw3cOrHyQLb8JlYDGAow6Nk5uvEflcVS4O1NTHX1WwcW/SBIFHolc1x9MniNo2lvaRnbQhsm+HaYiGgy+tTW50cZqxffaQeGhQVqclxNh53xUkmIWMDlZzkx1rRAqthsQnsgHx+DHAexksC40gyT56h4nQZlGZ4W36A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from BN8PR12MB3057.namprd12.prod.outlook.com (20.178.209.144) by
 BN8PR12MB2884.namprd12.prod.outlook.com (20.178.223.210) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.17; Mon, 5 Aug 2019 07:28:30 +0000
Received: from BN8PR12MB3057.namprd12.prod.outlook.com
 ([fe80::2540:58c6:899e:f502]) by BN8PR12MB3057.namprd12.prod.outlook.com
 ([fe80::2540:58c6:899e:f502%7]) with mapi id 15.20.2136.018; Mon, 5 Aug 2019
 07:28:30 +0000
From: "Ma, Le" <Le.Ma@amd.com>
To: "Quan, Evan" <Evan.Quan@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amd/powerplay: skip pcie params override on Arcturus
Thread-Topic: [PATCH] drm/amd/powerplay: skip pcie params override on Arcturus
Thread-Index: AQHVS11C1RtlrSyuo0uoWSPZ5cmrr6bsJnmQ
Date: Mon, 5 Aug 2019 07:28:30 +0000
Message-ID: <BN8PR12MB3057B1074ACCE362FDA1361FF6DA0@BN8PR12MB3057.namprd12.prod.outlook.com>
References: <20190805071251.11093-1-evan.quan@amd.com>
In-Reply-To: <20190805071251.11093-1-evan.quan@amd.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1e976953-4ae0-46bc-4ab6-08d7197683e7
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN8PR12MB2884; 
x-ms-traffictypediagnostic: BN8PR12MB2884:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BN8PR12MB2884A2A646724872A076FC84F6DA0@BN8PR12MB2884.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2089;
x-forefront-prvs: 01208B1E18
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39850400004)(346002)(366004)(136003)(376002)(13464003)(199004)(189003)(53936002)(55016002)(6306002)(478600001)(6436002)(9686003)(6116002)(71190400001)(71200400001)(53546011)(102836004)(3846002)(81156014)(81166006)(966005)(33656002)(446003)(2906002)(305945005)(74316002)(7736002)(66066001)(8676002)(66446008)(229853002)(66476007)(66556008)(64756008)(66946007)(52536014)(486006)(476003)(14454004)(11346002)(14444005)(7696005)(86362001)(6506007)(256004)(110136005)(186003)(76116006)(68736007)(8936002)(25786009)(2501003)(5660300002)(76176011)(6246003)(26005)(316002)(99286004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB2884;
 H:BN8PR12MB3057.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: uUGr/1xLMXQrLL4A3Fq6R6yu7T+Z+SuIM9iNGNc3/GtbrtMwu4HrJb59KNquPYeytignpQ7uuDRQIhxACX5BU2vEdYgzxydNV+gPNlUIBJDJyo4uW3/GB7QEHucLG0VLh6ZSF/lAtXquUBO+l0iPyoWU3QMDYW7cKX4EMJp9SJGWLkcEQiQMi5TPBU0MBhakhh5ifzTZ1iwU0mWGWxZqMbxfpwYZoggx3eytCyg4pEkChaw+Bf1IohFqto6UhKEszkFdCUW9hQ40YKz+HiMkLml7urYdABjCfZmREQ/bxQ5Eq7Kq0u65N30gFp8HN73lgjVF9MtsVlHda8LLoKdsIK2nrmPf+8BL0D5kr7fazwijG/G14+Uu2EjRXKdHqQQWruO78Yi0o1vLpcNdjHRHI2ifc+1MAedp5lMwDGEycOI=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e976953-4ae0-46bc-4ab6-08d7197683e7
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2019 07:28:30.5223 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lema1@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB2884
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7T9d62OiV8c7a2e6mpUtPU6Gdja0nHKTPx46/5slnU8=;
 b=Q+RjDaT9sGiJC2mZT4+GQl5YPfhbxkVYgRDk+HmH63dDRBVU2rQy97UAeDO06kE3S9teokI3/jXV96H4TeRJ2XH25hOF57xUBCdnafacb/8WWpa75sBIFcwsyTBc0J4OeeT/e/bIEjwexxReNBk65EjhX8LNc2oYyqJlvXcHY5I=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Le.Ma@amd.com; 
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

UGxlYXNlIGNvbWJpbmUgdGhlIDIgY2xvc2UgImlmIChhZGV2LT5hc2ljX3R5cGUgIT0gQ0hJUF9B
UkNUVVJVUykgeyIuDQoNCldpdGggdGhhdCBmaXhlZDogUmV2aWV3ZWQtYnk6IExlIE1hIDxMZS5N
YUBhbWQuY29tPg0KDQpSZWdhcmRzLA0KTWEgTGUNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0t
LS0NCkZyb206IGFtZC1nZnggPGFtZC1nZngtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+
IE9uIEJlaGFsZiBPZiBFdmFuIFF1YW4NClNlbnQ6IE1vbmRheSwgQXVndXN0IDA1LCAyMDE5IDM6
MTMgUE0NClRvOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KQ2M6IFF1YW4sIEV2YW4g
PEV2YW4uUXVhbkBhbWQuY29tPg0KU3ViamVjdDogW1BBVENIXSBkcm0vYW1kL3Bvd2VycGxheTog
c2tpcCBwY2llIHBhcmFtcyBvdmVycmlkZSBvbiBBcmN0dXJ1cw0KDQpUaGlzIGlzIG5vdCBzdXBw
b3J0ZWQgb24gQXJjdHVydXMuDQoNCkFmZmVjdGVkIEFTSUM6IEFyY3R1cnVzDQoNCkNoYW5nZS1J
ZDogSTYyYThiY2UxN2EwNzBjZTRlZGE1ZmEyMmY0YjEyYTdmZmExMjAxY2QNClNpZ25lZC1vZmYt
Ynk6IEV2YW4gUXVhbiA8ZXZhbi5xdWFuQGFtZC5jb20+DQotLS0NCiBkcml2ZXJzL2dwdS9kcm0v
YW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMgfCA4ICsrKysrLS0tDQogMSBmaWxlIGNoYW5nZWQs
IDUgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
cG93ZXJwbGF5L2FtZGdwdV9zbXUuYw0KaW5kZXggNWJhMDM4MjYwMDkxLi43YzJjMjRhMjkxYjAg
MTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMN
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUuYw0KQEAgLTEx
MDksOSArMTEwOSwxMSBAQCBzdGF0aWMgaW50IHNtdV9zbWNfdGFibGVfaHdfaW5pdChzdHJ1Y3Qg
c211X2NvbnRleHQgKnNtdSwNCiAJaWYgKHJldCkNCiAJCXJldHVybiByZXQ7DQogDQotCXJldCA9
IHNtdV9vdmVycmlkZV9wY2llX3BhcmFtZXRlcnMoc211KTsNCi0JaWYgKHJldCkNCi0JCXJldHVy
biByZXQ7DQorCWlmIChhZGV2LT5hc2ljX3R5cGUgIT0gQ0hJUF9BUkNUVVJVUykgew0KKwkJcmV0
ID0gc211X292ZXJyaWRlX3BjaWVfcGFyYW1ldGVycyhzbXUpOw0KKwkJaWYgKHJldCkNCisJCQly
ZXR1cm4gcmV0Ow0KKwl9DQogDQogCWlmIChhZGV2LT5hc2ljX3R5cGUgIT0gQ0hJUF9BUkNUVVJV
Uykgew0KIAkJcmV0ID0gc211X25vdGlmeV9kaXNwbGF5X2NoYW5nZShzbXUpOw0KLS0gDQoyLjIy
LjANCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCmFt
ZC1nZnggbWFpbGluZyBsaXN0DQphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4DQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcg
bGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
