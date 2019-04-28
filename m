Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD6EB5A0
	for <lists+amd-gfx@lfdr.de>; Sun, 28 Apr 2019 09:44:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 465438913E;
	Sun, 28 Apr 2019 07:44:23 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810050.outbound.protection.outlook.com [40.107.81.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2A49891B8
 for <amd-gfx@lists.freedesktop.org>; Sun, 28 Apr 2019 07:44:18 +0000 (UTC)
Received: from BYAPR12MB3176.namprd12.prod.outlook.com (20.179.92.82) by
 BYAPR12MB2933.namprd12.prod.outlook.com (20.179.91.202) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.12; Sun, 28 Apr 2019 07:44:17 +0000
Received: from BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::9118:73f2:809c:22c7]) by BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::9118:73f2:809c:22c7%4]) with mapi id 15.20.1835.010; Sun, 28 Apr 2019
 07:44:17 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 20/27] drm/amdkfd: Fix gfx8 MEM_VIOL exception handler
Thread-Topic: [PATCH 20/27] drm/amdkfd: Fix gfx8 MEM_VIOL exception handler
Thread-Index: AQHU/ZYukEjgH38lMU6DZkqnn5efWA==
Date: Sun, 28 Apr 2019 07:44:17 +0000
Message-ID: <20190428074331.30107-21-Felix.Kuehling@amd.com>
References: <20190428074331.30107-1-Felix.Kuehling@amd.com>
In-Reply-To: <20190428074331.30107-1-Felix.Kuehling@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
x-mailer: git-send-email 2.17.1
x-clientproxiedby: YTXPR0101CA0015.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::28) To BYAPR12MB3176.namprd12.prod.outlook.com
 (2603:10b6:a03:133::18)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7eff80ae-c279-4935-1d16-08d6cbad5145
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:BYAPR12MB2933; 
x-ms-traffictypediagnostic: BYAPR12MB2933:
x-microsoft-antispam-prvs: <BYAPR12MB293311124392CEE235BE167292380@BYAPR12MB2933.namprd12.prod.outlook.com>
x-forefront-prvs: 0021920B5A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(396003)(136003)(346002)(376002)(366004)(199004)(189003)(50226002)(81156014)(76176011)(54906003)(6512007)(4326008)(81166006)(8676002)(2616005)(3846002)(97736004)(186003)(8936002)(6116002)(6506007)(86362001)(36756003)(305945005)(6486002)(6436002)(7736002)(386003)(5640700003)(14444005)(25786009)(11346002)(26005)(6916009)(1076003)(99286004)(256004)(5660300002)(2351001)(486006)(52116002)(2906002)(73956011)(71200400001)(2501003)(14454004)(53936002)(71190400001)(66476007)(66556008)(68736007)(66066001)(476003)(316002)(72206003)(102836004)(478600001)(64756008)(66946007)(66446008)(446003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB2933;
 H:BYAPR12MB3176.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ExXryl7+IDtkrXvYTpX0ASnzNUHXcNHz8Nk5f/oiN2RpJRokHdLLx0Cj1Wh63Gc9eQKMRltF+Gq999Qzy6dL6eJ8YPwOWLXHJL1qkW3nbBc2DwVifqZsYL4VPBPm53CTh6LRYNPg1wCxWlQqLk/6hVp5yFcxXEop8PqzwhfnLvM7nHk9ZuwC1yZc8S/i3KbPs/hI1G1HXOScOD9jmHJgHVObS7BFGJrvyRLBpdewKM/sivpoPWhpOF5fH9z8hMTX8tgR0UCqdfnB7apG/in6iAtakuC13qpbMESNz8mJcV/21hUsjKHw4aO4VU8B1TbWWwGCzEOgYKH1In7mjwhPDZopkP8mW+58RUKOHcY+TuMORbu52yd9bkfBVx/M15owDk6eqC2GTsGrJfgeCjn+7eAjBaNeM1s1NTzbCTOpv5A=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7eff80ae-c279-4935-1d16-08d6cbad5145
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2019 07:44:17.5240 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2933
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RG8JrJVorukLg0u8qoJh0EDdbWiIcGzRPyCyfcg36g0=;
 b=csVPV3JRwiq1WBvPf4cDIPhlh1TwDAUQJH0OUMcde0ocNbkkmFc13XAUXqjLpfGw4sK0MWlu20xt7xo9lb5sZuK65p/i6Zw3fJ+3EOPgj9cfKqXHqmHUFOkpumhOOA8tTK5jUZWIr+iEWkFl6/Yt2Kl1PuC+EtlxC82vJNQpcC8=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Felix.Kuehling@amd.com; 
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
Cc: "Kuehling, Felix" <Felix.Kuehling@amd.com>, "Cornwall,
 Jay" <Jay.Cornwall@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSmF5IENvcm53YWxsIDxKYXkuQ29ybndhbGxAYW1kLmNvbT4NCg0KV2hlbiBNRU1fVklP
TCBpcyBhc3NlcnRlZCB0aGUgY29udGV4dCBzYXZlIGhhbmRsZXIgcmV3aW5kcyB0aGUNCnByb2dy
YW0gY291bnRlci4gVGhpcyBpcyBpbmNvcnJlY3QgZm9yIGFueSBzb3VyY2Ugb2YgdGhlIGV4Y2Vw
dGlvbi4NCk1FTV9WSU9MIG1heSBiZSByYWlzZWQgaW4gbm9ybWFsIG9wZXJhdGlvbiBieSBvdXQt
b2YtYm91bmRzIGFjY2Vzcw0KdG8gTERTIG9yIEdEUyBhbmQgZG9lcyBub3QgcmVxdWlyZSBzcGVj
aWFsIGhhbmRsaW5nLg0KDQpSZW1vdmUgUEMgYWRqdXN0bWVudCB3aGVuIE1FTV9WSU9MIGhhcyBi
ZWVuIHJhaXNlZC4NCg0KU2lnbmVkLW9mZi1ieTogSmF5IENvcm53YWxsIDxKYXkuQ29ybndhbGxA
YW1kLmNvbT4NClJldmlld2VkLWJ5OiBGZWxpeCBLdWVobGluZyA8RmVsaXguS3VlaGxpbmdAYW1k
LmNvbT4NClNpZ25lZC1vZmYtYnk6IEZlbGl4IEt1ZWhsaW5nIDxGZWxpeC5LdWVobGluZ0BhbWQu
Y29tPg0KLS0tDQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQvY3dzcl90cmFwX2hhbmRsZXIu
aCAgICAgIHwgIDkgKystLS0tLS0tDQogLi4uL2dwdS9kcm0vYW1kL2FtZGtmZC9jd3NyX3RyYXBf
aGFuZGxlcl9nZng4LmFzbSAgIHwgMTMgLS0tLS0tLS0tLS0tLQ0KIDIgZmlsZXMgY2hhbmdlZCwg
MiBpbnNlcnRpb25zKCspLCAyMCBkZWxldGlvbnMoLSkNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1ka2ZkL2N3c3JfdHJhcF9oYW5kbGVyLmggYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGtmZC9jd3NyX3RyYXBfaGFuZGxlci5oDQppbmRleCAzNjIxZWZiZDU3NTkuLmVjOWE5
YTk5ZjgwOCAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2N3c3JfdHJh
cF9oYW5kbGVyLmgNCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2N3c3JfdHJhcF9o
YW5kbGVyLmgNCkBAIC0yMSw3ICsyMSw3IEBADQogICovDQogDQogc3RhdGljIGNvbnN0IHVpbnQz
Ml90IGN3c3JfdHJhcF9nZng4X2hleFtdID0gew0KLQkweGJmODIwMDAxLCAweGJmODIwMTJiLA0K
KwkweGJmODIwMDAxLCAweGJmODIwMTIxLA0KIAkweGI4ZjRmODAyLCAweDg5NzQ4Njc0LA0KIAkw
eGI4ZjVmODAzLCAweDg2NzVmZjc1LA0KIAkweDAwMDAwNDAwLCAweGJmODUwMDE3LA0KQEAgLTM2
LDEyICszNiw3IEBAIHN0YXRpYyBjb25zdCB1aW50MzJfdCBjd3NyX3RyYXBfZ2Z4OF9oZXhbXSA9
IHsNCiAJMHg4NjcxZmY3MSwgMHgwMDAwZmZmZiwNCiAJMHg4ZjcyODM3NCwgMHhiOTcyZTBjMiwN
CiAJMHhiZjgwMDAwMiwgMHhiOTc0MDAwMiwNCi0JMHhiZTgwMWY3MCwgMHhiOGY1ZjgwMywNCi0J
MHg4Njc1ZmY3NSwgMHgwMDAwMDEwMCwNCi0JMHhiZjg0MDAwNiwgMHhiZWZhMDA4MCwNCi0JMHhi
OTdhMDIwMywgMHg4NjcxZmY3MSwNCi0JMHgwMDAwZmZmZiwgMHg4MGYwODg3MCwNCi0JMHg4MmYx
ODA3MSwgMHhiZWZhMDA4MCwNCisJMHhiZTgwMWY3MCwgMHhiZWZhMDA4MCwNCiAJMHhiOTdhMDI4
MywgMHhiZWY2MDA2OCwNCiAJMHhiZWY3MDA2OSwgMHhiOGZhMWMwNywNCiAJMHg4ZTdhOWM3YSwg
MHg4NzcxN2E3MSwNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9jd3Ny
X3RyYXBfaGFuZGxlcl9nZng4LmFzbSBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2N3c3Jf
dHJhcF9oYW5kbGVyX2dmeDguYXNtDQppbmRleCBhYmUxYTVkYTI5ZmIuLmE0N2Y1YjkzMzEyMCAx
MDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2N3c3JfdHJhcF9oYW5kbGVy
X2dmeDguYXNtDQorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9jd3NyX3RyYXBfaGFu
ZGxlcl9nZng4LmFzbQ0KQEAgLTI4MiwxOSArMjgyLDYgQEAgaWYgRzhTUl9ERUJVR19USU1FU1RB
TVANCiAgICAgICAgIHNfd2FpdGNudCBsZ2ttY250KDApICAgICAgICAgLy9GSVhNRSwgd2lsbCBj
YXVzZSB4bmFjaz8/DQogZW5kDQogDQotICAgIC8vY2hlY2sgd2hldGhlciB0aGVyZSBpcyBtZW1f
dmlvbA0KLSAgICBzX2dldHJlZ19iMzIgICAgc19zYXZlX3RyYXBzdHMsIGh3cmVnKEhXX1JFR19U
UkFQU1RTKQ0KLSAgICBzX2FuZF9iMzIgICBzX3NhdmVfdHJhcHN0cywgc19zYXZlX3RyYXBzdHMs
IFNRX1dBVkVfVFJBUFNUU19NRU1fVklPTF9NQVNLDQotICAgIHNfY2JyYW5jaF9zY2MwICBMX05P
X1BDX1JFV0lORA0KLQ0KLSAgICAvL2lmIHNvLCBuZWVkIHJld2luZCBQQyBhc3N1bWluZyBHRFMg
b3BlcmF0aW9uIGdldHMgTkFDS2VkDQotICAgIHNfbW92X2IzMiAgICAgICBzX3NhdmVfdG1wLCAw
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAvL2NsZWFyIG1lbV92aW9sIGJpdA0KLSAgICBzX3NldHJlZ19iMzIgICAgaHdyZWcoSFdfUkVH
X1RSQVBTVFMsIFNRX1dBVkVfVFJBUFNUU19NRU1fVklPTF9TSElGVCwgMSksIHNfc2F2ZV90bXAg
ICAgLy9jbGVhciBtZW1fdmlvbCBiaXQNCi0gICAgc19hbmRfYjMyICAgICAgIHNfc2F2ZV9wY19o
aSwgc19zYXZlX3BjX2hpLCAweDAwMDBmZmZmICAgIC8vcGNbNDc6MzJdDQotICAgIHNfc3ViX3Uz
MiAgICAgICBzX3NhdmVfcGNfbG8sIHNfc2F2ZV9wY19sbywgOCAgICAgICAgICAgICAvL3BjWzMx
OjBdLTgNCi0gICAgc19zdWJiX3UzMiAgICAgIHNfc2F2ZV9wY19oaSwgc19zYXZlX3BjX2hpLCAw
eDAgICAgICAgICAgIC8vIC1zY2MNCi0NCi1MX05PX1BDX1JFV0lORDoNCiAgICAgc19tb3ZfYjMy
ICAgICAgIHNfc2F2ZV90bXAsIDAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIC8vY2xlYXIgc2F2ZUN0eCBiaXQNCiAgICAgc19zZXRyZWdf
YjMyICAgIGh3cmVnKEhXX1JFR19UUkFQU1RTLCBTUV9XQVZFX1RSQVBTVFNfU0FWRUNUWF9TSElG
VCwgMSksIHNfc2F2ZV90bXAgICAgIC8vY2xlYXIgc2F2ZUN0eCBiaXQNCiANCi0tIA0KMi4xNy4x
DQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1n
ZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
