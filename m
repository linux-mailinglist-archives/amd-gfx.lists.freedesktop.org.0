Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C177C43A3
	for <lists+amd-gfx@lfdr.de>; Wed,  2 Oct 2019 00:17:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CB466E8AB;
	Tue,  1 Oct 2019 22:17:37 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam05on0620.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe50::620])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83FB96E8AB
 for <amd-gfx@lists.freedesktop.org>; Tue,  1 Oct 2019 22:17:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UtPhS6ZCB5R7q01TFx+86HaZrO7oOpqQB6OI+hzI43OuoKNhlg9E60DhObVNcgOQHKRua7R7oIY6vzQYyBxUEDWtF0WUZ4O+5H6UIGExFdUP3ZRXkfl+9TZRQCW0uYecdsurpYXuNe/F6JhczbzDeJMXOHrqEBOM6zdBbAt/kpUOtjfFRS8HxcQKRErzckIXT2DRatEChYaLUuA6VDZF/O61KIWMMgegXpi+8PfcQg0KbmOfQQyWeGfx64Ey2gAaSTrT/RZgK0NxZy+a/v3vt6QSxuNdggY4v7qITnbHd00tM+HO96f/CMm0oUfmRIm/SewknOYc4n/TNr95FmvIAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wwaB10YnNVFYn7Whc3HH9ixrH1TW6siV0VP0K50AtGw=;
 b=igiKgYlqFcQDBzFvrQSfnd4CH/7A9dLtlV215FfI0oseRavQI7/diqtnYBw9vvd2rQI8H8NjK6DSa4MTRlnHXu3o3+YOUS2rOfUp6kKuBEvRPyBBbM234x6F1POhuK2wxcAJutes+ZSj6h0B49MawLU+741pZKR93P4VcW/qYRAUYo3XJ+2jM7L/bPRmiPo1fuL7658OZp8yVIMEXzQNbO6e3kXO2SxjR0BqZAYBFVFt07eyUcYTwiGIzx4xvMh01XTcXOBeZcYxKw01TYlTHgnMra6FT3SIm1hmWD7JF3Yhqa99AznFEqDQrUJwtQnsYvvTh8TsiwxSA+8kK/KlWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB2456.namprd12.prod.outlook.com (52.132.141.37) by
 DM5PR12MB1545.namprd12.prod.outlook.com (10.172.35.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Tue, 1 Oct 2019 22:17:34 +0000
Received: from DM5PR12MB2456.namprd12.prod.outlook.com
 ([fe80::3449:def:4457:5b72]) by DM5PR12MB2456.namprd12.prod.outlook.com
 ([fe80::3449:def:4457:5b72%3]) with mapi id 15.20.2305.022; Tue, 1 Oct 2019
 22:17:34 +0000
From: "Liu, Leo" <Leo.Liu@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 2/2] drm/amdgpu: add a comment to VCN 2.5 encode ring
Thread-Topic: [PATCH 2/2] drm/amdgpu: add a comment to VCN 2.5 encode ring
Thread-Index: AQHVeKYGkNXZ3sKt/U+baGXkTzb9Sw==
Date: Tue, 1 Oct 2019 22:17:34 +0000
Message-ID: <20191001221708.20185-2-leo.liu@amd.com>
References: <20191001221708.20185-1-leo.liu@amd.com>
In-Reply-To: <20191001221708.20185-1-leo.liu@amd.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
x-clientproxiedby: YTXPR0101CA0065.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::42) To DM5PR12MB2456.namprd12.prod.outlook.com
 (2603:10b6:4:b4::37)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bb9d277d-386d-449a-1451-08d746bd2889
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: DM5PR12MB1545:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB15451EB27B9FA15CC348D300E59D0@DM5PR12MB1545.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2733;
x-forefront-prvs: 0177904E6B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(396003)(376002)(136003)(39860400002)(346002)(199004)(189003)(26005)(1076003)(66946007)(66556008)(66476007)(64756008)(478600001)(66446008)(6506007)(386003)(102836004)(86362001)(4326008)(186003)(6486002)(6436002)(5640700003)(50226002)(7736002)(256004)(305945005)(71200400001)(81156014)(71190400001)(81166006)(6116002)(3846002)(8936002)(8676002)(446003)(52116002)(6512007)(2906002)(6916009)(4744005)(99286004)(66066001)(14454004)(2501003)(76176011)(11346002)(2616005)(476003)(25786009)(5660300002)(2351001)(36756003)(316002)(486006)(54906003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1545;
 H:DM5PR12MB2456.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HLyIvt0FmGfMj4vWb2zBCvTceigbMZdw+fKGA5BFbw2SmEZ5sYY2EInMXxz83yZsavCa9g4TCT3S0PV8tBTqsBBrBuCyn4bUts+dT+5U/3T3LdmYEmWruSJWONvC1JQdVF0Ga1AsEaKFh6n0Cs7VIKElKSYYkZrQHp6fPqWlWC258VP/ek69EJOrJzOGcrZujILJmxrae0qcwZP0CwxWqf6YRtcZzpInjumTiKspv3Nqzgs5z77BENFtADI2VxPLh4xblQDYoceURo2Hc4XLoKlpqA1CdtX0ItE1HUydQUo+CsFb6Oo93x/BlDv2ifByZ6XCNHLIK+TdLNaEU4vfdkgaRYCg09S7aJ47ptSnz0F3TiH4wS1YJ4lGK77AnCEXNc8DX0P5sqPWZr0Dan1l3gO0sNF3wpHz22i/2Myv2GI=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb9d277d-386d-449a-1451-08d746bd2889
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2019 22:17:34.1268 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dZug+yJWbV63n3oErxLSLqS4xYbuPFIDhACCe40a7ZuhcNSwayPanRg7cy5Z5j9Q
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1545
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wwaB10YnNVFYn7Whc3HH9ixrH1TW6siV0VP0K50AtGw=;
 b=smSgcBEdAOePI/bFgdKPwGb9uJPQVuuo0xmsZQS4NQa1GaINiQ3tGA8mm5mVcOD0NzWc5ArsAOvDm9k1/43Wt9+BVP5MaAgnmO7eLHAfeWSq5lQ9qqOarcWTr7tlc1h+jP4nL1l/0hma2ax6RV0WfUoDlh/kQf5Q+Q274lTjc3A=
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
Cc: "Liu, Leo" <Leo.Liu@amd.com>,
 "Gustavo A . R . Silva" <gustavo@embeddedor.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

U2lnbmVkLW9mZi1ieTogTGVvIExpdSA8bGVvLmxpdUBhbWQuY29tPgpTdWdnZXN0ZWQtYnk6IEd1
c3Rhdm8gQS4gUi4gU2lsdmEgPGd1c3Rhdm9AZW1iZWRkZWRvci5jb20+CkNjOiBHdXN0YXZvIEEu
IFIuIFNpbHZhIDxndXN0YXZvQGVtYmVkZGVkb3IuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L3Zjbl92Ml81LmMgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3Zjbl92Ml81LmMgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92Y25fdjJfNS5jCmluZGV4IGNjMTk0NDQ0MzYzZi4u
MGQ1Yzk1ZDczYjYzIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92Y25f
djJfNS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3Zjbl92Ml81LmMKQEAgLTI2
NCw2ICsyNjQsNyBAQCBzdGF0aWMgaW50IHZjbl92Ml81X2h3X2luaXQodm9pZCAqaGFuZGxlKQog
CiAJCWZvciAoaSA9IDA7IGkgPCBhZGV2LT52Y24ubnVtX2VuY19yaW5nczsgKytpKSB7CiAJCQly
aW5nID0gJmFkZXYtPnZjbi5pbnN0W2pdLnJpbmdfZW5jW2ldOworCQkJLyogZGlzYWJsZSBlbmNv
ZGUgcmluZ3MgdGlsbCB0aGUgcm9idXN0bmVzcyBvZiB0aGUgRlcgKi8KIAkJCXJpbmctPnNjaGVk
LnJlYWR5ID0gZmFsc2U7CiAJCQljb250aW51ZTsKIAkJCXIgPSBhbWRncHVfcmluZ190ZXN0X2hl
bHBlcihyaW5nKTsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9h
bWQtZ2Z4
