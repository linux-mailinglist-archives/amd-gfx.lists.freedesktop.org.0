Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3092B3FFE
	for <lists+amd-gfx@lfdr.de>; Mon, 16 Sep 2019 20:06:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F82E6EA1E;
	Mon, 16 Sep 2019 18:05:59 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700051.outbound.protection.outlook.com [40.107.70.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14FDB6EA1B
 for <amd-gfx@lists.freedesktop.org>; Mon, 16 Sep 2019 18:05:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gvffLxyoJ3kyfL6svspZNt9PVhKZLLH+kzyfFwsJQ+HmNxqKqw/M6NM6kUCwtnHaQwupHLTfo4QgsCn9RvR/xt0RNrbN1NtDVCSfwdU3R1jXGcl7bbhd7Lc0jdpiHjlNX7EiAw88mk6LpNbPEabKK0FVO40w8mA97X9yaGqHtEWTMRgGo+1/JQYB8WQU6ALPW2RUe/jL93Ps4C1J/ZkQOtcr/z9bdnO86iTSNyfsLAZpU/g3P1aXYuBJB/cxNqVXp33doRkpEL5B7D/5Tkf35qs5cRJvDLc4hpXn/k2mohGZP/wVGiKajse3kjlJCSqrlZ/ETep2zj1U+KbtnvHFXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qaV3tmIkmDPNM4ertYAP7SG+Vzv6SiJ4HnDgMllXyCA=;
 b=BwXCgcnwLZu/pgltjfDVOJ0+TS/UIv16RfNbznRfIO4D8rTrU6n52mTUgsC1mWu2Bbf3dTnSpJcXNpgRERc6tCvnRlmsnpNYxm8hByHH6/aS/AektLL+bgnCuHFtmsKLcT6JfdGxzJgxw9Fak1T0GmF9jV5FUhT2PAun92IBwQwpLEhqNV1166+O8Udovpxn0FgPRT9ncrgIEonWcezg/nLMMvL4oFF2JOBexGQ4VnAwyksLZvCZhph0891d6yEiu9YoZMXLglJzPuV8jaC1oxuipZR8aZhcAlCWLjNBRoJMlpNXtsLqDUI1nY0qdHR/LfLve0cfTbd3vEcAHfBkpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB2911.namprd12.prod.outlook.com (20.179.80.85) by
 MN2PR12MB3871.namprd12.prod.outlook.com (10.255.237.208) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.15; Mon, 16 Sep 2019 18:05:56 +0000
Received: from MN2PR12MB2911.namprd12.prod.outlook.com
 ([fe80::c8cf:fab8:48c1:8cee]) by MN2PR12MB2911.namprd12.prod.outlook.com
 ([fe80::c8cf:fab8:48c1:8cee%7]) with mapi id 15.20.2263.023; Mon, 16 Sep 2019
 18:05:56 +0000
From: "Kasiviswanathan, Harish" <Harish.Kasiviswanathan@amd.com>
To: "tj@kernel.org" <tj@kernel.org>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "airlied@redhat.com" <airlied@redhat.com>
Subject: [PATCH v2 3/4] device_cgroup: Export devcgroup_check_permission
Thread-Topic: [PATCH v2 3/4] device_cgroup: Export devcgroup_check_permission
Thread-Index: AQHVbLlix8wpR6fijka6GKZIrnMmXA==
Date: Mon, 16 Sep 2019 18:05:56 +0000
Message-ID: <20190916180523.27341-4-Harish.Kasiviswanathan@amd.com>
References: <20190916180523.27341-1-Harish.Kasiviswanathan@amd.com>
In-Reply-To: <20190916180523.27341-1-Harish.Kasiviswanathan@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
x-clientproxiedby: YTBPR01CA0008.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::21) To MN2PR12MB2911.namprd12.prod.outlook.com
 (2603:10b6:208:a9::21)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 13bbf530-e682-437f-8dbe-08d73ad0853f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3871; 
x-ms-traffictypediagnostic: MN2PR12MB3871:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB38716BC5B3CED3C412C5D8A58C8C0@MN2PR12MB3871.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-forefront-prvs: 0162ACCC24
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(366004)(39860400002)(376002)(136003)(199004)(189003)(50226002)(5660300002)(2906002)(486006)(76176011)(53936002)(36756003)(66946007)(6512007)(1076003)(66556008)(66476007)(64756008)(52116002)(81156014)(8676002)(66446008)(6436002)(14454004)(86362001)(478600001)(446003)(11346002)(81166006)(71190400001)(2501003)(2616005)(4326008)(476003)(71200400001)(25786009)(3846002)(14444005)(8936002)(6486002)(6116002)(256004)(54906003)(110136005)(99286004)(6506007)(66066001)(7736002)(386003)(305945005)(26005)(186003)(316002)(102836004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3871;
 H:MN2PR12MB2911.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: gyQIE8zWzFi+hbRD/fyJIf30WOcBtH1BhSBT9qPeG1W+Oxp43es5b+S/H9rDyPuSnqu7HGSdh+zSSsjbl+25gAovaoDoPzjTIul6VVsg3oyEeKjd/How1rugVTn8bg4S/cNTHERESOd9jVwGIgpKCO6d2/kb7zo4mth2NiMkMMgxRq76ls/U3KrmY+5ybrTA0GvKBEtU/7rpLPBXa48Or61pSTgkgQX+opYSeMxDKKPKwtKQ4G8VJmDZZ9yXXvnxlCNfu7pPlmCllouHPN3b8ErBVzKseGseZ0WJJiyPt0K0e0E+rFDbCo2GaN56w2qHq/ebi7Ngl/69s/ujbimKdIUa+D57Ix6lbEr5HTtbFjzS32VkA+NNS1QfS9wZXnl393m9Y3ZTse0O0izuukAEuBds1hdZtLKAcp2xPrOiYJc=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13bbf530-e682-437f-8dbe-08d73ad0853f
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2019 18:05:56.2506 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vd+PNMSdIeCCLWHmybOsoj+hLXfWsDM0Jn0yeTbjhNe7BQAWri851MJFlvbk+/a0fCi51GDN6xNOm5aADR41Xg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3871
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qaV3tmIkmDPNM4ertYAP7SG+Vzv6SiJ4HnDgMllXyCA=;
 b=t3vXtlBpC7Wh7AjeKpm2UAyBx2cYQ6GRCf3Xy9s65c6aBrdsR+Rusc28oNMYAHpq8FhbxKFckEueMLAuqcPsRbL8jqpvtlVr+QkPeLlLiYkKAxgtRs/0nT6RdWqnuKNAtIq1NuNaKaHnzHsVWYiyGBgb05DAAfXZZWoXY5TjCHI=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Harish.Kasiviswanathan@amd.com; 
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
Cc: "cgroups@vger.kernel.org" <cgroups@vger.kernel.org>, "Kasiviswanathan,
 Harish" <Harish.Kasiviswanathan@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Rm9yIEFNRCBjb21wdXRlIChhbWRrZmQpIGRyaXZlci4KCkFsbCBBTUQgY29tcHV0ZSBkZXZpY2Vz
IGFyZSBleHBvcnRlZCB2aWEgc2luZ2xlIGRldmljZSBub2RlIC9kZXYva2ZkLiBBcwphIHJlc3Vs
dCBkZXZpY2VzIGNhbm5vdCBiZSBjb250cm9sbGVkIGluZGl2aWR1YWxseSB1c2luZyBkZXZpY2Ug
Y2dyb3VwLgoKQU1EIGNvbXB1dGUgZGV2aWNlcyB3aWxsIHJlbHkgb24gaXRzIGdyYXBoaWNzIGNv
dW50ZXJwYXJ0IHRoYXQgZXhwb3NlcwovZGV2L2RyaS9yZW5kZXJOIG5vZGUgZm9yIGVhY2ggZGV2
aWNlLiBGb3IgZWFjaCB0YXNrIChiYXNlZCBvbiBpdHMKY2dyb3VwKSwgS0ZEIGRyaXZlciB3aWxs
IGNoZWNrIGlmIC9kZXYvZHJpL3JlbmRlck4gbm9kZSBpcyBhY2Nlc3NpYmxlCmJlZm9yZSBleHBv
c2luZyBpdC4KCkNoYW5nZS1JZDogSTlhZTI4M2RmNTUwYjJjMTIyZDY3ODcwYjBjZmEzMTZiZmJm
M2I2MTQKQWNrZWQtYnk6IEZlbGl4IEt1ZWhsaW5nIDxGZWxpeC5LdWVobGluZ0BhbWQuY29tPgpB
Y2tlZC1ieTogVGVqdW4gSGVvIDx0akBrZXJuZWwub3JnPgpBY2tlZC1ieTogUm9tYW4gR3VzaGNo
aW4gPGd1cm9AZmIuY29tPgpTaWduZWQtb2ZmLWJ5OiBIYXJpc2ggS2FzaXZpc3dhbmF0aGFuIDxI
YXJpc2guS2FzaXZpc3dhbmF0aGFuQGFtZC5jb20+Ci0tLQogaW5jbHVkZS9saW51eC9kZXZpY2Vf
Y2dyb3VwLmggfCAxOSArKysrLS0tLS0tLS0tLS0tLS0tCiBzZWN1cml0eS9kZXZpY2VfY2dyb3Vw
LmMgICAgICB8IDE1ICsrKysrKysrKysrKystLQogMiBmaWxlcyBjaGFuZ2VkLCAxNyBpbnNlcnRp
b25zKCspLCAxNyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2Rldmlj
ZV9jZ3JvdXAuaCBiL2luY2x1ZGUvbGludXgvZGV2aWNlX2Nncm91cC5oCmluZGV4IDg1NTdlZmUw
OTZkYy4uZmEzNWI1MmUwMDAyIDEwMDY0NAotLS0gYS9pbmNsdWRlL2xpbnV4L2RldmljZV9jZ3Jv
dXAuaAorKysgYi9pbmNsdWRlL2xpbnV4L2RldmljZV9jZ3JvdXAuaApAQCAtMTIsMjYgKzEyLDE1
IEBACiAjZGVmaW5lIERFVkNHX0RFVl9BTEwgICA0ICAvKiB0aGlzIHJlcHJlc2VudHMgYWxsIGRl
dmljZXMgKi8KIAogI2lmZGVmIENPTkZJR19DR1JPVVBfREVWSUNFCi1leHRlcm4gaW50IF9fZGV2
Y2dyb3VwX2NoZWNrX3Blcm1pc3Npb24oc2hvcnQgdHlwZSwgdTMyIG1ham9yLCB1MzIgbWlub3Is
Ci0JCQkJCXNob3J0IGFjY2Vzcyk7CitpbnQgZGV2Y2dyb3VwX2NoZWNrX3Blcm1pc3Npb24oc2hv
cnQgdHlwZSwgdTMyIG1ham9yLCB1MzIgbWlub3IsCisJCQkgICAgICAgc2hvcnQgYWNjZXNzKTsK
ICNlbHNlCi1zdGF0aWMgaW5saW5lIGludCBfX2RldmNncm91cF9jaGVja19wZXJtaXNzaW9uKHNo
b3J0IHR5cGUsIHUzMiBtYWpvciwgdTMyIG1pbm9yLAotCQkJCQkgICAgICAgc2hvcnQgYWNjZXNz
KQorc3RhdGljIGlubGluZSBpbnQgZGV2Y2dyb3VwX2NoZWNrX3Blcm1pc3Npb24oc2hvcnQgdHlw
ZSwgdTMyIG1ham9yLCB1MzIgbWlub3IsCisJCQkJCSAgICAgc2hvcnQgYWNjZXNzKQogeyByZXR1
cm4gMDsgfQogI2VuZGlmCiAKICNpZiBkZWZpbmVkKENPTkZJR19DR1JPVVBfREVWSUNFKSB8fCBk
ZWZpbmVkKENPTkZJR19DR1JPVVBfQlBGKQotc3RhdGljIGlubGluZSBpbnQgZGV2Y2dyb3VwX2No
ZWNrX3Blcm1pc3Npb24oc2hvcnQgdHlwZSwgdTMyIG1ham9yLCB1MzIgbWlub3IsCi0JCQkJCSAg
ICAgc2hvcnQgYWNjZXNzKQotewotCWludCByYyA9IEJQRl9DR1JPVVBfUlVOX1BST0dfREVWSUNF
X0NHUk9VUCh0eXBlLCBtYWpvciwgbWlub3IsIGFjY2Vzcyk7Ci0KLQlpZiAocmMpCi0JCXJldHVy
biAtRVBFUk07Ci0KLQlyZXR1cm4gX19kZXZjZ3JvdXBfY2hlY2tfcGVybWlzc2lvbih0eXBlLCBt
YWpvciwgbWlub3IsIGFjY2Vzcyk7Ci19Ci0KIHN0YXRpYyBpbmxpbmUgaW50IGRldmNncm91cF9p
bm9kZV9wZXJtaXNzaW9uKHN0cnVjdCBpbm9kZSAqaW5vZGUsIGludCBtYXNrKQogewogCXNob3J0
IHR5cGUsIGFjY2VzcyA9IDA7CmRpZmYgLS1naXQgYS9zZWN1cml0eS9kZXZpY2VfY2dyb3VwLmMg
Yi9zZWN1cml0eS9kZXZpY2VfY2dyb3VwLmMKaW5kZXggZGMyODkxNGZhNzJlLi4wNGRkMjliZjdm
MDYgMTAwNjQ0Ci0tLSBhL3NlY3VyaXR5L2RldmljZV9jZ3JvdXAuYworKysgYi9zZWN1cml0eS9k
ZXZpY2VfY2dyb3VwLmMKQEAgLTgwMSw4ICs4MDEsOCBAQCBzdHJ1Y3QgY2dyb3VwX3N1YnN5cyBk
ZXZpY2VzX2NncnBfc3Vic3lzID0gewogICoKICAqIHJldHVybnMgMCBvbiBzdWNjZXNzLCAtRVBF
Uk0gY2FzZSB0aGUgb3BlcmF0aW9uIGlzIG5vdCBwZXJtaXR0ZWQKICAqLwotaW50IF9fZGV2Y2dy
b3VwX2NoZWNrX3Blcm1pc3Npb24oc2hvcnQgdHlwZSwgdTMyIG1ham9yLCB1MzIgbWlub3IsCi0J
CQkJIHNob3J0IGFjY2VzcykKK3N0YXRpYyBpbnQgX19kZXZjZ3JvdXBfY2hlY2tfcGVybWlzc2lv
bihzaG9ydCB0eXBlLCB1MzIgbWFqb3IsIHUzMiBtaW5vciwKKwkJCQkJc2hvcnQgYWNjZXNzKQog
ewogCXN0cnVjdCBkZXZfY2dyb3VwICpkZXZfY2dyb3VwOwogCWJvb2wgcmM7CkBAIC04MjQsMyAr
ODI0LDE0IEBAIGludCBfX2RldmNncm91cF9jaGVja19wZXJtaXNzaW9uKHNob3J0IHR5cGUsIHUz
MiBtYWpvciwgdTMyIG1pbm9yLAogCiAJcmV0dXJuIDA7CiB9CisKK2ludCBkZXZjZ3JvdXBfY2hl
Y2tfcGVybWlzc2lvbihzaG9ydCB0eXBlLCB1MzIgbWFqb3IsIHUzMiBtaW5vciwgc2hvcnQgYWNj
ZXNzKQoreworCWludCByYyA9IEJQRl9DR1JPVVBfUlVOX1BST0dfREVWSUNFX0NHUk9VUCh0eXBl
LCBtYWpvciwgbWlub3IsIGFjY2Vzcyk7CisKKwlpZiAocmMpCisJCXJldHVybiAtRVBFUk07CisK
KwlyZXR1cm4gX19kZXZjZ3JvdXBfY2hlY2tfcGVybWlzc2lvbih0eXBlLCBtYWpvciwgbWlub3Is
IGFjY2Vzcyk7Cit9CitFWFBPUlRfU1lNQk9MKGRldmNncm91cF9jaGVja19wZXJtaXNzaW9uKTsK
LS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
