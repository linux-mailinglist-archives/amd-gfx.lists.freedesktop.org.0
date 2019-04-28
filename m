Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF88B598
	for <lists+amd-gfx@lfdr.de>; Sun, 28 Apr 2019 09:44:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 956408919A;
	Sun, 28 Apr 2019 07:44:16 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810055.outbound.protection.outlook.com [40.107.81.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E06789145
 for <amd-gfx@lists.freedesktop.org>; Sun, 28 Apr 2019 07:44:15 +0000 (UTC)
Received: from BYAPR12MB3176.namprd12.prod.outlook.com (20.179.92.82) by
 BYAPR12MB2933.namprd12.prod.outlook.com (20.179.91.202) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.12; Sun, 28 Apr 2019 07:44:14 +0000
Received: from BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::9118:73f2:809c:22c7]) by BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::9118:73f2:809c:22c7%4]) with mapi id 15.20.1835.010; Sun, 28 Apr 2019
 07:44:14 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 14/27] drm/amdkfd: Fix compute profile switching
Thread-Topic: [PATCH 14/27] drm/amdkfd: Fix compute profile switching
Thread-Index: AQHU/ZYsqJlr9QkUo0Sfkn0oWOV/rA==
Date: Sun, 28 Apr 2019 07:44:13 +0000
Message-ID: <20190428074331.30107-15-Felix.Kuehling@amd.com>
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
x-ms-office365-filtering-correlation-id: a44931fa-8deb-4c30-d180-08d6cbad4eb6
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:BYAPR12MB2933; 
x-ms-traffictypediagnostic: BYAPR12MB2933:
x-microsoft-antispam-prvs: <BYAPR12MB2933DFC724A4CD911BAFC7B392380@BYAPR12MB2933.namprd12.prod.outlook.com>
x-forefront-prvs: 0021920B5A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(396003)(136003)(346002)(376002)(366004)(199004)(189003)(50226002)(81156014)(76176011)(54906003)(6512007)(4326008)(81166006)(8676002)(2616005)(3846002)(97736004)(186003)(8936002)(6116002)(6506007)(86362001)(36756003)(305945005)(6486002)(6436002)(7736002)(386003)(5640700003)(14444005)(25786009)(11346002)(26005)(6916009)(1076003)(99286004)(256004)(5660300002)(2351001)(486006)(52116002)(2906002)(73956011)(71200400001)(2501003)(14454004)(53936002)(71190400001)(66476007)(66556008)(68736007)(66066001)(476003)(316002)(72206003)(102836004)(478600001)(64756008)(66946007)(66446008)(446003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB2933;
 H:BYAPR12MB3176.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: elDoi/iUGv9bCYfs3+Q0qJcVYSCEdXzX281qWp8lpAWVcICaPNvphQyqoCLDOOA31UcgYskddc4cnvQDY0SKQhFF78I06zAZIjwTYdFRgNKLJCALJPXo1PFlp523WVgqHEOzzC30VNTArS1io/pWDPqWmc3Gt3uZ5+S12xtF5d4Cztdh2AhS2GNTUC56mm13iU4ZKNFY652hq/u7Rpc/XsCQssaYw73kR0DtmjVjOYDdJx5fBZ5gNJwKpKO57Mz52m48y4SbB0XBYX+z8oKKaa+WGlpY/fOs3F8hC8W5t+XyFES4vKXea+acXUHBaDPPFItTzoQk/ZV5ACac/4Hp1moebHK2lgIAkUG/XHkViHV5JBdXOD79Cw939pydgU6QMuBS0usorko5nFdp4ejQZsg4mpmWjCKNfji1xWpGlag=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a44931fa-8deb-4c30-d180-08d6cbad4eb6
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2019 07:44:13.2060 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2933
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ip0HBPHRt852sG/3Xx2VRLPEH1vVsWTvkv3Veffpjdw=;
 b=MZAc1z8ck7BrnyhbXg6YV5xeodi7j/C9qITWAViQjUMmHcNWjqRuG2507XUYfBgw/l9NWw4AehN41u4MWgQFwSAIAGkaaVpmpfzLjtKAQALppI532wrF2EZjwcUxWhAmKjJgVJmvuopO4aHevDIQoC/lWlkm7i+A3GQjfDjirR4=
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
Cc: "Huang, JinHuiEric" <JinHuiEric.Huang@amd.com>, "Kuehling,
 Felix" <Felix.Kuehling@amd.com>, "Kasiviswanathan,
 Harish" <Harish.Kasiviswanathan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSGFyaXNoIEthc2l2aXN3YW5hdGhhbiA8SGFyaXNoLkthc2l2aXN3YW5hdGhhbkBhbWQu
Y29tPg0KDQpGaXggY29tcHV0ZSBwcm9maWxlIHN3aXRjaGluZyBvbiBwcm9jZXNzIHRlcm1pbmF0
aW9uLg0KDQpBZGQgYSBkZWRpY2F0ZWQgcmVmZXJlbmNlIGNvdW50ZXIgdG8ga2VlcCB0cmFjayBv
ZiBlbnRyeS9leGl0IHRvL2Zyb20NCmNvbXB1dGUgcHJvZmlsZS4gVGhpcyBlbmFibGVzIHN3aXRj
aGluZyBjb21wdXRlIHByb2ZpbGVzIGZvciBvdGhlcg0KcmVhc29ucyB0aGFuIHByb2Nlc3MgY3Jl
YXRpb24gb3IgdGVybWluYXRpb24uDQoNClNpZ25lZC1vZmYtYnk6IEhhcmlzaCBLYXNpdmlzd2Fu
YXRoYW4gPEhhcmlzaC5LYXNpdmlzd2FuYXRoYW5AYW1kLmNvbT4NClNpZ25lZC1vZmYtYnk6IEVy
aWMgSHVhbmcgPEppbmh1aUVyaWMuSHVhbmdAYW1kLmNvbT4NClJldmlld2VkLWJ5OiBGZWxpeCBL
dWVobGluZyA8RmVsaXguS3VlaGxpbmdAYW1kLmNvbT4NClNpZ25lZC1vZmYtYnk6IEZlbGl4IEt1
ZWhsaW5nIDxGZWxpeC5LdWVobGluZ0BhbWQuY29tPg0KLS0tDQogZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRrZmQva2ZkX2RldmljZS5jICAgICAgICAgIHwgMTYgKysrKysrKysrKysrKysrKw0KIC4u
Li9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlX3F1ZXVlX21hbmFnZXIuYyAgICB8IDExICsrKysr
Ky0tLS0tDQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX3ByaXYuaCAgICAgICAgICAg
IHwgIDcgKysrKysrKw0KIDMgZmlsZXMgY2hhbmdlZCwgMjkgaW5zZXJ0aW9ucygrKSwgNSBkZWxl
dGlvbnMoLSkNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9k
ZXZpY2UuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2UuYw0KaW5kZXgg
YzFlNGQ0NGQ2MTM3Li44MjAyYTVkYjNhMzUgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGtmZC9rZmRfZGV2aWNlLmMNCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2Zk
L2tmZF9kZXZpY2UuYw0KQEAgLTQ2Miw2ICs0NjIsNyBAQCBzdHJ1Y3Qga2ZkX2RldiAqa2dkMmtm
ZF9wcm9iZShzdHJ1Y3Qga2dkX2RldiAqa2dkLA0KIAlrZmQtPnBkZXYgPSBwZGV2Ow0KIAlrZmQt
PmluaXRfY29tcGxldGUgPSBmYWxzZTsNCiAJa2ZkLT5rZmQya2dkID0gZjJnOw0KKwlhdG9taWNf
c2V0KCZrZmQtPmNvbXB1dGVfcHJvZmlsZSwgMCk7DQogDQogCW11dGV4X2luaXQoJmtmZC0+ZG9v
cmJlbGxfbXV0ZXgpOw0KIAltZW1zZXQoJmtmZC0+ZG9vcmJlbGxfYXZhaWxhYmxlX2luZGV4LCAw
LA0KQEAgLTEwMzYsNiArMTAzNywyMSBAQCB2b2lkIGtnZDJrZmRfc2V0X3NyYW1fZWNjX2ZsYWco
c3RydWN0IGtmZF9kZXYgKmtmZCkNCiAJCWF0b21pY19pbmMoJmtmZC0+c3JhbV9lY2NfZmxhZyk7
DQogfQ0KIA0KK3ZvaWQga2ZkX2luY19jb21wdXRlX2FjdGl2ZShzdHJ1Y3Qga2ZkX2RldiAqa2Zk
KQ0KK3sNCisJaWYgKGF0b21pY19pbmNfcmV0dXJuKCZrZmQtPmNvbXB1dGVfcHJvZmlsZSkgPT0g
MSkNCisJCWFtZGdwdV9hbWRrZmRfc2V0X2NvbXB1dGVfaWRsZShrZmQtPmtnZCwgZmFsc2UpOw0K
K30NCisNCit2b2lkIGtmZF9kZWNfY29tcHV0ZV9hY3RpdmUoc3RydWN0IGtmZF9kZXYgKmtmZCkN
Cit7DQorCWludCBjb3VudCA9IGF0b21pY19kZWNfcmV0dXJuKCZrZmQtPmNvbXB1dGVfcHJvZmls
ZSk7DQorDQorCWlmIChjb3VudCA9PSAwKQ0KKwkJYW1kZ3B1X2FtZGtmZF9zZXRfY29tcHV0ZV9p
ZGxlKGtmZC0+a2dkLCB0cnVlKTsNCisJV0FSTl9PTkNFKGNvdW50IDwgMCwgIkNvbXB1dGUgcHJv
ZmlsZSByZWYuIGNvdW50IGVycm9yIik7DQorfQ0KKw0KICNpZiBkZWZpbmVkKENPTkZJR19ERUJV
R19GUykNCiANCiAvKiBUaGlzIGZ1bmN0aW9uIHdpbGwgc2VuZCBhIHBhY2thZ2UgdG8gSElRIHRv
IGhhbmcgdGhlIEhXUw0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tm
ZF9kZXZpY2VfcXVldWVfbWFuYWdlci5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2Zk
X2RldmljZV9xdWV1ZV9tYW5hZ2VyLmMNCmluZGV4IDM4YzY2YjhmZmQzMS4uYmFjMWYzNmQzOGEy
IDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZV9xdWV1
ZV9tYW5hZ2VyLmMNCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2Vf
cXVldWVfbWFuYWdlci5jDQpAQCAtNzcyLDggKzc3Miw4IEBAIHN0YXRpYyBpbnQgcmVnaXN0ZXJf
cHJvY2VzcyhzdHJ1Y3QgZGV2aWNlX3F1ZXVlX21hbmFnZXIgKmRxbSwNCiANCiAJcmV0dmFsID0g
ZHFtLT5hc2ljX29wcy51cGRhdGVfcXBkKGRxbSwgcXBkKTsNCiANCi0JaWYgKGRxbS0+cHJvY2Vz
c2VzX2NvdW50KysgPT0gMCkNCi0JCWFtZGdwdV9hbWRrZmRfc2V0X2NvbXB1dGVfaWRsZShkcW0t
PmRldi0+a2dkLCBmYWxzZSk7DQorCWRxbS0+cHJvY2Vzc2VzX2NvdW50Kys7DQorCWtmZF9pbmNf
Y29tcHV0ZV9hY3RpdmUoZHFtLT5kZXYpOw0KIA0KIAlkcW1fdW5sb2NrKGRxbSk7DQogDQpAQCAt
Nzk2LDkgKzc5Niw4IEBAIHN0YXRpYyBpbnQgdW5yZWdpc3Rlcl9wcm9jZXNzKHN0cnVjdCBkZXZp
Y2VfcXVldWVfbWFuYWdlciAqZHFtLA0KIAkJaWYgKHFwZCA9PSBjdXItPnFwZCkgew0KIAkJCWxp
c3RfZGVsKCZjdXItPmxpc3QpOw0KIAkJCWtmcmVlKGN1cik7DQotCQkJaWYgKC0tZHFtLT5wcm9j
ZXNzZXNfY291bnQgPT0gMCkNCi0JCQkJYW1kZ3B1X2FtZGtmZF9zZXRfY29tcHV0ZV9pZGxlKA0K
LQkJCQkJZHFtLT5kZXYtPmtnZCwgdHJ1ZSk7DQorCQkJZHFtLT5wcm9jZXNzZXNfY291bnQtLTsN
CisJCQlrZmRfZGVjX2NvbXB1dGVfYWN0aXZlKGRxbS0+ZGV2KTsNCiAJCQlnb3RvIG91dDsNCiAJ
CX0NCiAJfQ0KQEAgLTE0NzksNiArMTQ3OCw3IEBAIHN0YXRpYyBpbnQgcHJvY2Vzc190ZXJtaW5h
dGlvbl9ub2Nwc2NoKHN0cnVjdCBkZXZpY2VfcXVldWVfbWFuYWdlciAqZHFtLA0KIAkJCWxpc3Rf
ZGVsKCZjdXItPmxpc3QpOw0KIAkJCWtmcmVlKGN1cik7DQogCQkJZHFtLT5wcm9jZXNzZXNfY291
bnQtLTsNCisJCQlrZmRfZGVjX2NvbXB1dGVfYWN0aXZlKGRxbS0+ZGV2KTsNCiAJCQlicmVhazsN
CiAJCX0NCiAJfQ0KQEAgLTE1NjIsNiArMTU2Miw3IEBAIHN0YXRpYyBpbnQgcHJvY2Vzc190ZXJt
aW5hdGlvbl9jcHNjaChzdHJ1Y3QgZGV2aWNlX3F1ZXVlX21hbmFnZXIgKmRxbSwNCiAJCQlsaXN0
X2RlbCgmY3VyLT5saXN0KTsNCiAJCQlrZnJlZShjdXIpOw0KIAkJCWRxbS0+cHJvY2Vzc2VzX2Nv
dW50LS07DQorCQkJa2ZkX2RlY19jb21wdXRlX2FjdGl2ZShkcW0tPmRldik7DQogCQkJYnJlYWs7
DQogCQl9DQogCX0NCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRf
cHJpdi5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX3ByaXYuaA0KaW5kZXggZDFk
NjAzMzYxNzJhLi44NzMyOGM5NmIwZjEgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGtmZC9rZmRfcHJpdi5oDQorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRf
cHJpdi5oDQpAQCAtMjc5LDYgKzI3OSw5IEBAIHN0cnVjdCBrZmRfZGV2IHsNCiANCiAJLyogU1JB
TSBFQ0MgZmxhZyAqLw0KIAlhdG9taWNfdCBzcmFtX2VjY19mbGFnOw0KKw0KKwkvKiBDb21wdXRl
IFByb2ZpbGUgcmVmLiBjb3VudCAqLw0KKwlhdG9taWNfdCBjb21wdXRlX3Byb2ZpbGU7DQogfTsN
CiANCiBlbnVtIGtmZF9tZW1wb29sIHsNCkBAIC05NzcsNiArOTgwLDEwIEBAIGludCBkYmdkZXZf
d2F2ZV9yZXNldF93YXZlZnJvbnRzKHN0cnVjdCBrZmRfZGV2ICpkZXYsIHN0cnVjdCBrZmRfcHJv
Y2VzcyAqcCk7DQogDQogYm9vbCBrZmRfaXNfbG9ja2VkKHZvaWQpOw0KIA0KKy8qIENvbXB1dGUg
cHJvZmlsZSAqLw0KK3ZvaWQga2ZkX2luY19jb21wdXRlX2FjdGl2ZShzdHJ1Y3Qga2ZkX2RldiAq
ZGV2KTsNCit2b2lkIGtmZF9kZWNfY29tcHV0ZV9hY3RpdmUoc3RydWN0IGtmZF9kZXYgKmRldik7
DQorDQogLyogRGVidWdmcyAqLw0KICNpZiBkZWZpbmVkKENPTkZJR19ERUJVR19GUykNCiANCi0t
IA0KMi4xNy4xDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
