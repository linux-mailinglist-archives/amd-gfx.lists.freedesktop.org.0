Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F417C85B80
	for <lists+amd-gfx@lfdr.de>; Thu,  8 Aug 2019 09:23:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DF996E78F;
	Thu,  8 Aug 2019 07:23:13 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam03on0625.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe48::625])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EE056E78F
 for <amd-gfx@lists.freedesktop.org>; Thu,  8 Aug 2019 07:23:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XNSYC3HkKuqlbzsv1mwB8X28I9bRDa2Lx2vf39M//tqKyeL4PKm2TziFBbmXB57YSP/xEJgKY87BGPJpIWyWliGFNcR8QHuCCD0tyB64LH+zluu71dTPoU6vfWGA7T8xZ8FfVWBgJVot2GbSWTl+NU1RyszQSEgb3A/TSD5Lc/+cDim3hXnKvBTPgZrPjY5SRWjjVi/MPC2YYD8//rnLXLLw+CT3oO7Zr0kKrII0aJSdjTnkDSWrW4ClAN/mztk2phNJOKI/8P6xWlyA5wJVmpZe/PQzqL89O1AA2wa377VriOpGaN3u2T1lz0AMtUfweJfq8O3AEMI8HH5lCsxLrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v49xt2RCHz5e36BqstOvuNCRvw0PQjWlE4Pf4tRp/O8=;
 b=dGKM/S8CUxBIPzFm+kmcvxnKuWt2CB1vjQc9XmNirEIKzKOAMqP3rpCck1w4cCowtd2vVFXK7wefb412R7rnGRDJ++CflgjBe1SWV3onXwk4JkMFlsq9fEjNq8v9xmv00fbHvO1kAbcloYdkg9wMUH0X4pPkeymPZGKUmhqnvx5yjrEvRmBd7s4ftAYoqpMoDj7gTNpwtzDRrA3kNnPAMdMzkxovlKSphpSAAe5GH0PqODgg5EjWMoOwENCWNzacTCL/h5YqKYqtP36RODaAenGPbE2N1aiQCM43IYi0wV4bjQQAi9v9JONJzJ4u1bdqWppunOCGFoGlqtcWQi2a3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BYAPR12MB2709.namprd12.prod.outlook.com (20.177.124.10) by
 BYAPR12MB2887.namprd12.prod.outlook.com (20.179.91.24) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.14; Thu, 8 Aug 2019 07:23:07 +0000
Received: from BYAPR12MB2709.namprd12.prod.outlook.com
 ([fe80::f598:f57:e1cc:3b0b]) by BYAPR12MB2709.namprd12.prod.outlook.com
 ([fe80::f598:f57:e1cc:3b0b%5]) with mapi id 15.20.2136.018; Thu, 8 Aug 2019
 07:23:07 +0000
From: "Chen, Guchun" <Guchun.Chen@amd.com>
To: "Zhou1, Tao" <Tao.Zhou1@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "Zhang, Hawking" <Hawking.Zhang@amd.com>,
 "Li, Dennis" <Dennis.Li@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>
Subject: RE: [PATCH] drm/amdgpu: add sub block parameter in ras inject command
Thread-Topic: [PATCH] drm/amdgpu: add sub block parameter in ras inject command
Thread-Index: AQHVTbVLgqU/gvlcVUijHe4/T+D9eabw2GkQ
Date: Thu, 8 Aug 2019 07:23:06 +0000
Message-ID: <BYAPR12MB2709FDC3B533F037ED981E6EF1D70@BYAPR12MB2709.namprd12.prod.outlook.com>
References: <20190808064802.32759-1-tao.zhou1@amd.com>
In-Reply-To: <20190808064802.32759-1-tao.zhou1@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d7c440dc-0aa4-4fd9-b14a-08d71bd14291
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BYAPR12MB2887; 
x-ms-traffictypediagnostic: BYAPR12MB2887:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB28872475117E16DA34CDB25AF1D70@BYAPR12MB2887.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:419;
x-forefront-prvs: 012349AD1C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(366004)(346002)(39860400002)(136003)(396003)(13464003)(199004)(189003)(66066001)(4326008)(52536014)(86362001)(66446008)(66476007)(66556008)(64756008)(76116006)(66946007)(446003)(53936002)(102836004)(186003)(74316002)(26005)(25786009)(55016002)(6306002)(9686003)(256004)(6246003)(2906002)(486006)(476003)(11346002)(229853002)(966005)(305945005)(478600001)(14454004)(6636002)(71190400001)(76176011)(7736002)(71200400001)(53546011)(6506007)(7696005)(8936002)(5660300002)(99286004)(3846002)(6116002)(8676002)(81156014)(81166006)(2501003)(6436002)(110136005)(316002)(33656002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB2887;
 H:BYAPR12MB2709.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ylqFodzpHzYjeHXZX1elzbeUhlt7+Yu9am2k0bljKQktGx2hyT96ZZ15Hoie/sb/OUL2B92Bou6TuLG9oq9nG2cFWBgiYqH+MVzMS9qDFmncgdoldm22HGBNALwcYY2Z/DB8d1QkEoI0mWkh2mLOmrJnKT/crn31e7rpv4hY7uH/mXl9/3rrM3BkRtEc0zn8KdshlBqFo5v5IRbkMJKSrhqat0/JzRZ9giwpSXfMFyzf5gtRSU46Czg0RpPOfTJVjReH9L9h9qe3Ur35pKpO2vAdWFWldYBSGL5UldV+Q1I5llXCKSzPGPTt7kMHNdH29PUa3Rx1vPxQvDYzv1AogPekUxih47IBmvxzZkuLB1KSPjVH8l93VVjFx6QUI1h/yzN0iBPZY5Z6Fx7z14K4193U9FpTbkDrvUhzXfGrgRE=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7c440dc-0aa4-4fd9-b14a-08d71bd14291
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2019 07:23:07.3404 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: guchchen@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2887
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v49xt2RCHz5e36BqstOvuNCRvw0PQjWlE4Pf4tRp/O8=;
 b=NRSkSEbZvmctoFjqYYjVdTVoFUsSpAIS4edJW544DAn2NmEJJ21kpxLFWFWeEF8KxEIhe16r2ATZST4hNVfoqfifig9t3wD0/ihq0W46aA3mqGNEYJ/Fd/47EhBoSM5Kbc5AT6FpuRtnYcKdD7VvkKj869Y/7dRzlBAPoIQ3yVg=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Guchun.Chen@amd.com; 
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
Cc: "Zhou1, Tao" <Tao.Zhou1@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEd1Y2h1biBDaGVuIDxndWNodW4uY2hlbkBhbWQuY29tPg0KDQotLS0tLU9y
aWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogYW1kLWdmeCA8YW1kLWdmeC1ib3VuY2VzQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mIFRhbyBaaG91DQpTZW50OiBUaHVyc2RheSwg
QXVndXN0IDgsIDIwMTkgMjo0OCBQTQ0KVG86IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
OyBaaGFuZywgSGF3a2luZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPjsgQ2hlbiwgR3VjaHVuIDxH
dWNodW4uQ2hlbkBhbWQuY29tPjsgTGksIERlbm5pcyA8RGVubmlzLkxpQGFtZC5jb20+OyBQYW4s
IFhpbmh1aSA8WGluaHVpLlBhbkBhbWQuY29tPg0KQ2M6IFpob3UxLCBUYW8gPFRhby5aaG91MUBh
bWQuY29tPg0KU3ViamVjdDogW1BBVENIXSBkcm0vYW1kZ3B1OiBhZGQgc3ViIGJsb2NrIHBhcmFt
ZXRlciBpbiByYXMgaW5qZWN0IGNvbW1hbmQNCg0KcmFzIHN1YiBibG9jayBpbmRleCBjb3VsZCBi
ZSBwYXNzZWQgZnJvbSBzaGVsbCBjb21tYW5kDQoNClNpZ25lZC1vZmYtYnk6IFRhbyBaaG91IDx0
YW8uemhvdTFAYW1kLmNvbT4NCi0tLQ0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9yYXMuYyB8IDE3ICsrKysrKysrKystLS0tLS0tDQogMSBmaWxlIGNoYW5nZWQsIDEwIGluc2Vy
dGlvbnMoKyksIDcgZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfcmFzLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfcmFzLmMNCmluZGV4IDM2OTY1MTI0N2IyMy4uYmM3NjZjZGJlYWFlIDEwMDY0NA0KLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jDQorKysgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMNCkBAIC0xMjksNiArMTI5LDcgQEAgc3RhdGlj
IGludCBhbWRncHVfcmFzX2RlYnVnZnNfY3RybF9wYXJzZV9kYXRhKHN0cnVjdCBmaWxlICpmLA0K
IAljaGFyIGVycls5XSA9ICJ1ZSI7DQogCWludCBvcCA9IC0xOw0KIAlpbnQgYmxvY2tfaWQ7DQor
CXVpbnQzMl90IHN1Yl9ibG9jazsNCiAJdTY0IGFkZHJlc3MsIHZhbHVlOw0KIA0KIAlpZiAoKnBv
cykNCkBAIC0xNjcsMTEgKzE2OCwxMiBAQCBzdGF0aWMgaW50IGFtZGdwdV9yYXNfZGVidWdmc19j
dHJsX3BhcnNlX2RhdGEoc3RydWN0IGZpbGUgKmYsDQogCQlkYXRhLT5vcCA9IG9wOw0KIA0KIAkJ
aWYgKG9wID09IDIpIHsNCi0JCQlpZiAoc3NjYW5mKHN0ciwgIiUqcyAlKnMgJSpzICVsbHUgJWxs
dSIsDQotCQkJCQkJJmFkZHJlc3MsICZ2YWx1ZSkgIT0gMikNCi0JCQkJaWYgKHNzY2FuZihzdHIs
ICIlKnMgJSpzICUqcyAweCVsbHggMHglbGx4IiwNCi0JCQkJCQkJJmFkZHJlc3MsICZ2YWx1ZSkg
IT0gMikNCisJCQlpZiAoc3NjYW5mKHN0ciwgIiUqcyAlKnMgJSpzICV1ICVsbHUgJWxsdSIsDQor
CQkJCQkJJnN1Yl9ibG9jaywgJmFkZHJlc3MsICZ2YWx1ZSkgIT0gMykNCisJCQkJaWYgKHNzY2Fu
ZihzdHIsICIlKnMgJSpzICUqcyAweCV4IDB4JWxseCAweCVsbHgiLA0KKwkJCQkJCQkmc3ViX2Js
b2NrLCAmYWRkcmVzcywgJnZhbHVlKSAhPSAzKQ0KIAkJCQkJcmV0dXJuIC1FSU5WQUw7DQorCQkJ
ZGF0YS0+aGVhZC5zdWJfYmxvY2tfaW5kZXggPSBzdWJfYmxvY2s7DQogCQkJZGF0YS0+aW5qZWN0
LmFkZHJlc3MgPSBhZGRyZXNzOw0KIAkJCWRhdGEtPmluamVjdC52YWx1ZSA9IHZhbHVlOw0KIAkJ
fQ0KQEAgLTIxNiw3ICsyMTgsNyBAQCBzdGF0aWMgaW50IGFtZGdwdV9yYXNfZGVidWdmc19jdHJs
X3BhcnNlX2RhdGEoc3RydWN0IGZpbGUgKmYsDQogICogd3JpdGUgdGhlIHN0cnVjdCB0byB0aGUg
Y29udHJvbCBub2RlLg0KICAqDQogICogYmFzaDoNCi0gKiBlY2hvIG9wIGJsb2NrIFtlcnJvciBb
YWRkcmVzcyB2YWx1ZV1dID4gLi4uL3Jhcy9yYXNfY3RybA0KKyAqIGVjaG8gb3AgYmxvY2sgW2Vy
cm9yIFtzdWJfYmxjb2sgYWRkcmVzcyB2YWx1ZV1dID4gLi4uL3Jhcy9yYXNfY3RybA0KICAqCW9w
OiBkaXNhYmxlLCBlbmFibGUsIGluamVjdA0KICAqCQlkaXNhYmxlOiBvbmx5IGJsb2NrIGlzIG5l
ZWRlZA0KICAqCQllbmFibGU6IGJsb2NrIGFuZCBlcnJvciBhcmUgbmVlZGVkDQpAQCAtMjI2LDEw
ICsyMjgsMTEgQEAgc3RhdGljIGludCBhbWRncHVfcmFzX2RlYnVnZnNfY3RybF9wYXJzZV9kYXRh
KHN0cnVjdCBmaWxlICpmLA0KICAqCWVycm9yOiB1ZSwgY2UNCiAgKgkJdWU6IG11bHRpX3VuY29y
cmVjdGFibGUNCiAgKgkJY2U6IHNpbmdsZV9jb3JyZWN0YWJsZQ0KKyAqCXN1Yl9ibG9jazogc3Vi
IGJsb2NrIGluZGV4LCBwYXNzIDAgaWYgdGhlcmUgaXMgbm8gc3ViIGJsb2NrDQogICoNCiAgKiBo
ZXJlIGFyZSBzb21lIGV4YW1wbGVzIGZvciBiYXNoIGNvbW1hbmRzLA0KLSAqCWVjaG8gaW5qZWN0
IHVtYyB1ZSAweDAgMHgwID4gL3N5cy9rZXJuZWwvZGVidWcvZHJpLzAvcmFzL3Jhc19jdHJsDQot
ICoJZWNobyBpbmplY3QgdW1jIGNlIDAgMCA+IC9zeXMva2VybmVsL2RlYnVnL2RyaS8wL3Jhcy9y
YXNfY3RybA0KKyAqCWVjaG8gaW5qZWN0IHVtYyB1ZSAweDAgMHgwIDB4MCA+IC9zeXMva2VybmVs
L2RlYnVnL2RyaS8wL3Jhcy9yYXNfY3RybA0KKyAqCWVjaG8gaW5qZWN0IHVtYyBjZSAwIDAgMCA+
IC9zeXMva2VybmVsL2RlYnVnL2RyaS8wL3Jhcy9yYXNfY3RybA0KICAqCWVjaG8gZGlzYWJsZSB1
bWMgPiAvc3lzL2tlcm5lbC9kZWJ1Zy9kcmkvMC9yYXMvcmFzX2N0cmwNCiAgKg0KICAqIEhvdyB0
byBjaGVjayB0aGUgcmVzdWx0Pw0KLS0gDQoyLjE3LjENCg0KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18NCmFtZC1nZnggbWFpbGluZyBsaXN0DQphbWQtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9hbWQtZ2Z4DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ft
ZC1nZng=
