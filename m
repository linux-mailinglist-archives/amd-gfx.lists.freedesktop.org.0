Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FAF621A3C8
	for <lists+amd-gfx@lfdr.de>; Thu,  9 Jul 2020 17:31:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B4106EAA8;
	Thu,  9 Jul 2020 15:31:20 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2076.outbound.protection.outlook.com [40.107.94.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB71D6EAA6;
 Thu,  9 Jul 2020 15:31:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W4yHpoG130FHLULQmeW1VhK8vCP+XGwTmiiP1LDo88ZK//BezfKGP0ApL2xuCVRl0g6arOBA72fj72k5GEOKkN38sDBF3JB+P029zbOO1dff9lm3PQOMs7ovwo7LUzGa3wsU3sL4vaUzZ11t/XZcUoNoMqVH58GjaNYLAN5Jg3s30+rTnAl+8/I1/dzqDlI0V8gABsUzp5FpTaK9CQFoS2Ph8tyrIazT3ji8o/oenRo6SGjSdT/vCa0O0aFax5koxQuOcOZ3/XA7TBU95ztbQTsrV/1q3vUGRkHA8gjbPCIP+JSKPnlaq9h4C+Bqi2+5lPp2jgtqEriMATeZkvQ/8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JyxPOdGwNEMEdukIVrpuVRgGQEm0/xfD4SYj/04Flg8=;
 b=BqjdgRhZF0qHK+Qym3q87FjVqsjFsJHTYQAGHwXgRLB8VrUlwavgX0j5bLYZEzN8bjIo5Vpqr8h2wx8ELZcqLoQiTCiMYy5kMh8TkIcY5kdslSL0HdPxB5shlT8WYPV9D3iqTJUEMaquaEJKuxvIK5FW1zqBfqsxGhlgGZnCTzVlwjJxwr9IZHtfrXtKiGFQKHoBsRRF6gDLN2EdsbQNHlu9llJ8er073TlTj271F7yx1n6WNjKyxY2fAvTaw3oQ41YpHbS32F+IQXhupD4wcM0pFoYniQyk38C2SrwapZ6ebbo4K8nohlwo3Pd3iiFDSl6K9IiQ7k864+cqGQudGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JyxPOdGwNEMEdukIVrpuVRgGQEm0/xfD4SYj/04Flg8=;
 b=U6EjpGVhlFl5V5KrHVoay4nBgvWVYFi9NWVK08Sk4edSfQqDlYOYmAtnXa/4K7BAeVzpZ+B8htFhIBzILx79AsWSf+/axduLajJ7YTLlZybi72SFbiFVCVUn1pHx+jpaWQJLfqbAdnPOPo0+wG8cXuAIp6zCO5ugYXhzGuVpRX8=
Received: from BL0PR12MB2433.namprd12.prod.outlook.com (2603:10b6:207:4a::25)
 by BL0PR12MB2820.namprd12.prod.outlook.com (2603:10b6:208:80::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.23; Thu, 9 Jul
 2020 15:31:16 +0000
Received: from BL0PR12MB2433.namprd12.prod.outlook.com
 ([fe80::8884:f5cd:cc08:b29a]) by BL0PR12MB2433.namprd12.prod.outlook.com
 ([fe80::8884:f5cd:cc08:b29a%7]) with mapi id 15.20.3174.021; Thu, 9 Jul 2020
 15:31:15 +0000
From: "Chauhan, Madhav" <Madhav.Chauhan@amd.com>
To: =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <ckoenig.leichtzumerken@gmail.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH 2/2] drm/amdgpu: stop allocating dummy GTT nodes v2
Thread-Topic: [PATCH 2/2] drm/amdgpu: stop allocating dummy GTT nodes v2
Thread-Index: AQHWVgMEf6hnXuRZm0Sk8cnUw5R5Kqj/X35Q
Date: Thu, 9 Jul 2020 15:31:15 +0000
Message-ID: <BL0PR12MB2433BD10825958FB66285CB89C640@BL0PR12MB2433.namprd12.prod.outlook.com>
References: <20200709150956.2218-1-christian.koenig@amd.com>
 <20200709150956.2218-2-christian.koenig@amd.com>
In-Reply-To: <20200709150956.2218-2-christian.koenig@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Enabled=true;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_SetDate=2020-07-09T15:29:44Z; 
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Method=Privileged;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Name=Public_0;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_ActionId=5c2f1f54-be82-4e9e-95f1-0000cfb41ca1;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_ContentBits=1
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_enabled: true
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_setdate: 2020-07-09T15:31:13Z
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_method: Privileged
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_name: Public_0
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_actionid: 3857b031-2115-452d-ae2a-0000c9dbec8f
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_contentbits: 0
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
x-originating-ip: [122.172.189.183]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 4296de95-136d-4ede-a7ae-08d8241d1ea6
x-ms-traffictypediagnostic: BL0PR12MB2820:
x-microsoft-antispam-prvs: <BL0PR12MB28207C9C35C92F8EE8DE27B49C640@BL0PR12MB2820.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 04599F3534
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: e4nz8Gby3rmzDC0vcgkbLA15IkvZ/nFIXyUnOFGWzlTLtfI+gHWns5TCJdPdhtrZKwrgMXJZnqejoLkVnGX32Sktif9FN8ZJ7IQKype7gpIzIFE/FamlFp1TZtVueZKSahUXHifGqkTnLFRI5HSWhG63Sn2IHuw91bYG00wKu+JvEUpbzzBkwRSENO+Gy4zDbROhxT0yJ20dIBcpZZ9ix91oFpY7IQCyv6uMjHHggna1lMpphpFFl9lAmEXYRlr/dxm89cHIo0jiCzIgxS3zAROn9mAquZRpk8C6P6kGdE6efGu6ME2xy7Deaz/BPC8iaXMp0zmNTYjRLZyLM5sYoA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB2433.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(136003)(39860400002)(366004)(396003)(376002)(346002)(5660300002)(8676002)(55016002)(86362001)(33656002)(316002)(110136005)(8936002)(9686003)(26005)(83380400001)(52536014)(7696005)(478600001)(76116006)(64756008)(66556008)(66446008)(66476007)(66574015)(66946007)(186003)(71200400001)(55236004)(53546011)(6506007)(2906002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: Z1C8ER6hsnkN4X0nCJEdVUgyGhL2ng1KUDqLcn1KP/oAm6qeNeWs2h8F7akLhtkzjZ+j6I5VDyqXBJCuD2Sua8aLlDlg5IcPTq5W77lk9nLpz2qUgfkFqG7+RbjrW7bX8HdiJjmFCa6UVQNEdLkGkO3YyPZ5d0bdeUhOBQCVcRQFWHC8BPTgcBDG3CcCfNVOWaJpSw4Zy22p0wJikWcj41Y/zrWzu6Zpnpo08RgyOVTV0deIvoH83VFWp8jBw5YMp7UvEz5h6cxK+jq1npaW8Lrp6VAj8sL48sjtmHw1gefP4l7nLJx5Ua6fL1qTdeAg6DG1fdgMr+A7uPvQZxdX4O4nKnkS0pFt8HXv+M7t8MOw7UlXqpy7tP3XGOWqPCWY7/IVBqJPbpeYOTSNGlg+RyFH2hwSBj84fl1WD1qJvuQ6dF58JtKSdmfgTXouthNAsSW7ROsSTLxoZQwGOfV1beFqytmkP3RPgGOTCan4Q1zIlDioo4VGIk5TKV8DpNYr
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2433.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4296de95-136d-4ede-a7ae-08d8241d1ea6
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2020 15:31:15.8465 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zRbNFXlf9LJhxWSkPzf5MC8dgiyTE5p748x40brcmIcPziVIU9M31l3SKXHH3cF/t4uaPefQyVrrD0tvj9rYFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2820
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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

W0FNRCBQdWJsaWMgVXNlXQ0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogQ2hy
aXN0aWFuIEvDtm5pZyA8Y2tvZW5pZy5sZWljaHR6dW1lcmtlbkBnbWFpbC5jb20+IA0KU2VudDog
VGh1cnNkYXksIEp1bHkgOSwgMjAyMCA4OjQwIFBNDQpUbzogYW1kLWdmeEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmc7IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCkNjOiBDaGF1aGFuLCBN
YWRoYXYgPE1hZGhhdi5DaGF1aGFuQGFtZC5jb20+DQpTdWJqZWN0OiBbUEFUQ0ggMi8yXSBkcm0v
YW1kZ3B1OiBzdG9wIGFsbG9jYXRpbmcgZHVtbXkgR1RUIG5vZGVzIHYyDQoNCk5vdyB0aGF0IFRU
TSBpcyBmaXhlZCB1cCB3ZSBjYW4gZmluYWxseSBzdG9wIHRoYXQgbm9uc2Vuc2UuDQoNCnYyOiBV
cGRhdGUgdGhlIGRvY3VtZW50YXRpb24gYXMgd2VsbC4NCg0KTEdUTSwgUmV2aWV3ZWQtYnk6IE1h
ZGhhdiBDaGF1aGFuIDxtYWRoYXYuY2hhdWhhbkBhbWQuY29tPg0KDQpSZWdhcmRzLA0KTWFkaGF2
DQoNClNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1k
LmNvbT4NCi0tLQ0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9ndHRfbWdyLmMg
fCAxMDYgKysrKysrLS0tLS0tLS0tLS0tLS0NCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfdHRtLmMgICAgIHwgIDE4ICsrKy0NCiAyIGZpbGVzIGNoYW5nZWQsIDQzIGluc2VydGlv
bnMoKyksIDgxIGRlbGV0aW9ucygtKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X2d0dF9tZ3IuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9ndHRfbWdyLmMNCmluZGV4IDJjMjBkMjNkNjJkMS4uMGM0NDM1MmFkNWViIDEwMDY0NA0K
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2d0dF9tZ3IuYw0KKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2d0dF9tZ3IuYw0KQEAgLTE1MCw2MCAr
MTUwLDcgQEAgc3RhdGljIGludCBhbWRncHVfZ3R0X21ncl9maW5pKHN0cnVjdCB0dG1fbWVtX3R5
cGVfbWFuYWdlciAqbWFuKQ0KICAqLw0KIGJvb2wgYW1kZ3B1X2d0dF9tZ3JfaGFzX2dhcnRfYWRk
cihzdHJ1Y3QgdHRtX21lbV9yZWcgKm1lbSkgIHsNCi0Jc3RydWN0IGFtZGdwdV9ndHRfbm9kZSAq
bm9kZSA9IG1lbS0+bW1fbm9kZTsNCi0NCi0JcmV0dXJuIChub2RlLT5ub2RlLnN0YXJ0ICE9IEFN
REdQVV9CT19JTlZBTElEX09GRlNFVCk7DQotfQ0KLQ0KLS8qKg0KLSAqIGFtZGdwdV9ndHRfbWdy
X2FsbG9jIC0gYWxsb2NhdGUgbmV3IHJhbmdlcw0KLSAqDQotICogQG1hbjogVFRNIG1lbW9yeSB0
eXBlIG1hbmFnZXINCi0gKiBAdGJvOiBUVE0gQk8gd2UgbmVlZCB0aGlzIHJhbmdlIGZvcg0KLSAq
IEBwbGFjZTogcGxhY2VtZW50IGZsYWdzIGFuZCByZXN0cmljdGlvbnMNCi0gKiBAbWVtOiB0aGUg
cmVzdWx0aW5nIG1lbSBvYmplY3QNCi0gKg0KLSAqIEFsbG9jYXRlIHRoZSBhZGRyZXNzIHNwYWNl
IGZvciBhIG5vZGUuDQotICovDQotc3RhdGljIGludCBhbWRncHVfZ3R0X21ncl9hbGxvYyhzdHJ1
Y3QgdHRtX21lbV90eXBlX21hbmFnZXIgKm1hbiwNCi0JCQkJc3RydWN0IHR0bV9idWZmZXJfb2Jq
ZWN0ICp0Ym8sDQotCQkJCWNvbnN0IHN0cnVjdCB0dG1fcGxhY2UgKnBsYWNlLA0KLQkJCQlzdHJ1
Y3QgdHRtX21lbV9yZWcgKm1lbSkNCi17DQotCXN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2ID0g
YW1kZ3B1X3R0bV9hZGV2KG1hbi0+YmRldik7DQotCXN0cnVjdCBhbWRncHVfZ3R0X21nciAqbWdy
ID0gbWFuLT5wcml2Ow0KLQlzdHJ1Y3QgYW1kZ3B1X2d0dF9ub2RlICpub2RlID0gbWVtLT5tbV9u
b2RlOw0KLQllbnVtIGRybV9tbV9pbnNlcnRfbW9kZSBtb2RlOw0KLQl1bnNpZ25lZCBsb25nIGZw
Zm4sIGxwZm47DQotCWludCByOw0KLQ0KLQlpZiAoYW1kZ3B1X2d0dF9tZ3JfaGFzX2dhcnRfYWRk
cihtZW0pKQ0KLQkJcmV0dXJuIDA7DQotDQotCWlmIChwbGFjZSkNCi0JCWZwZm4gPSBwbGFjZS0+
ZnBmbjsNCi0JZWxzZQ0KLQkJZnBmbiA9IDA7DQotDQotCWlmIChwbGFjZSAmJiBwbGFjZS0+bHBm
bikNCi0JCWxwZm4gPSBwbGFjZS0+bHBmbjsNCi0JZWxzZQ0KLQkJbHBmbiA9IGFkZXYtPmdhcnQu
bnVtX2NwdV9wYWdlczsNCi0NCi0JbW9kZSA9IERSTV9NTV9JTlNFUlRfQkVTVDsNCi0JaWYgKHBs
YWNlICYmIHBsYWNlLT5mbGFncyAmIFRUTV9QTF9GTEFHX1RPUERPV04pDQotCQltb2RlID0gRFJN
X01NX0lOU0VSVF9ISUdIOw0KLQ0KLQlzcGluX2xvY2soJm1nci0+bG9jayk7DQotCXIgPSBkcm1f
bW1faW5zZXJ0X25vZGVfaW5fcmFuZ2UoJm1nci0+bW0sICZub2RlLT5ub2RlLCBtZW0tPm51bV9w
YWdlcywNCi0JCQkJCW1lbS0+cGFnZV9hbGlnbm1lbnQsIDAsIGZwZm4sIGxwZm4sDQotCQkJCQlt
b2RlKTsNCi0Jc3Bpbl91bmxvY2soJm1nci0+bG9jayk7DQotDQotCWlmICghcikNCi0JCW1lbS0+
c3RhcnQgPSBub2RlLT5ub2RlLnN0YXJ0Ow0KLQ0KLQlyZXR1cm4gcjsNCisJcmV0dXJuIG1lbS0+
bW1fbm9kZSAhPSBOVUxMOw0KIH0NCiANCiAvKioNCkBAIC0yMTQsNyArMTYxLDcgQEAgc3RhdGlj
IGludCBhbWRncHVfZ3R0X21ncl9hbGxvYyhzdHJ1Y3QgdHRtX21lbV90eXBlX21hbmFnZXIgKm1h
biwNCiAgKiBAcGxhY2U6IHBsYWNlbWVudCBmbGFncyBhbmQgcmVzdHJpY3Rpb25zDQogICogQG1l
bTogdGhlIHJlc3VsdGluZyBtZW0gb2JqZWN0DQogICoNCi0gKiBEdW1teSwgYWxsb2NhdGUgdGhl
IG5vZGUgYnV0IG5vIHNwYWNlIGZvciBpdCB5ZXQuDQorICogR1RUIGFjY291bnRpbmcgYW5kIEdB
UlQgbm9kZSBhbGxvY2F0aW9uIGlmIG5lY2Vzc2FyeS4NCiAgKi8NCiBzdGF0aWMgaW50IGFtZGdw
dV9ndHRfbWdyX25ldyhzdHJ1Y3QgdHRtX21lbV90eXBlX21hbmFnZXIgKm1hbiwNCiAJCQkgICAg
ICBzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKnRibywgQEAgLTIzNCwyOSArMTgxLDM3IEBAIHN0
YXRpYyBpbnQgYW1kZ3B1X2d0dF9tZ3JfbmV3KHN0cnVjdCB0dG1fbWVtX3R5cGVfbWFuYWdlciAq
bWFuLA0KIAlhdG9taWM2NF9zdWIobWVtLT5udW1fcGFnZXMsICZtZ3ItPmF2YWlsYWJsZSk7DQog
CXNwaW5fdW5sb2NrKCZtZ3ItPmxvY2spOw0KIA0KKwlpZiAoIXBsYWNlLT5scGZuKSB7DQorCQlt
ZW0tPm1tX25vZGUgPSBOVUxMOw0KKwkJbWVtLT5zdGFydCA9IEFNREdQVV9CT19JTlZBTElEX09G
RlNFVDsNCisJCXJldHVybiAwOw0KKwl9DQorDQogCW5vZGUgPSBremFsbG9jKHNpemVvZigqbm9k
ZSksIEdGUF9LRVJORUwpOw0KIAlpZiAoIW5vZGUpIHsNCiAJCXIgPSAtRU5PTUVNOw0KIAkJZ290
byBlcnJfb3V0Ow0KIAl9DQogDQotCW5vZGUtPm5vZGUuc3RhcnQgPSBBTURHUFVfQk9fSU5WQUxJ
RF9PRkZTRVQ7DQotCW5vZGUtPm5vZGUuc2l6ZSA9IG1lbS0+bnVtX3BhZ2VzOw0KIAlub2RlLT50
Ym8gPSB0Ym87DQotCW1lbS0+bW1fbm9kZSA9IG5vZGU7DQogDQotCWlmIChwbGFjZS0+ZnBmbiB8
fCBwbGFjZS0+bHBmbiB8fCBwbGFjZS0+ZmxhZ3MgJiBUVE1fUExfRkxBR19UT1BET1dOKSB7DQot
CQlyID0gYW1kZ3B1X2d0dF9tZ3JfYWxsb2MobWFuLCB0Ym8sIHBsYWNlLCBtZW0pOw0KLQkJaWYg
KHVubGlrZWx5KHIpKSB7DQotCQkJa2ZyZWUobm9kZSk7DQotCQkJbWVtLT5tbV9ub2RlID0gTlVM
TDsNCi0JCQlnb3RvIGVycl9vdXQ7DQotCQl9DQotCX0gZWxzZSB7DQotCQltZW0tPnN0YXJ0ID0g
bm9kZS0+bm9kZS5zdGFydDsNCi0JfQ0KKwlzcGluX2xvY2soJm1nci0+bG9jayk7DQorCXIgPSBk
cm1fbW1faW5zZXJ0X25vZGVfaW5fcmFuZ2UoJm1nci0+bW0sICZub2RlLT5ub2RlLCBtZW0tPm51
bV9wYWdlcywNCisJCQkJCW1lbS0+cGFnZV9hbGlnbm1lbnQsIDAsIHBsYWNlLT5mcGZuLA0KKwkJ
CQkJcGxhY2UtPmxwZm4sIERSTV9NTV9JTlNFUlRfQkVTVCk7DQorCXNwaW5fdW5sb2NrKCZtZ3It
PmxvY2spOw0KKw0KKwlpZiAodW5saWtlbHkocikpDQorCQlnb3RvIGVycl9mcmVlOw0KKw0KKwlt
ZW0tPm1tX25vZGUgPSBub2RlOw0KKwltZW0tPnN0YXJ0ID0gbm9kZS0+bm9kZS5zdGFydDsNCiAN
CiAJcmV0dXJuIDA7DQorDQorZXJyX2ZyZWU6DQorCWtmcmVlKG5vZGUpOw0KKw0KIGVycl9vdXQ6
DQogCWF0b21pYzY0X2FkZChtZW0tPm51bV9wYWdlcywgJm1nci0+YXZhaWxhYmxlKTsNCiANCkBA
IC0yNzksMTcgKzIzNCwxNCBAQCBzdGF0aWMgdm9pZCBhbWRncHVfZ3R0X21ncl9kZWwoc3RydWN0
IHR0bV9tZW1fdHlwZV9tYW5hZ2VyICptYW4sDQogCXN0cnVjdCBhbWRncHVfZ3R0X21nciAqbWdy
ID0gbWFuLT5wcml2Ow0KIAlzdHJ1Y3QgYW1kZ3B1X2d0dF9ub2RlICpub2RlID0gbWVtLT5tbV9u
b2RlOw0KIA0KLQlpZiAoIW5vZGUpDQotCQlyZXR1cm47DQotDQotCXNwaW5fbG9jaygmbWdyLT5s
b2NrKTsNCi0JaWYgKG5vZGUtPm5vZGUuc3RhcnQgIT0gQU1ER1BVX0JPX0lOVkFMSURfT0ZGU0VU
KQ0KKwlpZiAobm9kZSkgew0KKwkJc3Bpbl9sb2NrKCZtZ3ItPmxvY2spOw0KIAkJZHJtX21tX3Jl
bW92ZV9ub2RlKCZub2RlLT5ub2RlKTsNCi0Jc3Bpbl91bmxvY2soJm1nci0+bG9jayk7DQotCWF0
b21pYzY0X2FkZChtZW0tPm51bV9wYWdlcywgJm1nci0+YXZhaWxhYmxlKTsNCisJCXNwaW5fdW5s
b2NrKCZtZ3ItPmxvY2spOw0KKwkJa2ZyZWUobm9kZSk7DQorCX0NCiANCi0Ja2ZyZWUobm9kZSk7
DQotCW1lbS0+bW1fbm9kZSA9IE5VTEw7DQorCWF0b21pYzY0X2FkZChtZW0tPm51bV9wYWdlcywg
Jm1nci0+YXZhaWxhYmxlKTsNCiB9DQogDQogLyoqDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X3R0bS5jDQppbmRleCAzOGQyYTdmYjU2OTguLjUwNTAzZjg2MGZjZSAxMDA2NDQNCi0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYw0KKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jDQpAQCAtNDI5LDEyICs0MjksMjIgQEAg
aW50IGFtZGdwdV90dG1fY29weV9tZW1fdG9fbWVtKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2
LA0KIAl9DQogDQogCXNyY19vZmZzZXQgPSBzcmMtPm9mZnNldDsNCi0Jc3JjX21tID0gYW1kZ3B1
X2ZpbmRfbW1fbm9kZShzcmMtPm1lbSwgJnNyY19vZmZzZXQpOw0KLQlzcmNfbm9kZV9zaXplID0g
KHNyY19tbS0+c2l6ZSA8PCBQQUdFX1NISUZUKSAtIHNyY19vZmZzZXQ7DQorCWlmIChzcmMtPm1l
bS0+bW1fbm9kZSkgew0KKwkJc3JjX21tID0gYW1kZ3B1X2ZpbmRfbW1fbm9kZShzcmMtPm1lbSwg
JnNyY19vZmZzZXQpOw0KKwkJc3JjX25vZGVfc2l6ZSA9IChzcmNfbW0tPnNpemUgPDwgUEFHRV9T
SElGVCkgLSBzcmNfb2Zmc2V0Ow0KKwl9IGVsc2Ugew0KKwkJc3JjX21tID0gTlVMTDsNCisJCXNy
Y19ub2RlX3NpemUgPSBVTExPTkdfTUFYOw0KKwl9DQogDQogCWRzdF9vZmZzZXQgPSBkc3QtPm9m
ZnNldDsNCi0JZHN0X21tID0gYW1kZ3B1X2ZpbmRfbW1fbm9kZShkc3QtPm1lbSwgJmRzdF9vZmZz
ZXQpOw0KLQlkc3Rfbm9kZV9zaXplID0gKGRzdF9tbS0+c2l6ZSA8PCBQQUdFX1NISUZUKSAtIGRz
dF9vZmZzZXQ7DQorCWlmIChkc3QtPm1lbS0+bW1fbm9kZSkgew0KKwkJZHN0X21tID0gYW1kZ3B1
X2ZpbmRfbW1fbm9kZShkc3QtPm1lbSwgJmRzdF9vZmZzZXQpOw0KKwkJZHN0X25vZGVfc2l6ZSA9
IChkc3RfbW0tPnNpemUgPDwgUEFHRV9TSElGVCkgLSBkc3Rfb2Zmc2V0Ow0KKwl9IGVsc2Ugew0K
KwkJZHN0X21tID0gTlVMTDsNCisJCWRzdF9ub2RlX3NpemUgPSBVTExPTkdfTUFYOw0KKwl9DQog
DQogCW11dGV4X2xvY2soJmFkZXYtPm1tYW4uZ3R0X3dpbmRvd19sb2NrKTsNCiANCi0tDQoyLjE3
LjENCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1n
ZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeAo=
