Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E09CC2D1A5
	for <lists+amd-gfx@lfdr.de>; Wed, 29 May 2019 00:44:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3982389F85;
	Tue, 28 May 2019 22:44:42 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680088.outbound.protection.outlook.com [40.107.68.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2083B89F85
 for <amd-gfx@lists.freedesktop.org>; Tue, 28 May 2019 22:44:41 +0000 (UTC)
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB3244.namprd12.prod.outlook.com (20.179.105.156) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.15; Tue, 28 May 2019 22:44:35 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::5964:8c3c:1b5b:c480]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::5964:8c3c:1b5b:c480%2]) with mapi id 15.20.1922.021; Tue, 28 May 2019
 22:44:35 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 0/2] Two HMM patches from MMOTS
Thread-Topic: [PATCH 0/2] Two HMM patches from MMOTS
Thread-Index: AQHVFabsSI2UxPcbZU2Wwi+nl956cA==
Date: Tue, 28 May 2019 22:44:35 +0000
Message-ID: <20190528224419.14124-1-Felix.Kuehling@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
x-mailer: git-send-email 2.17.1
x-clientproxiedby: YTBPR01CA0029.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::42) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 05b64a08-f0e6-4863-c9d2-08d6e3be0ed7
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DM6PR12MB3244; 
x-ms-traffictypediagnostic: DM6PR12MB3244:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DM6PR12MB32443C788A1BA07033F42F62921E0@DM6PR12MB3244.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3383;
x-forefront-prvs: 00514A2FE6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(39860400002)(396003)(376002)(346002)(366004)(199004)(189003)(73956011)(66476007)(305945005)(5640700003)(66556008)(53936002)(186003)(316002)(64756008)(66946007)(81166006)(81156014)(66446008)(6916009)(71190400001)(8676002)(68736007)(7736002)(50226002)(6436002)(966005)(71200400001)(1076003)(4744005)(36756003)(2906002)(72206003)(14454004)(86362001)(478600001)(5660300002)(25786009)(52116002)(6506007)(6486002)(386003)(2616005)(14444005)(6512007)(2351001)(99286004)(8936002)(26005)(2501003)(476003)(486006)(66066001)(3846002)(6306002)(102836004)(6116002)(256004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3244;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: iuZMe5KCxm5xGUZaEUa3hP8xCl03jqsJ8KNjQUY0RBLj0jyFsMZJ31qHksvmf48f/IMWe8KVgTDlYDcrzz9yS/zHZjFpm4f6KeNHsKdVcsafsDbtCnPtxS0Yn/oumsFFt8RBulm1teYSSKuwrzreOtyUSFV+I3tFjhyUX2BM4HwFXEWK2tENn6CbQlUvkV+aRDVMWHcvbviBXHctjdPtzL9mO3pccHaZt4ef6+WxLfcx7xSZHkBP8C4qsQUUPKsO4Jnr+XknfrRtcapdF7XdxXHH7Xm7TlXwD1G8o5qM7RapkdsG3ANjTkTo4e+7EHFTdpNuofJ09lLRG08BSChyM0EenuUUCZnS97vq4B0rbKzhsSRqzdY8izkm7j0JGBrjQYlQhBmpRfz2IX+c2CAZnzYhmiKbKctuTQEKVoMmJZw=
Content-ID: <00F648AFB590E040B9ACF280DCD619D7@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05b64a08-f0e6-4863-c9d2-08d6e3be0ed7
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2019 22:44:35.4316 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fkuehlin@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3244
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x565gKgOHGLvHp5T3URssVcdCZ7Q/m043hkKaat9nRY=;
 b=aWaOJHu+BbLReUqXYcINWhJHepNwvtvwI5LmjdhU4gnzxk/sN8k5tTIFjb+wrziqNNc1mw/FM47NIeln1zaZcYga/8bfr7oHMQL8z5hVxByP6/1SVD4N8dg8G49s0Qew2JNzNikrAAtbupp7aPZm5RLo7u/my6AA45ZP6e4L0kw=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhlc2UgYXJlIHR3byBpbXBvcnRhbnQgSE1NIGJ1ZyBmaXhlcyB0byBmaXggdGhlIEhNTS1iYXNl
ZCB1c2VycHRyDQppbXBsZW1lbnRhdGlvbi4gVGhleSBhcmUgYWxyZWFkIHN0YWdlZCBpbiBNTU9U
UzoNCmh0dHBzOi8vd3d3Lm96bGFicy5vcmcvfmFrcG0vbW1vdHMvYnJva2VuLW91dC8NCg0KS3Vl
aGxpbmcsIEZlbGl4ICgxKToNCiAgbW0vaG1tLmM6IG9ubHkgc2V0IEZBVUxUX0ZMQUdfQUxMT1df
UkVUUlkgZm9yIG5vbi1ibG9ja2luZw0KDQpQaGlsaXAgWWFuZyAoMSk6DQogIG1tL2htbS5jOiBz
dXBwb3J0IGF1dG9tYXRpYyBOVU1BIGJhbGFuY2luZw0KDQogbW0vaG1tLmMgfCA0ICsrLS0NCiAx
IGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KDQotLSANCjIu
MTcuMQ0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwph
bWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
