Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82EBF115829
	for <lists+amd-gfx@lfdr.de>; Fri,  6 Dec 2019 21:21:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76F6D6FA88;
	Fri,  6 Dec 2019 20:21:55 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2086.outbound.protection.outlook.com [40.107.220.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EC4C6FA88;
 Fri,  6 Dec 2019 20:21:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZqSczaZyq+BP/bCVgrm8EjYLE/N0SgSDNds/y6uOKfQDasoQeRLZtcLBQ/5AaBlOAjJ2e6GElIy1KTYaO8H/fa4kcKYkX9KaWH3uAoYueLfFTbO9/6T44UHkFuO3TwNcT8794Y7eJgMGzqzVcSCoxzxO1jrXIS2YlDtL6RvrlDi/LX5Jpy9l9eIeKalkRrCrmcdYx+gkjkA/M4ewZ4phfY3pXVRCGX1GPWMGvF4SIfd/Fle8g8BHUi++yqrNJn92Ra9sxXNz5yewyCl4j0Lh8gw60zX00NpIbwOYbRuOgyweyxkunsA0vXZzhq2ET/YIUG/Wffn1jZHGulQYcOSFkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c9qTX9CTRJ12vDnFIpQppGAgKlfZux1kCwTPEWv4T2Y=;
 b=JjLcs9TD5lL+P8QpHt5fKsgWO1FgwujjkrFS/VE79viaK49kTVWysd1tXhfRXq6fMLYY/9rmByfVNpp0rAjhiRw3vtCm3j9GZDZ7g63VPbyQzM0MjQ3IYvagMhxweJCy3Lucc5deAOT3wGKxCgiv9ZT9D9ZUw1mZqyDNHKHK1/j9bbEQrBMN1LpSBa5OXhDExicaenwfLTICpSL97GxyA+rrYLgymnR60YlixgHKdQJZj6EBW4KzhadWF/FfswBcyV70aycbNf7FdL+EOg3QwtCq/d7ZQSyVQovdXoSzZeYKdhHWZxsx1L1d+DK9YXtRLTljysB1E8LYY4BEricO1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB1722.namprd12.prod.outlook.com (10.175.85.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.18; Fri, 6 Dec 2019 20:21:52 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::80df:f8b:e547:df84]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::80df:f8b:e547:df84%12]) with mapi id 15.20.2495.026; Fri, 6 Dec 2019
 20:21:52 +0000
From: "Zuo, Jerry" <Jerry.Zuo@amd.com>
To: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH v4] drm: Add support for DP 1.4 Compliance edid corruption
 test
Thread-Topic: [PATCH v4] drm: Add support for DP 1.4 Compliance edid
 corruption test
Thread-Index: AQHVqs0dyBuRkpvgyk2KCdqaR7BoBKetaVSg
Date: Fri, 6 Dec 2019 20:21:51 +0000
Message-ID: <DM5PR12MB1705B4C04216AB3C0ABB9AC6E55F0@DM5PR12MB1705.namprd12.prod.outlook.com>
References: <20191204180258.3906-1-Jerry.Zuo@amd.com>
In-Reply-To: <20191204180258.3906-1-Jerry.Zuo@amd.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Enabled=true;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SetDate=2019-12-06T20:21:45Z; 
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Method=Standard;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Name=Internal Use Only -
 Unrestricted;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ActionId=18252b9f-cef5-4205-9b5b-0000f2f7daa4;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ContentBits=1
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_enabled: true
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_setdate: 2019-12-06T20:21:46Z
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_method: Standard
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_name: Internal Use Only -
 Unrestricted
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_actionid: bc34c1e4-ecae-47f3-bbc9-0000953b3c18
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_contentbits: 0
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: ec7fb32f-c86d-41d2-8e55-08d77a89ee49
x-ms-traffictypediagnostic: DM5PR12MB1722:|DM5PR12MB1722:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB1722D3CB39E03BF266D942C2E55F0@DM5PR12MB1722.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:489;
x-forefront-prvs: 0243E5FD68
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(39860400002)(366004)(376002)(346002)(53754006)(13464003)(189003)(199004)(26005)(76176011)(305945005)(74316002)(102836004)(54906003)(55016002)(99286004)(9686003)(229853002)(316002)(110136005)(86362001)(66574012)(53546011)(186003)(64756008)(52536014)(2906002)(478600001)(966005)(6506007)(66446008)(66556008)(76116006)(66476007)(66946007)(71200400001)(33656002)(71190400001)(8936002)(4326008)(7696005)(5660300002)(81166006)(81156014)(8676002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1722;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XUoyTZEBlrWwAw3OkHO+2Tud7Gg67VqKIUx/l05E7ELl8Vh0SYfHEAtm7JkoV2iJQwB4Ytnej47HIzLKcOWN/1HJsBTRtRJ0lf887xD6MQnCV5ClN+umzsopsh33tASzLnvipik8/vHOVgkmtfL1OOXImzpIRycL+yE/idJOcnO77j9c0kz2rp7465cvQ0umcaMQ5YcYP4209sgUdMMev4ZATcSe5O/W5ce4zyOR7k7rH/3d4/pc0RNWvSk1LhYtlYyaLsBQqzr2MBfcUwoEj6Afs9LyjQffr8vmjfHSq5YYWGn5X4i6yDTHaKDNmVnsnU7jfgED9wAxoChDle+vdu5JxyhOi3ZJx8NkQ4AJ2sfKUwWrWXLngdH4gqBc+Xtmlj6YfEeF7q2y8AmD4BiTME0Ws3Qz2X2Eh+1mvx+BHdUZ/2mEtTCmpegXFdP2QiGLJ+31ya0f7SDSU8Oo2hTC8uSvNXun7SaWui8h+fe4vt+RheS3Pmj31BXaSZYm7qac1PtcHBXB4upEjMv9/iDZ8NtkqezltoA43j64bEtdFIkyqaj+i91lxFap5c5uE/r5
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec7fb32f-c86d-41d2-8e55-08d77a89ee49
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Dec 2019 20:21:52.1071 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UgRJ+EzQ+spo9gmHihQ59m5KbMvDIOV76it+0VPq324dLCYtTY5VdPbkIVVfOCRq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1722
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c9qTX9CTRJ12vDnFIpQppGAgKlfZux1kCwTPEWv4T2Y=;
 b=lXqEmzV2AlrugV+FPHFE4/QiHdsCG4ICQUMHm3fi5aKLbheTX8MSAePsscPNQ93UZoAKO3jn2CuG5w0xpvbyerRSouVGvV78MZVXr+9MWVoeFMjBvdJLyOTyVS3/DU37lCcvpbSUX/KcW963/UgkVTkkEbSGRqHOhHUhy5aCoZU=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Jerry.Zuo@amd.com; 
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
Cc: "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 "manasi.d.navare@intel.com" <manasi.d.navare@intel.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Wentland,
 Harry" <Harry.Wentland@amd.com>, "Kazlauskas,
 Nicholas" <Nicholas.Kazlauskas@amd.com>,
 =?iso-8859-1?Q?Ville_Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEludGVybmFsIERpc3RyaWJ1dGlvbiBPbmx5XQoKSGkg
QWxsOgoKICAgIEkganVzdCBjaGVja2VkIHRoZSBDSSByZXBvcnQgaHR0cHM6Ly9wYXRjaHdvcmsu
ZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy83MDUzMC8uIFRoZSBmYWlsdXJlcyBkZXNjcmliZWQgaW4g
dGhlcmUgYXJlIG5vdCBxdWl0ZSByZWxhdGVkIHRvIG15IHBhdGNoLiBTZWVtcyBpdCBpcyBhIGZh
bHNlLXBvc2l0aXZlLiBEb2VzIGFueW9uZSBrbm93IHNvbWV0aGluZyBhYm91dCB0aGUgaXNzdWUg
ZGVzY3JpYmVkIGluIHRoZSByZXBvcnQ/IAoKICAgIEluIGFkZGl0aW9uLCBJJ2xsIHJlc2VuZCBh
IG5ldyB2ZXJzaW9uIHRoYXQgZml4ZXMgdGhlIGNoZWNrcGF0Y2ggaXNzdWVzLgoKICAgIFRoYW5r
cyBhIGxvdC4KClJlZ2FyZHMsCkplcnJ5CgotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQpGcm9t
OiBKZXJyeSAoRmFuZ3poaSkgWnVvIDxKZXJyeS5adW9AYW1kLmNvbT4gClNlbnQ6IERlY2VtYmVy
IDQsIDIwMTkgMTowMyBQTQpUbzogaW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKQ2M6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+OyBK
YW5pIE5pa3VsYSA8amFuaS5uaWt1bGFAbGludXguaW50ZWwuY29tPjsgbWFuYXNpLmQubmF2YXJl
QGludGVsLmNvbTsgV2VudGxhbmQsIEhhcnJ5IDxIYXJyeS5XZW50bGFuZEBhbWQuY29tPjsgS2F6
bGF1c2thcywgTmljaG9sYXMgPE5pY2hvbGFzLkthemxhdXNrYXNAYW1kLmNvbT47IFNpcXVlaXJh
LCBSb2RyaWdvIDxSb2RyaWdvLlNpcXVlaXJhQGFtZC5jb20+OyBEZXVjaGVyLCBBbGV4YW5kZXIg
PEFsZXhhbmRlci5EZXVjaGVyQGFtZC5jb20+OyBadW8sIEplcnJ5IDxKZXJyeS5adW9AYW1kLmNv
bT4KU3ViamVjdDogW1BBVENIIHY0XSBkcm06IEFkZCBzdXBwb3J0IGZvciBEUCAxLjQgQ29tcGxp
YW5jZSBlZGlkIGNvcnJ1cHRpb24gdGVzdAoKVW5saWtlIERQIDEuMiBlZGlkIGNvcnJ1cHRpb24g
dGVzdCwgRFAgMS40IHJlcXVpcmVzIHRvIGNhbGN1bGF0ZSByZWFsIENSQyB2YWx1ZSBvZiB0aGUg
bGFzdCBlZGlkIGRhdGEgYmxvY2ssIGFuZCB3cml0ZSBpdCBiYWNrLgpDdXJyZW50IGVkaWQgQ1JD
IGNhbGN1bGF0ZXMgcm91dGluZSBhZGRzIHRoZSBsYXN0IENSQyBieXRlLCBhbmQgY2hlY2sgaWYg
bm9uLXplcm8uCgpUaGlzIGJlaGF2aW9yIGlzIG5vdCBhY2N1cmF0ZTsgYWN0dWFsbHksIHdlIG5l
ZWQgdG8gcmV0dXJuIHRoZSBhY3R1YWwgQ1JDIHZhbHVlIHdoZW4gY29ycnVwdGlvbiBpcyBkZXRl
Y3RlZC4KVGhpcyBjb21taXQgY2hhbmdlcyB0aGlzIGlzc3VlIGJ5IHJldHVybmluZyB0aGUgY2Fs
Y3VsYXRlZCBDUkMsIGFuZCBpbml0aWF0ZSB0aGUgcmVxdWlyZWQgc2VxdWVuY2UuCgpDaGFuZ2Ug
c2luY2UgdjMKLSBGaXggYSBtaW5vciB0eXBvLgoKQ2hhbmdlIHNpbmNlIHYyCi0gUmV3cml0ZSBj
aGVja3N1bSBjb21wdXRhdGlvbiByb3V0aW5lIHRvIGF2b2lkIGR1cGxpY2F0ZWQgY29kZS4KLSBS
ZW5hbWUgdG8gYXZvaWQgY29uZnVzaW9uLgoKQ2hhbmdlIHNpbmNlIHYxCi0gSGF2ZSBzZXBhcmF0
ZSByb3V0aW5lIGZvciByZXR1cm5pbmcgcmVhbCBDUkMuCgpTaWduZWQtb2ZmLWJ5OiBKZXJyeSAo
RmFuZ3poaSkgWnVvIDxKZXJyeS5adW9AYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJt
X2RwX2hlbHBlci5jIHwgMzUgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKIGRy
aXZlcnMvZ3B1L2RybS9kcm1fZWRpZC5jICAgICAgfCAyMyArKysrKysrKysrKysrKysrKysrLS0t
LQogaW5jbHVkZS9kcm0vZHJtX2Nvbm5lY3Rvci5oICAgICB8ICA2ICsrKysrKwogaW5jbHVkZS9k
cm0vZHJtX2RwX2hlbHBlci5oICAgICB8ICAzICsrKwogNCBmaWxlcyBjaGFuZ2VkLCA2MyBpbnNl
cnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9k
cm1fZHBfaGVscGVyLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX2hlbHBlci5jIGluZGV4IDJj
Nzg3MGFlZjQ2OS4uYzU5ZjdjOTRlYmYxIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJt
X2RwX2hlbHBlci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfaGVscGVyLmMKQEAgLTM1
MSw2ICszNTEsNDEgQEAgaW50IGRybV9kcF9kcGNkX3JlYWRfbGlua19zdGF0dXMoc3RydWN0IGRy
bV9kcF9hdXggKmF1eCwgIH0gIEVYUE9SVF9TWU1CT0woZHJtX2RwX2RwY2RfcmVhZF9saW5rX3N0
YXR1cyk7CiAKKy8qKgorICAqIGRybV9kcF9zZW5kX3JlYWxfZWRpZF9jaGVja3N1bSgpIC0gc2Vu
ZCBiYWNrIHJlYWwgZWRpZCBjaGVja3N1bSAKK3ZhbHVlCisgICogQGF1eDogRGlzcGxheVBvcnQg
QVVYIGNoYW5uZWwKKyAgKiBAcmVhbF9lZGlkX2NoZWNrc3VtOiByZWFsIGVkaWQgY2hlY2tzdW0g
Zm9yIHRoZSBsYXN0IGJsb2NrCisgICoKKyAgKiBSZXR1cm5zIHRydWUgb24gc3VjY2VzcworICAq
LworYm9vbCBkcm1fZHBfc2VuZF9yZWFsX2VkaWRfY2hlY2tzdW0oc3RydWN0IGRybV9kcF9hdXgg
KmF1eCwKKwkJCQkJdTggcmVhbF9lZGlkX2NoZWNrc3VtKQoreworCXU4IGxpbmtfZWRpZF9yZWFk
ID0gMCwgYXV0b190ZXN0X3JlcSA9IDAsIHRlc3RfcmVzcCA9IDA7CisKKwlkcm1fZHBfZHBjZF9y
ZWFkKGF1eCwgRFBfREVWSUNFX1NFUlZJQ0VfSVJRX1ZFQ1RPUiwgJmF1dG9fdGVzdF9yZXEsIDEp
OworCWF1dG9fdGVzdF9yZXEgJj0gRFBfQVVUT01BVEVEX1RFU1RfUkVRVUVTVDsKKworCWRybV9k
cF9kcGNkX3JlYWQoYXV4LCBEUF9URVNUX1JFUVVFU1QsICZsaW5rX2VkaWRfcmVhZCwgMSk7CisJ
bGlua19lZGlkX3JlYWQgJj0gRFBfVEVTVF9MSU5LX0VESURfUkVBRDsKKworCWlmICghYXV0b190
ZXN0X3JlcSB8fCAhbGlua19lZGlkX3JlYWQpIHsKKwkJRFJNX0RFQlVHX0tNUygiU291cmNlIERV
VCBkb2VzIG5vdCBzdXBwb3J0IFRFU1RfRURJRF9SRUFEXG4iKTsKKwkJcmV0dXJuIGZhbHNlOwor
CX0KKworCWRybV9kcF9kcGNkX3dyaXRlKGF1eCwgRFBfREVWSUNFX1NFUlZJQ0VfSVJRX1ZFQ1RP
UiwgJmF1dG9fdGVzdF9yZXEsIAorMSk7CisKKwkvKiBzZW5kIGJhY2sgY2hlY2tzdW0gZm9yIHRo
ZSBsYXN0IGVkaWQgZXh0ZW5zaW9uIGJsb2NrIGRhdGEgKi8KKwlkcm1fZHBfZHBjZF93cml0ZShh
dXgsIERQX1RFU1RfRURJRF9DSEVDS1NVTSwgJnJlYWxfZWRpZF9jaGVja3N1bSwgMSk7CisKKwl0
ZXN0X3Jlc3AgfD0gRFBfVEVTVF9FRElEX0NIRUNLU1VNX1dSSVRFOworCWRybV9kcF9kcGNkX3dy
aXRlKGF1eCwgRFBfVEVTVF9SRVNQT05TRSwgJnRlc3RfcmVzcCwgMSk7CisKKwlyZXR1cm4gdHJ1
ZTsKK30KK0VYUE9SVF9TWU1CT0woZHJtX2RwX3NlbmRfcmVhbF9lZGlkX2NoZWNrc3VtKTsKKwog
LyoqCiAgKiBkcm1fZHBfZG93bnN0cmVhbV9tYXhfY2xvY2soKSAtIGV4dHJhY3QgYnJhbmNoIGRl
dmljZSBtYXgKICAqICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGl4ZWwgcmF0ZSBm
b3IgbGVnYWN5IFZHQQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9lZGlkLmMgYi9k
cml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQuYyBpbmRleCA1YjMzYjdjZmQ2NDUuLjBlMzU0MDVlY2M3
NCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9lZGlkLmMKKysrIGIvZHJpdmVycy9n
cHUvZHJtL2RybV9lZGlkLmMKQEAgLTE0NTAsMTEgKzE0NTAsMjIgQEAgc3RhdGljIGludCB2YWxp
ZGF0ZV9kaXNwbGF5aWQodTggKmRpc3BsYXlpZCwgaW50IGxlbmd0aCwgaW50IGlkeCk7ICBzdGF0
aWMgaW50IGRybV9lZGlkX2Jsb2NrX2NoZWNrc3VtKGNvbnN0IHU4ICpyYXdfZWRpZCkgIHsKIAlp
bnQgaTsKLQl1OCBjc3VtID0gMDsKLQlmb3IgKGkgPSAwOyBpIDwgRURJRF9MRU5HVEg7IGkrKykK
Kwl1OCBjc3VtID0gMCwgY3JjID0gMDsKKworCWZvciAoaSA9IDA7IGkgPCBFRElEX0xFTkdUSCAt
IDE7IGkrKykKIAkJY3N1bSArPSByYXdfZWRpZFtpXTsKIAotCXJldHVybiBjc3VtOworCWNyYyA9
IDB4MTAwIC0gY3N1bTsKKworCXJldHVybiBjcmM7Cit9CisKK3N0YXRpYyBib29sIGRybV9lZGlk
X2Jsb2NrX2NoZWNrc3VtX2RpZmYoY29uc3QgdTggKnJhd19lZGlkLCB1OCAKK3JlYWxfY2hlY2tz
dW0pIHsKKwlpZiAocmF3X2VkaWRbRURJRF9MRU5HVEggLSAxXSAhPSByZWFsX2NoZWNrc3VtKQor
CQlyZXR1cm4gdHJ1ZTsKKwllbHNlCisJCXJldHVybiBmYWxzZTsKIH0KIAogc3RhdGljIGJvb2wg
ZHJtX2VkaWRfaXNfemVybyhjb25zdCB1OCAqaW5fZWRpZCwgaW50IGxlbmd0aCkgQEAgLTE1MTIs
NyArMTUyMyw3IEBAIGJvb2wgZHJtX2VkaWRfYmxvY2tfdmFsaWQodTggKnJhd19lZGlkLCBpbnQg
YmxvY2ssIGJvb2wgcHJpbnRfYmFkX2VkaWQsCiAJfQogCiAJY3N1bSA9IGRybV9lZGlkX2Jsb2Nr
X2NoZWNrc3VtKHJhd19lZGlkKTsKLQlpZiAoY3N1bSkgeworCWlmIChkcm1fZWRpZF9ibG9ja19j
aGVja3N1bV9kaWZmKHJhd19lZGlkLCBjc3VtKSkgewogCQlpZiAoZWRpZF9jb3JydXB0KQogCQkJ
KmVkaWRfY29ycnVwdCA9IHRydWU7CiAKQEAgLTE2NTMsNiArMTY2NCw3IEBAIHN0YXRpYyB2b2lk
IGNvbm5lY3Rvcl9iYWRfZWRpZChzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yLAogCQkJ
ICAgICAgIHU4ICplZGlkLCBpbnQgbnVtX2Jsb2NrcykKIHsKIAlpbnQgaTsKKwl1OCBudW1fb2Zf
ZXh0ID0gZWRpZFsweDdlXTsKIAogCWlmIChjb25uZWN0b3ItPmJhZF9lZGlkX2NvdW50ZXIrKyAm
JiAhZHJtX2RlYnVnX2VuYWJsZWQoRFJNX1VUX0tNUykpCiAJCXJldHVybjsKQEAgLTE2NzUsNiAr
MTY4Nyw5IEBAIHN0YXRpYyB2b2lkIGNvbm5lY3Rvcl9iYWRfZWRpZChzdHJ1Y3QgZHJtX2Nvbm5l
Y3RvciAqY29ubmVjdG9yLAogCQkJICAgICAgIHByZWZpeCwgRFVNUF9QUkVGSVhfTk9ORSwgMTYs
IDEsCiAJCQkgICAgICAgYmxvY2ssIEVESURfTEVOR1RILCBmYWxzZSk7CiAJfQorCisJLyogQ2Fs
Y3VsYXRlIHJlYWwgY2hlY2tzdW0gZm9yIHRoZSBsYXN0IGVkaWQgZXh0ZW5zaW9uIGJsb2NrIGRh
dGEgKi8KKwljb25uZWN0b3ItPnJlYWxfZWRpZF9jaGVja3N1bSA9IGRybV9lZGlkX2Jsb2NrX2No
ZWNrc3VtKGVkaWQgKyAKK251bV9vZl9leHQgKiBFRElEX0xFTkdUSCk7CiB9CiAKIC8qIEdldCBv
dmVycmlkZSBvciBmaXJtd2FyZSBFRElEICovCmRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1f
Y29ubmVjdG9yLmggYi9pbmNsdWRlL2RybS9kcm1fY29ubmVjdG9yLmggaW5kZXggNWY4YzMzODlk
NDZmLi44NmZjOWY2MDNmYmMgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvZHJtL2RybV9jb25uZWN0b3Iu
aAorKysgYi9pbmNsdWRlL2RybS9kcm1fY29ubmVjdG9yLmgKQEAgLTEzNDksNiArMTM0OSwxMiBA
QCBzdHJ1Y3QgZHJtX2Nvbm5lY3RvciB7CiAJICogcmV2MS4xIDQuMi4yLjYKIAkgKi8KIAlib29s
IGVkaWRfY29ycnVwdDsKKwkvKioKKwkqIEByZWFsX2VkaWRfY2hlY2tzdW06IHJlYWwgZWRpZCBj
aGVja3N1bSB2YWx1ZSBmb3IgY29ycnVwdGVkIGVkaWQgYmxvY2suCisJKiBSZXF1aXJlZCBpbiBE
aXNwbGF5cG9ydCAxLjQgY29tcGxpYW5jZSB0ZXN0aW5nCisJKiByZXYxLjEgNC4yLjIuNgorCSov
CisJdWludDhfdCByZWFsX2VkaWRfY2hlY2tzdW07CiAKIAkvKiogQGRlYnVnZnNfZW50cnk6IGRl
YnVnZnMgZGlyZWN0b3J5IGZvciB0aGlzIGNvbm5lY3RvciAqLwogCXN0cnVjdCBkZW50cnkgKmRl
YnVnZnNfZW50cnk7CmRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1fZHBfaGVscGVyLmggYi9p
bmNsdWRlL2RybS9kcm1fZHBfaGVscGVyLmggaW5kZXggNTFlY2I1MTEyZWY4Li4xZjliZDY4OGY5
MGUgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvZHJtL2RybV9kcF9oZWxwZXIuaAorKysgYi9pbmNsdWRl
L2RybS9kcm1fZHBfaGVscGVyLmgKQEAgLTE0NTUsNiArMTQ1NSw5IEBAIHN0YXRpYyBpbmxpbmUg
c3NpemVfdCBkcm1fZHBfZHBjZF93cml0ZWIoc3RydWN0IGRybV9kcF9hdXggKmF1eCwgIGludCBk
cm1fZHBfZHBjZF9yZWFkX2xpbmtfc3RhdHVzKHN0cnVjdCBkcm1fZHBfYXV4ICphdXgsCiAJCQkJ
IHU4IHN0YXR1c1tEUF9MSU5LX1NUQVRVU19TSVpFXSk7CiAKK2Jvb2wgZHJtX2RwX3NlbmRfcmVh
bF9lZGlkX2NoZWNrc3VtKHN0cnVjdCBkcm1fZHBfYXV4ICphdXgsCisJCQkJCXU4IHJlYWxfZWRp
ZF9jaGVja3N1bSk7CisKIGludCBkcm1fZHBfZG93bnN0cmVhbV9tYXhfY2xvY2soY29uc3QgdTgg
ZHBjZFtEUF9SRUNFSVZFUl9DQVBfU0laRV0sCiAJCQkJY29uc3QgdTggcG9ydF9jYXBbNF0pOwog
aW50IGRybV9kcF9kb3duc3RyZWFtX21heF9icGMoY29uc3QgdTggZHBjZFtEUF9SRUNFSVZFUl9D
QVBfU0laRV0sCi0tCjIuMTQuMQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1n
Zng=
