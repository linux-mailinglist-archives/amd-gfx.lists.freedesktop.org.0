Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9109EBBC94
	for <lists+amd-gfx@lfdr.de>; Mon, 23 Sep 2019 22:00:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2864F898C6;
	Mon, 23 Sep 2019 20:00:30 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-cys01nam02on0626.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe45::626])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0B2B897F3
 for <amd-gfx@lists.freedesktop.org>; Mon, 23 Sep 2019 20:00:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MoY87ioSnabGqPIGUkrkqSC3/hfk57eNMjzAcL9IUNX1cbWvrKykHLITo3T+FVpiP2LHMoEXxYFnbBeRbLP+djt6bf6Y2AMpTh6aARKNKm6GBi6o22eyrvXJZbh5L9+dmz5ikAq3X4+Q77a8RgjmuC8fWvexUBzQMXL530FJERNBQ0c2v0FwxOI7LuDFRu5RBvQkJLUs5woZeA4EJwv/ZJaOZe2zzlEZ64axAlnxP5J+PbPAiHzzVNxVLD6VWLpAFuO4yYmzr7hGvFUVu/Z34H6Q3qCmL+KCjOeK1+PCKkusQmNsvySRwYnlgehfpTQnI+tkIEWlZqy4CPvi3DpYhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=568DYkbKTsqV0R+iUnSyyPFz8Sc0W5ySG2nj4anJya4=;
 b=T5RaFcMXY4leyROi/90bsmE34eFHQELsoutlJN+PNRdY6u7V/oGn1cFxX+eSIJAGb0VWUYhAq+bpqP+UfjkBpXcBOFsh00jMzx2NpqCBa53Y/QLWIAo04JuH4c2vCzbi1huMq9CGpnnuNDML7/U6pDhtaW53IWlbg5qtlZ9fWQ8YUM4X5/Oomme8P2q34KMkzN9+8+iWe73hvnZhkmz76ar4C+QLBS2Wbl57389j3X1dJ76NIUP4xXLakFsk2fsA7sfdshL0zNbPSIxBrKRn7v12nUkGoKxIbIn4CDh6IBdub6uwj6d7LxruQBiwuq2vopKvHLrJAmWqsSR0Tv1b+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB2778.namprd12.prod.outlook.com (20.176.114.145) by
 DM6PR12MB3241.namprd12.prod.outlook.com (20.179.105.153) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.23; Mon, 23 Sep 2019 20:00:27 +0000
Received: from DM6PR12MB2778.namprd12.prod.outlook.com
 ([fe80::81aa:9739:a2c2:12fa]) by DM6PR12MB2778.namprd12.prod.outlook.com
 ([fe80::81aa:9739:a2c2:12fa%4]) with mapi id 15.20.2284.023; Mon, 23 Sep 2019
 20:00:27 +0000
From: "Zhao, Yong" <Yong.Zhao@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 2/2] drm/amdkfd: Sync gfx10 kfd2kgd_calls function pointers
Thread-Topic: [PATCH 2/2] drm/amdkfd: Sync gfx10 kfd2kgd_calls function
 pointers
Thread-Index: AQHVckmLZy6DUnnkmEe4BPQzw68jgg==
Date: Mon, 23 Sep 2019 20:00:27 +0000
Message-ID: <20190923200008.11998-2-Yong.Zhao@amd.com>
References: <20190923200008.11998-1-Yong.Zhao@amd.com>
In-Reply-To: <20190923200008.11998-1-Yong.Zhao@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTXPR0101CA0041.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::18) To DM6PR12MB2778.namprd12.prod.outlook.com
 (2603:10b6:5:50::17)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cee63a65-87ee-44eb-5cb2-08d74060ad8e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DM6PR12MB3241; 
x-ms-traffictypediagnostic: DM6PR12MB3241:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB324133A2546599C96AFE5E15F0850@DM6PR12MB3241.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1148;
x-forefront-prvs: 0169092318
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(366004)(346002)(39860400002)(396003)(199004)(189003)(86362001)(6512007)(81166006)(316002)(50226002)(6916009)(5660300002)(186003)(386003)(4326008)(5640700003)(7736002)(6436002)(36756003)(305945005)(52116002)(2906002)(6506007)(99286004)(76176011)(6486002)(102836004)(486006)(256004)(14454004)(6116002)(1076003)(25786009)(3846002)(476003)(2501003)(478600001)(66476007)(11346002)(2616005)(66446008)(66556008)(64756008)(26005)(66066001)(8676002)(446003)(8936002)(81156014)(2351001)(71200400001)(71190400001)(66946007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3241;
 H:DM6PR12MB2778.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: eQuHMdkz/sr4jCIg9qx2b3k+cHNMu15zK2GHpZ42IspwECGbgvBuH1IQ040xGEx2sGP3M01sZpLz4KTkdMqkPHgUSGv9IllrWOqiecdzB8l8QVZc0x/hpYcFU7y6Gq3yqONAh/o/eicuie9cYaOXcBWtUu+FGWh4nkeYWd6AbT86IFs05yzELwq5M/jHAlD5niNb5+AhBUklnHsoWi/jHOrKxDu/to6dK32eXAMxXI32WXa4z8Xvi/zoBAASVO0lBez/Cx5ED2MDJH5DSFaIFz4KPgZ99yvj3oZh7bQz0RxFPVr+PVjKeQsscYk44LhQA9CUTnCVBm+QC2GrDczxUKg9OIOR6nwA/TTXe97SS4NBakHTncfRqzfbTWgNgDqjn9RvPZHO3jQEVcDcFB+Lgqgpik+s+CDEPsZf66favbs=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cee63a65-87ee-44eb-5cb2-08d74060ad8e
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2019 20:00:27.1769 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LNp23bqXDfdTUac8yWt+lRPUKVHgRnyRUji+qVTY/juzY0zY0+ocxI3tqYxyEvJy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3241
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=568DYkbKTsqV0R+iUnSyyPFz8Sc0W5ySG2nj4anJya4=;
 b=un37zEe8RxfoyvQaSbLygc75LW3dpld7qm4a5Ji5GWxlPT23oBD8xmW7f0KY/oa/nfFd81VA9h9aWCQHZTcrGJgcN1nYa/Iy72gOTjtk5vCWiuTOVSyLY9O1Rod5lDiXh06PU9kHv/4iBJrGz12PpssxLPQwZOF9aMcB3SX28hA=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Yong.Zhao@amd.com; 
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
Cc: "Zhao, Yong" <Yong.Zhao@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Z2V0X2hpdmVfaWQgd2FzIG5vdCBzZXQuIEFsc28sIGFkanVzdCB0aGUgZnVuY3Rpb24gc2V0dGlu
ZyBzZXF1ZW5jZS4KCkNoYW5nZS1JZDogSTUxOTYyOTU0Y2QwNzA3ZWJlOWFhNmM4NWM3MTExMGRl
ZTk4ZDYyMDAKU2lnbmVkLW9mZi1ieTogWW9uZyBaaGFvIDxZb25nLlpoYW9AYW1kLmNvbT4KLS0t
CiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkX2dmeF92MTAuYyB8IDUg
KysrLS0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZF9nZnhf
djEwLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkX2dmeF92MTAu
YwppbmRleCBkMzcxM2U0MWFkOGIuLjNjY2FhMDg4Y2FmZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZF9nZnhfdjEwLmMKKysrIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZF9nZnhfdjEwLmMKQEAgLTE2MCwxMCArMTYw
LDExIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qga2ZkMmtnZF9jYWxscyBrZmQya2dkID0gewogCQkJ
Z2V0X2F0Y192bWlkX3Bhc2lkX21hcHBpbmdfcGFzaWQsCiAJLmdldF9hdGNfdm1pZF9wYXNpZF9t
YXBwaW5nX3ZhbGlkID0KIAkJCWdldF9hdGNfdm1pZF9wYXNpZF9tYXBwaW5nX3ZhbGlkLAorCS5n
ZXRfdGlsZV9jb25maWcgPSBhbWRncHVfYW1ka2ZkX2dldF90aWxlX2NvbmZpZywKKwkuc2V0X3Zt
X2NvbnRleHRfcGFnZV90YWJsZV9iYXNlID0gc2V0X3ZtX2NvbnRleHRfcGFnZV90YWJsZV9iYXNl
LAogCS5pbnZhbGlkYXRlX3RsYnMgPSBpbnZhbGlkYXRlX3RsYnMsCiAJLmludmFsaWRhdGVfdGxi
c192bWlkID0gaW52YWxpZGF0ZV90bGJzX3ZtaWQsCi0JLnNldF92bV9jb250ZXh0X3BhZ2VfdGFi
bGVfYmFzZSA9IHNldF92bV9jb250ZXh0X3BhZ2VfdGFibGVfYmFzZSwKLQkuZ2V0X3RpbGVfY29u
ZmlnID0gYW1kZ3B1X2FtZGtmZF9nZXRfdGlsZV9jb25maWcsCisJLmdldF9oaXZlX2lkID0gYW1k
Z3B1X2FtZGtmZF9nZXRfaGl2ZV9pZCwKIH07CiAKIHN0cnVjdCBrZmQya2dkX2NhbGxzICphbWRn
cHVfYW1ka2ZkX2dmeF8xMF8wX2dldF9mdW5jdGlvbnMoKQotLSAKMi4xNy4xCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlz
dAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
